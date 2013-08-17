//
//  LoadingScreen.h
//  Sam Adams
//
//  Created by Mac Mini on 05/05/10.
//  Copyright 2010 bsmart. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "splashView.h"

@interface LoadingScreen : NSObject {

	splashView *mySplash;
}

+(LoadingScreen *)sharedInstance;

-(void)startLoadingScreen;
-(void)dismissLoadingScreen;

@end
