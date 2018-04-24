//
//  DetailedViewController.m
//  ImageGallery
//
//  Created by Tyler Boudreau on 2018-04-23.
//  Copyright © 2018 Tyler Boudreau. All rights reserved.
//

#import "DetailedViewController.h"

@interface DetailedViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *DetailedScrolledView;

@property(nonatomic,strong)UIImageView *zoomedImage;
@end

@implementation DetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.zoomedImage =[[UIImageView alloc] initWithImage:self.image];
    
    [self.zoomedImage setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    
    [self.DetailedScrolledView addSubview: self.zoomedImage];
    self.DetailedScrolledView.contentSize=self.image.size;
    
    
    [self.zoomedImage.leftAnchor constraintEqualToAnchor:self.DetailedScrolledView.leftAnchor].active=YES;
    [self.zoomedImage.rightAnchor constraintEqualToAnchor:self.DetailedScrolledView.rightAnchor].active=YES;
    [self.zoomedImage.topAnchor constraintEqualToAnchor:self.DetailedScrolledView.topAnchor].active=YES;
    [self.zoomedImage.bottomAnchor constraintEqualToAnchor:self.DetailedScrolledView.bottomAnchor].active=YES;
  
    
    self.DetailedScrolledView.minimumZoomScale=0.2;
    self.DetailedScrolledView.maximumZoomScale=2.5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.zoomedImage;
}


@end
