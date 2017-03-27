//
//  OnBoardingViewController.h
//  OnBoarding
//
//  Created by ShrawanKumar Sharma on 27/03/17.
//  Copyright © 2017 com.OnBoarding. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SampleProtocolDelegate <NSObject>
@required
- (void) processCompleted;
@end




@interface OnBoardingViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate> {
    
    //@property (nonatomic, assign) id <SampleProtocolDelegate> delegate;

    //@property id <SampleProtocolDelegate> delegate;
    IBOutlet UIButton *skipButton;

}
@property (nonatomic, strong) dispatch_block_t skipHandler;
@property id <SampleProtocolDelegate> delegate;
- (IBAction)skipAction:(id)sender;

@end
