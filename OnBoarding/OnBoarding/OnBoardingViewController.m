//
//  OnBoardingViewController.m
//  OnBoarding
//
//  Created by ShrawanKumar Sharma on 27/03/17.
//  Copyright © 2017 com.OnBoarding. All rights reserved.
//

#import "OnBoardingViewController.h"
#import "CustomBoardingCell.h"
static CGFloat const kPageControlHeight = 35;

@interface OnBoardingViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation OnBoardingViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.skipHandler = ^{};
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.skipHandler = ^{};

    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView setCollectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor redColor];
    self.collectionView.pagingEnabled  = true;
    
    
    self.pageControl = [UIPageControl new];

    self.pageControl.frame = CGRectMake(0, CGRectGetMaxY(self.view.frame) - kPageControlHeight, self.view.frame.size.width, kPageControlHeight);
    
    self.pageControl.numberOfPages = 5;//self.viewControllers.count;
    self.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor lightGrayColor];
    self.pageControl.userInteractionEnabled = NO;
    [self.view addSubview:self.pageControl];
    [self.view bringSubviewToFront:self.pageControl];
    [self.pageControl setCurrentPage:0];
   
    skipButton.hidden = true;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"CustomBoardingCell" bundle:nil] forCellWithReuseIdentifier:@"CustomBoardingCell"];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CustomBoardingCell *myCell = [self.collectionView
                                    dequeueReusableCellWithReuseIdentifier:@"CustomBoardingCell"
                                    forIndexPath:indexPath];
    myCell.backgroundColor = [UIColor blueColor];
    myCell.imageOutlet.image = [UIImage imageNamed:@"xyz.png"];
    
    
    return myCell;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  5;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(CGRectGetWidth(collectionView.frame), (CGRectGetHeight(collectionView.frame)));
}

- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0); // top, left, bottom, right
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0.0;
}


-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    float currentPage = self.collectionView.contentOffset.x / self.collectionView.frame.size.width;
    self.pageControl.currentPage = ceil(currentPage);

    if(currentPage == 4) {
        skipButton.hidden = false;
        
    }else{
        skipButton.hidden = true;
        
    }
    
}

- (IBAction)skipAction:(id)sender {
    self.skipHandler();

}
@end
