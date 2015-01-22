/*
 Copyright © 2014 myOS Group.
 
 This application is free software; you can redistribute it and/or
 modify it under the terms of the GNU Lesser General Public
 License as published by the Free Software Foundation; either
 version 2 of the License, or (at your option) any later version.
 
 This library is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 Lesser General Public License for more details.
 
 Contributor(s):
 Amr Aboelela <amraboelela@gmail.com>
 */

#import "AppDelegate.h"
#import "RRSolidView.h"

@implementation AppDelegate

@synthesize window;

#pragma mark - Life cycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    DLog();
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    //DLog(@"window: %@", window);
    self.window.backgroundColor = [UIColor brownColor];
    //DLog(@"self.window.backgroundColor: %@", self.window.backgroundColor);

    RRSolidView *solidView = [[[RRSolidView alloc] initWithFrame:CGRectMake(0, 40, 170, 150)] autorelease];
    //DLog(@"solidView: %@", solidView);
    //solidView.backgroundColor = [UIColor redColor];
    [window addSubview:solidView];
    
    //[NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(addSolidView:) userInfo:nil repeats:NO];
    [window makeKeyAndVisible];
    //DLog();
//    RRSolidView* solidView2 = [[[RRSolidView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)] autorelease];
//    [solidView addSubview:solidView2];
    return YES;
}

- (void)dealloc
{
    [window release];
    [super dealloc];
}

#pragma mark - Delegates

- (void)addSolidView:(NSTimer *)timer
{
    RRSolidView *solidView = [[[RRSolidView alloc] initWithFrame:CGRectMake(150, 230, 170, 150)] autorelease];
    //DLog(@"solidView: %@", solidView);
    //solidView.backgroundColor = [UIColor redColor];
    [window addSubview:solidView];
}

@end
