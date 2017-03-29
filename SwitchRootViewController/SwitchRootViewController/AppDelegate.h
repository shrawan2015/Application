//
//  AppDelegate.h
//  SwitchRootViewController
//
//  Created by SKS on 29/03/17.
//  Copyright © 2017 SwitchRootViewController. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h"
#import "SecondViewController.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate,MoveToProtocol>

@property (strong, nonatomic) UIWindow *window;

@property(strong,nonatomic)FirstViewController *firstVC;
@property(strong,nonatomic)SecondViewController *secondVC;
@property(strong,nonatomic)UIViewController  *freshVC;


@end

