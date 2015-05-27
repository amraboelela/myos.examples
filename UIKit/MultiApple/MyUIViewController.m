
#import "MyUIViewController.h"
#import <QuartzCore/QuartzCore.h>

#define kBigAppleFrame CGRectMake(20,20,206,206)

@interface MyUIViewController ()

@property (nonatomic, readwrite, assign, getter=isAppleMoving) BOOL appleMoving;

@end

@implementation MyUIViewController

@synthesize appleView;
@synthesize sillyButton;
@synthesize delegate;
@synthesize appleMoving;

- (void)loadView
{
    [super loadView];
    //self.view = [[[UIView alloc] initWithFrame:CGRectMake(0,0,320,580)] autorelease];

    self.view.backgroundColor = [UIColor whiteColor];
    //self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

    appleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"apple.png"]];
    //appleView.layer.anchorPoint = CGPointMake(0,0.5);
    self.appleView.frame = kBigAppleFrame;
    [self.view addSubview:appleView];

    self.sillyButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //sillyButton = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
// FIXME: The title is wrong on the button. Remove the exclamation point!!!!!!11!!
    [sillyButton setTitle:@"Click Me" forState:UIControlStateNormal];
// .. and then realize you're updating both the Mac and iOS versions of your products at once.
// HUGE WHEN LIKE THE CHOCK

    // Use the user interface idiom to customize the views based upon the platform. In this case it's simply the
    // color of a UI element, but the size and placement of elements will also need to be changed.
    /*if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone || UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        [sillyButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    } else {
        [sillyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }*/

    //DLog();
    [sillyButton addTarget:self action:@selector(moveTheApple:) forControlEvents:UIControlEventTouchUpInside];
    sillyButton.frame = CGRectMake(70,400,200,50);
    self.sillyButton.backgroundColor = [UIColor whiteColor];
    self.sillyButton.layer.borderColor = [[UIColor grayColor] CGColor];
    /*DLog(@"[UIScreen mainScreen].scale: %f", [UIScreen mainScreen].scale);
    self.sillyButton.contentScaleFactor = [UIScreen mainScreen].scale;
    for (UIView *view in [self.sillyButton subviews]) {
        view.contentScaleFactor = [UIScreen mainScreen].scale;
    }*/

    //DLog();
    //self.sillyButton.contentScaleFactor = 50;//[UIScreen mainScreen].scale;
    //sillyButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [self.view addSubview:sillyButton];
    //DLog();
}

- (void)viewDidUnload
{
    [appleView release], appleView = nil;
    [sillyButton release], sillyButton = nil;

    [super viewDidUnload];
}

- (void)dealloc
{
    [appleView release], appleView = nil;
    [sillyButton release], sillyButton = nil;
    
    [super dealloc];
}

- (void)appleMoveDidFinish
{
    //return;
    self.appleMoving = NO;

    if ([delegate respondsToSelector:@selector(myUiViewControllerDidFinishMovingApple:)]) {
        [delegate myUiViewControllerDidFinishMovingApple:self];
    }
}

#pragma mark - Actions

- (void)moveTheApple:(id)sender
{
    //if (self.appleMoving) {
    //    return;
    //}
    //DLog(@"moveTheApple:");
    //if ([delegate respondsToSelector:@selector(myUiViewControllerWillStartMovingApple:)]) {
    //    [delegate myUiViewControllerWillStartMovingApple:self];
    //}
    
    [UIView beginAnimations:@"moveTheApple" context:nil];
    [UIView setAnimationDuration:1.5];
    [UIView setAnimationDidStopSelector:@selector(appleMoveDidFinish)];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationBeginsFromCurrentState:YES];

    //DLog(@"moveTheApple: 2");
    //DLog(@"appleView.transform: %@", CGAffineTransformDescription(appleView.transform));
    
    CGFloat perspective = -1.0 / 500.0;
    CGFloat labelPerspective = -1.0 / 250.0;
    CATransform3D t;
    if (CGAffineTransformIsIdentity(appleView.transform)) {
        //DLog(@"CGAffineTransformIsIdentity");
        
        t = CATransform3DIdentity;
        //Purple plane: Perform a rotation and then a translation
        t = CATransform3DRotate(t, 55.0f * M_PI / 180.0f, 0, 0, 1);
        t.m34 = perspective;
        //DLog(@"t.m34: %0.3f", t.m34);
        t = CATransform3DTranslate(t, 70, 400, 170);
        appleView.layer.transform = t;
        
        //appleView.center = CGPointMake(100,300);
        t = CATransform3DIdentity;
        t = CATransform3DRotate(t, -35.0f * M_PI / 180.0f, 0, 1, 0);
        t.m34 = labelPerspective;
        sillyButton.layer.transform = t;
        sillyButton.layer.sublayerTransform = t;
        
        //DLog(@"appleView.transform: %@", CGAffineTransformDescription(appleView.transform));
    } else {
        //DLog(@"not CGAffineTransformIsIdentity");
        
        //appleView.center = CGPointMake(100,100);

        t = CATransform3DIdentity;
        t.m34 = perspective;
        //DLog(@"t.m34: %0.3f", t.m34);
        appleView.layer.transform = t;
        
        t = CATransform3DIdentity;
        t.m34 = labelPerspective;
        sillyButton.layer.transform = t;
        sillyButton.layer.sublayerTransform = t;
    }
    
    [UIView commitAnimations];
    
    self.appleMoving = YES;
}

@end
