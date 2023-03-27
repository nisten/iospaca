//
//  AlpacaDelegate.h
//  alpaca
//
//  Created by Matthias Hänel on 25.03.23.
//


#import <Foundation/Foundation.h>

@protocol AlpacaDelegate <NSObject>

@optional

-(void) alpacaResponse:(NSString *)response;


@end
