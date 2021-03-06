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
#import "RoundButtonView.h"

@implementation AppDelegate

@synthesize window=_window;

#pragma mark - Life cycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    //DLog(@"screenBounds: %@", NSStringFromCGRect(screenBounds));
    self.window = [[[UIWindow alloc] initWithFrame:screenBounds] autorelease];
    self.window.backgroundColor = [UIColor brownColor];
    float width = 300;
    float height = 200;
    float x = (screenBounds.size.width - width) / 2.0;
    float y = (screenBounds.size.height - height) / 2.0;
    RoundButtonView *buttonView = [[[RoundButtonView alloc] initWithFrame:CGRectMake(x,y,width,height)] autorelease];
    [self.window addSubview:buttonView];
    //DLog(@"buttonView: %@", buttonView);
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

#pragma mark - Delegates

@end
