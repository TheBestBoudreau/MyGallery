//
//  ViewController.m
//  ImageGallery
//
//  Created by Tyler Boudreau on 2018-04-23.
//  Copyright © 2018 Tyler Boudreau. All rights reserved.
//

#import "ViewController.h"
#import "DetailedViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic,readonly)NSArray <UIImage *> *imageArray;
@property DetailedViewController *dvc;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIStackView *stackView =[[UIStackView alloc]init];
    [self.scrollView addSubview:stackView];
    
    [stackView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [stackView.leftAnchor constraintEqualToAnchor:self.scrollView.leftAnchor].active=YES;
    [stackView.rightAnchor constraintEqualToAnchor:self.scrollView.rightAnchor].active=YES;
    [stackView.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active=YES;
    [stackView.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active=YES;

    [stackView.widthAnchor constraintEqualToAnchor:self.scrollView.widthAnchor multiplier:self.imageArray.count].active=YES;
    [stackView.heightAnchor constraintEqualToAnchor:self.scrollView.heightAnchor multiplier:1.0].active=YES;
    
    stackView.axis =UILayoutConstraintAxisHorizontal;
    stackView.distribution=UIStackViewDistributionFillEqually;
    
    for (UIImage *image in self.imageArray){
        UIImageView *imageView =[[UIImageView alloc]initWithImage:image];
        [stackView addArrangedSubview:imageView];
        [imageView setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        imageView.contentMode=UIViewContentModeScaleAspectFit;
    }
    self.scrollView.pagingEnabled=YES;
    
    UITapGestureRecognizer *tapGesture =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    [self.scrollView addGestureRecognizer:tapGesture];

    
}

-(void)viewTapped:(UITapGestureRecognizer *)sender
{
    [self performSegueWithIdentifier:@"Hello" sender:sender];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    DetailedViewController *dvc = segue.destinationViewController;
    
    int currentPage=self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
    
   UIImage *singleImage= [self.imageArray objectAtIndex:currentPage];
    
    dvc.image=singleImage;
}


-(void)setUpFrame {
    CGFloat width =CGRectGetWidth(self.scrollView.frame);
    CGFloat height =CGRectGetHeight(self.scrollView.frame);
    CGFloat offset =0;
    
    for (UIImage *image in self.imageArray){
        UIImageView *imageView =[[UIImageView alloc]initWithImage:image];
        [self.scrollView addSubview:imageView];
        imageView.frame=CGRectMake(offset, 0, width, height);
        offset+=width;
        imageView.contentMode=UIViewContentModeScaleAspectFit;
        
        self.scrollView.contentSize=CGSizeMake(self.scrollView.bounds.size.width * self.imageArray.count, 0);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSArray <UIImage *> *)imageArray{
    return  @[
              [UIImage imageNamed:@"field"],
              [UIImage imageNamed:@"night"],
              [UIImage imageNamed:@"zoomed"],
              ];
    
}


@end
