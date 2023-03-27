//
//  AlpacaBridge.h
//  alpaca
//
//  Created by onexip / Matthias Hänel on 25.03.23.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AlpacaDelegate.h"


@interface AlpacaBridge : NSObject

/* Set the model to be  */
- (void)setModelPath:(NSString*)modelPath;
- (void)submitQuestion:(NSString*)question;

@property(weak, nonatomic) id <AlpacaDelegate> delegate;

@end
