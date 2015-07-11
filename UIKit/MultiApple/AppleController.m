
#import "AppleController.h"

@interface AppleController ()

@property (nonatomic, retain) MyUIViewController *myUiViewController;

@end


@implementation AppleController

@synthesize delegate;
@synthesize myUiViewController;
@synthesize navigationController;

- (id)init
{
    if ((self=[super init])) {
        // In this example, both the Mac and iOS versions of the product use the same view controller. If
        // you want to use different controllers that are specific to a platform, just move the instance
        // variable and instantiation to a subclass. The same goes with delegation. The thing you won't want
        // to mess with are the actions and state management: they work best when centralized in this base
        // class.
        myUiViewController = [[MyUIViewController alloc] init];
        myUiViewController.delegate = self;
        navigationController = [[UINavigationController alloc] initWithRootViewController:myUiViewController];
        myUiViewController.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Move" style:UIBarButtonItemStylePlain target:self action:@selector(moveTheApple)] autorelease];
        //DLog(@"myUiViewController.navigationItem: %@", myUiViewController.navigationItem);
    }
    return self;
}

- (void)dealloc
{
    //DLog();
    myUiViewController.delegate = nil;
    [myUiViewController	release], myUiViewController = nil;
    [navigationController release], navigationController = nil;
    [super dealloc];
}

#pragma mark - Accessors

// return the view controller that acts as the root for the application
- (UIViewController *)viewController
{
    // override in subclass
    //DLog();
    return navigationController;
}

#pragma mark - Delegates

// forward delegate callbacks from the view controller
- (void)myUiViewControllerWillStartMovingApple:(MyUIViewController *)viewController
{
    // subclasses can override
    /*if ([delegate respondsToSelector:@selector(appleControllerWillStartMovingApple:)]) {
        [delegate appleControllerWillStartMovingApple:self];
    }*/
    //DLog();
    [myUiViewController.navigationItem.rightBarButtonItem setEnabled:NO];
}

- (void)myUiViewControllerDidFinishMovingApple:(MyUIViewController *)viewController
{
    // subclasses can override
    /*if ([delegate respondsToSelector:@selector(appleControllerDidFinishMovingApple:)]) {
        [delegate appleControllerDidFinishMovingApple:self];
    }*/
    //DLog();
    [myUiViewController.navigationItem.rightBarButtonItem setEnabled:YES];
}

#pragma mark - Public methods

// pass actions and state queries to the view controller
- (BOOL)canMoveApple
{
    //DLog();
    return (![myUiViewController isAppleMoving]);
}

- (void)moveTheApple
{
    //DLog();
    [myUiViewController moveTheApple:self];
    //DLog();
}

@end

