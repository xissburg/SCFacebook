//
//  AppDelegate.m
//  SCFacebook
//
//  Created by Lucas Correa on 23/11/11.
//  Copyright (c) 2011 Siriuscode Solutions. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "SCFacebook.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;
@synthesize navigationController = _navigationController;

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [_navigationController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //Your application App ID/API Key Facebook
    [SCFacebook initWithAppId:@"140422319335414"];
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    // Override point for customization after application launch.
    self.viewController = [[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] autorelease];
    
    self.navigationController = [[[UINavigationController alloc] initWithRootViewController:self.viewController] autorelease];
    
    [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@"backgroundNavigation"] forBarMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearance] setTintColor:[UIColor blackColor]];

    
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    
    //Loading
    loadingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
	loadingView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.8];
	UIActivityIndicatorView *aiView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	[loadingView addSubview:aiView];
	[aiView startAnimating];
	aiView.center =  CGPointMake(160, 240);
	[aiView release];
	[self.window addSubview:loadingView];
    [loadingView release];
	loadingView.hidden = YES;
    
    
    
    
    return YES;
}




#pragma mark - 
#pragma mark - SCFacebook Handle

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    [[NSNotificationCenter defaultCenter] postNotificationName:OPEN_URL object:url];
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    [[NSNotificationCenter defaultCenter] postNotificationName:OPEN_URL object:url];
    return YES;
}





- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
