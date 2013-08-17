//
//  LoadingScreen.m
//  Sam Adams
//
//  Created by Mac Mini on 05/05/10.
//  Copyright 2010 bsmart. All rights reserved.
//

#import "LoadingScreen.h"


@implementation LoadingScreen

LoadingScreen *shInstance = nil;

+(LoadingScreen *)sharedInstance
{
	if(shInstance == nil)
	{
		shInstance = [[LoadingScreen alloc] init];
	}
	return shInstance;
}

- (id) init
{
	self = [super init];
	if (self != nil) {
		mySplash = [[splashView alloc] initWithImage:[UIImage imageNamed:@"blackbg.jpg"]];

	}
	return self;
}

-(void)startLoadingScreen
{
	[mySplash startSplash];
}

-(void)dismissLoadingScreen
{
	[mySplash dismissSplash];
}

@end
