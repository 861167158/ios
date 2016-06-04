//
//  SecondViewController.m
//  zaker
//
//  Created by JaysonWang on 16/6/1.
//  Copyright © 2016年 颢迅网络. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	NSLog(@"second...");
	self.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemContacts tag:102];
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
	NSSet *allTouches = [event allTouches];
	UITouch *touch = [allTouches anyObject];
	CGPoint point= [touch locationInView:[touch view]];
	UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"坐标" message:[NSString stringWithFormat:@"(%.2f,%.2f)", point.x, point.y] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok", nil];

	[alertView show];
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
