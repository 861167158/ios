//
//  FirstViewController.m
//  zaker
//
//  Created by JaysonWang on 16/6/1.
//  Copyright © 2016年 颢迅网络. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setupafter loading the view.
	NSLog(@"first...");
	self.title = @"123";
	
	[self.view setBackgroundColor:[UIColor whiteColor]];
	
	self.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemRecents tag:101];
	self.navigationController.navigationBar.translucent = YES;
	
	CGFloat scrollW = self.view.frame.size.width;
	CGFloat scrollH = self.view.frame.size.height;
	UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, scrollW, scrollH)];
	
	scrollView.scrollEnabled = YES;
	scrollView.pagingEnabled = YES;
	
	//scrollView.alwaysBounceHorizontal = YES;
	scrollView.alwaysBounceVertical = YES;
	
	//scrollView.showsHorizontalScrollIndicator = YES;
	scrollView.showsVerticalScrollIndicator = YES;
	
	int column = 5;
	scrollView.contentSize = CGSizeMake(scrollW, scrollH * column);

	for (int i = 0; i < column; i++) {
		UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg", i + 1]];
		UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
		imageView.frame = CGRectMake(0, i * scrollH, scrollW, scrollH);
		imageView.tag = i + 1;
		imageView.userInteractionEnabled = YES;
		
		UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageEventTap:)];
		tap.numberOfTapsRequired = 1;
		tap.numberOfTouchesRequired = 1;
		[imageView addGestureRecognizer:tap];
		
		[scrollView addSubview:imageView];
	}
	
	[self.view addSubview:scrollView];
	
}

-(void)imageEventTap:(UITapGestureRecognizer *)tap{
	UIImageView *imageView = (UIImageView *)tap.view;
	NSLog(@"%ld", (long)imageView.tag);
	UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:[NSString stringWithFormat:@"%ld.jpg", imageView.tag] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
	[alertView show];
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
