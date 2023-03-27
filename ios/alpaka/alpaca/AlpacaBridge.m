//
//  AlpacaBridge.m
//  alpaca
//
//  Created by onexip / Matthias Hänel on 25.03.23.
//

#import <Foundation/Foundation.h>
#import "AlpacaBridge.h"
#include "chat.h"

@implementation AlpacaBridge  {
    NSString *modelPath;
}

void responseCallback(const void* target, const char * response)
{
    AlpacaBridge *nativeBridge = (__bridge AlpacaBridge *)target;
    NSString *responseNSString =
        [NSString stringWithCString:response
                           encoding:[NSString defaultCStringEncoding]];

    [nativeBridge->_delegate alpacaResponse:responseNSString];
}

- (void)setModelPath:(NSString*)modelPath
{
    self->modelPath = modelPath;
}

- (void)submitQuestion:(NSString*)question
{
    const char *char_modelPath = [modelPath UTF8String];
    unsigned int modelPathLength = [modelPath length];
    printf("char_modelPath: %s\n", char_modelPath );
    
    const char *char_Prompt = [question UTF8String];
    unsigned int promptLength = [question length];
    printf("char_Prompt: %s\n", char_Prompt );
    
    setResponseCallback((__bridge const void *)self, responseCallback);
    
    int argc = 4;
    char * argv[5];
    argv[0] = malloc(5);
    argv[1] = malloc(3);
    argv[2] = malloc(promptLength + 1);
    argv[3] = malloc(3);
    argv[4] = malloc(modelPathLength + 1);
    
    memset(argv[0], 0, 5);
    memset(argv[1], 0, 3);
    memset(argv[2], 0, promptLength + 1);
    memset(argv[3], 0, 3);
    memset(argv[4], 0, modelPathLength + promptLength);
    
    sprintf(argv[0], "chat");
    sprintf(argv[1], "-p");
    sprintf(argv[2], "%s", char_Prompt);
    sprintf(argv[3], "-m");
    sprintf(argv[4], "%s", char_modelPath);
    run_cmain( argc, argv);
}


@end
