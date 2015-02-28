/*
 * Copyright (c) 2012. All rights reserved.
 *
 */

#import "AppDelegate.h"
#import "MyImageView.h"

@implementation AppDelegate

@synthesize window;

#pragma mark - Life cycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    DLog();
    CGRect frame = [[UIScreen mainScreen] bounds];
    DLog();
    self.window = [[[UIWindow alloc] initWithFrame:frame] autorelease];
    DLog();
    window.backgroundColor = [UIColor brownColor];
    DLog();
    float width = kParentFrameSize;
    DLog();
    float height = kParentFrameSize;
    DLog();
    float x = (frame.size.width - width) / 2.0;
    float y = (frame.size.height - height) / 2.0;
    MyImageView *imageView = [[[MyImageView alloc] initWithFrame:CGRectMake(x,y,width,height)] autorelease];
    DLog();
    [window addSubview:imageView];
    DLog();
    [window makeKeyAndVisible];
    DLog();
    return YES;
}

- (void)dealloc
{
    [window release];
    [super dealloc];
}

@end

