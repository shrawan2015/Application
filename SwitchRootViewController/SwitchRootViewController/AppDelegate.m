//
//  AppDelegate.m
//  SwitchRootViewController
//
//  Created by SKS on 29/03/17.
//  Copyright © 2017 SwitchRootViewController. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

//[self launchFirstScreen]; work perfect
    
    //exp
    [self launchFirstScreenNewWithNavigationBar];
    
    return YES;
}

-(void)launchFirstScreen{
    /*
     initialViewController  = MainViewController(nibName:"MainViewController",bundle:nil)
     let frame = UIScreen.mainScreen().bounds
     window = UIWindow(frame: frame)
     
     window!.rootViewController = initialViewController
     window!.makeKeyAndVisible()

     */
    
    self.firstVC = [[FirstViewController alloc ] initWithNibName:@"FirstViewController" bundle:nil] ;
    self.firstVC.delegate = self;
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.rootViewController = self.firstVC;
    [self.window makeKeyAndVisible];
}


-(void)moveToSecond{
    
    //Work Perfectly
   // [self launchSecondOne];
    
    //exp// work fine
  //  [self launchSecondScreenNewWithNavigationBar];
    
    //WORK FINE
    //[self launchSecondScreenNewWithNavigationBarInStoryBoard];
    
    
    //WITH ANIMATION
    

    
    UIViewController *oldController=self.window.rootViewController;
    
    [UIView transitionWithView:self.window
                      duration:0.5
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        
                        [self launchSecondScreenNewWithNavigationBarInStoryBoard];
                        
                        
                    }
                    completion:^(BOOL finished) {
                        if(oldController != nil)
                            [oldController.view removeFromSuperview];
                    }];

    
    
}

-(void)launchSecondOne{
    self.secondVC = [[SecondViewController alloc ] initWithNibName:@"SecondViewController" bundle:nil] ;
    self.window.rootViewController = self.secondVC;
}


-(void)launchFirstScreenNewWithNavigationBar{

    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.firstVC = [[FirstViewController alloc ] initWithNibName:@"FirstViewController" bundle:nil] ;
    self.firstVC.delegate = self;

    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:self.firstVC];
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];

}


-(void)launchSecondScreenNewWithNavigationBar{
    
    
    ///work perfectly if there is no navigation bar in second one
   self.secondVC = [[SecondViewController alloc ] initWithNibName:@"SecondViewController" bundle:nil] ;
    //self.window.rootViewController = self.secondVC;
    
    //exp on navigation bar
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:self.secondVC];
    self.window.rootViewController = navController;
}


-(void)launchSecondScreenNewWithNavigationBarInStoryBoard{
    
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *viewController =  [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];

    self.window.rootViewController = navController;
    
//    return YES;

    
    
    
   // UIViewController *vc =
    ///work perfectly if there is no navigation bar in second one
    //self.secondVC = [[SecondViewController alloc ] initWithNibName:@"SecondViewController" bundle:nil] ;
    //self.window.rootViewController = self.secondVC;
    
    //exp on navigation bar
    //UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:self.secondVC];
    //self.window.rootViewController = navController;
}



    /*
     
     let mainStoryboard = UIStoryboard(name: "MainStoryboard", bundle: nil)
     
     // rootViewController
     let rootViewController = mainStoryboard.instantiateViewControllerWithIdentifier("MainViewController") as? UIViewController
     
     // navigationController
     let navigationController = UINavigationController(rootViewController: rootViewController!)
     
     navigationController.navigationBarHidden = true // or not, your choice.
     
     // self.window
     self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
     
     self.window!.rootViewController = navigationController
     
     self.window!.makeKeyAndVisible()

     */



//-(void)DemoExample{
    
  //  self.window = UIWindow(frame: UIScreen.main.bounds)
   // let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //let initialViewController = storyboard.instantiateViewController(withIdentifier: "ViewController")
    //self.window?.rootViewController = initialViewController
    //self.window?.makeKeyAndVisible()
    //return true
    //self.window = UIWindow(frame: UIScreen.main.bounds)
    //let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //let navigationController:UINavigationController = storyboard.instantiateInitialViewController() as! UINavigationController
    //let initialViewController = storyboard.instantiateViewControllerWithIdentifier("ViewController")
    //navigationController.viewControllers = [initialViewController]
    //self.window?.rootViewController = navigationController
    //self.window?.makeKeyAndVisible()
    //return true
//}

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
