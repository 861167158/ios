//
//  ViewController.m
//  连连看
//
//  Created by JaysonWang on 16/6/18.
//  Copyright © 2016年 颢迅网络. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

static int btnsCount = 0;
static NSTimeInterval startTime = 0;

@implementation ViewController


- (void) startGame {
	
	NSLog(@"初始化游戏...");
	NSDate *date = [NSDate date];
	NSLog(@"%@", date);
	startTime = [date timeIntervalSince1970];
	NSLog(@"%f", startTime);
	
	[self.view setBackgroundColor:[UIColor colorWithRed:230.0 / 255.0 green:192.0 / 255.0 blue:148.0 / 255.0 alpha:1.0]];
	
//	行数
	int rows = 10;
//	列数
	int cols = 6;
//	元素宽度
	int width = 45;
//	元素高度
	int height = 45;
//	元素左间距
	int marginLeft = 12;
//	元素上间距
	int marginTop = 35;
//	元素左填充
	int paddingLeft = (self.view.frame.size.width - cols * width -2 * marginLeft) / (cols - 1);
//	元素上填充
	int paddingTop = (self.view.frame.size.height - rows * height -2 * marginTop) / (rows - 1);;
//	不同图片数量
	int imagesCount = 10;
//	图片最小索引值
	int imageMinIndex = 1;
//	图片后缀
	NSString *imageShuff = @"png";
	
	NSMutableArray *mutArray = [[NSMutableArray alloc]init];
	for (int m = 0; m < rows * cols / 2; m++) {
		int _random = arc4random() % imagesCount + imageMinIndex;
		[mutArray addObject:[NSString stringWithFormat:@"%d", _random]];
		[mutArray addObject:[NSString stringWithFormat:@"%d", _random]];
	}
	
	btnsCount = rows * cols;
	
	for (int i = 0; i < rows; i++) {
		for (int j = 0; j < cols; j++) {
			
			UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
			btn.frame = CGRectMake(160, 160, width, height);
			
			[UIView beginAnimations:nil context:nil];
			[UIView setAnimationDuration:1];
			btn.frame = CGRectMake(marginLeft + (paddingLeft + width) * j, marginTop + (paddingTop + height) * i, width, height);
			int random = arc4random() % mutArray.count;
			UIImage *image = [UIImage imageNamed:mutArray[random]];
			[btn setImage:image forState:UIControlStateNormal];
			btn.tag = [mutArray[random] integerValue];
			[btn addTarget:self action:@selector(linkClick:) forControlEvents:UIControlEventTouchUpInside];
			[self.view addSubview:btn];
			[mutArray removeObjectAtIndex:random];
			
			[UIView commitAnimations];
			
		}
	}
	
}

- (void)linkClick:(UIButton *)btn{
//	NSLog(@"%ld", (long)btn.tag);
	static UIButton *btnFirst = nil;
	if (btnFirst == nil) {
		btnFirst = btn;
//		 锁定第一个按钮
		btn.enabled = NO;
	}else{
		if (btn.tag == btnFirst.tag) {
			NSLog(@"good!");
			[btn removeFromSuperview];
			[btnFirst removeFromSuperview];
			btnsCount--;
			btnsCount--;
		}else{
			NSLog(@"no");
			btnFirst.enabled = YES;
		}
		btnFirst = nil;;
	}
	if (btnsCount == 0) {
		[self success];
	}
}

- (void)success{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1];
	[self.view setBackgroundColor:[UIColor greenColor]];
	UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 200)/2, 200, 200, 100)];
	[self.view addSubview:label];
	[UIView commitAnimations];
	
	NSDate *date = [NSDate date];
	NSLog(@"%@", date);
	NSTimeInterval endtime = [date timeIntervalSince1970];
	NSLog(@"%f", endtime);
	float takeTime = endtime - startTime;
	label.text = [NSString stringWithFormat:@"恭喜过关！\n消失时长：%.3f秒", takeTime];
	label.numberOfLines = 0;
	label.textAlignment = NSTextAlignmentCenter;
	label.tag = 10000;
	
	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	button.frame = CGRectMake((self.view.frame.size.width - 200)/2, 300, 200, 40);
	[button setTitle:@"再来一局！" forState:UIControlStateNormal];
	[button addTarget:self action:@selector(tryAgain) forControlEvents:UIControlEventTouchUpInside];
	button.tag = 10001;
	[self.view addSubview:button];
	
}

-(void)tryAgain{
	UILabel *label = [self.view viewWithTag:10000];
	UIButton *button = [self.view viewWithTag:10001];
	[label removeFromSuperview];
	[button removeFromSuperview];
	[self startGame];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self startGame];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
