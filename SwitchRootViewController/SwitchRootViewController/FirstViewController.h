//
//  FirstViewController.h
//  SwitchRootViewController
//
//  Created by SKS on 29/03/17.
//  Copyright © 2017 SwitchRootViewController. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol MoveToProtocol<NSObject>
-(void)moveToSecond;

@end


@interface FirstViewController : UIViewController

@property (nonatomic, weak) id < MoveToProtocol > delegate;
- (IBAction)moveToSecond:(id)sender;

@end
