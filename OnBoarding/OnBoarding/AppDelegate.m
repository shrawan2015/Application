//
//  AppDelegate.m
//  OnBoarding
//
//  Created by ShrawanKumar Sharma on 27/03/17.
//  Copyright © 2017 com.OnBoarding. All rights reserved.
//

#import "AppDelegate.h"
#import "OnBoardingViewController.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    OnBoardingViewController *controller = [[OnBoardingViewController alloc] initWithNibName:@"OnBoardingViewController" bundle:nil];
    
    UINavigationController *navigationController  = [[UINavigationController alloc] initWithRootViewController:controller];

//    UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
    
    
    controller.skipHandler = ^{
        [UIView transitionWithView:self.window duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
//           
//            [self.weakOnBoard.view removeFromSuperview];
//            [self.weakOnBoard removeFromParentViewController];
//            self.weakOnBoard = nil;
            // [self gotoLoadingView];
            [self showSignUpView];
        } completion:nil];
    };
    
    
    
    self.window.rootViewController = navigationController;

    [self.window makeKeyAndVisible];
    return YES;
}

- (void)showSignUpView {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *_viewLoading = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    UINavigationController *_viewNav = [[UINavigationController alloc] initWithRootViewController:_viewLoading];
    [self.window.rootViewController addChildViewController:_viewNav];
    [self.window.rootViewController.view addSubview:_viewNav.view];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
