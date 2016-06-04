//
//  ThirdViewController.m
//  zaker
//
//  Created by JaysonWang on 16/6/1.
//  Copyright © 2016年 颢迅网络. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	NSLog(@"third...");
	self.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:103];
	
	 //创建UITableView
	_tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
	
	[self.view addSubview:_tableView];
	
	//设置视图代理对象
	_tableView.delegate = self;
	
	//设置数据代理对象
	_tableView.dataSource = self;
	
	_tableView.tableHeaderView = nil;
	_tableView.tableFooterView = nil;
	
	[_tableView setEditing:YES];
	
	//得到文件的路径
	NSString *path = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
	NSLog(@"%@", path);
	
	//得到文件的二进制内容
//	NSData *data = [NSData dataWithContentsOfFile:path];
	NSURL *url = [NSURL URLWithString:@"http://cms.com?A=1"];
	NSData *data = [NSData dataWithContentsOfURL:url];
//	NSLog(@"%@", data);
	
	//得到json数据
	NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//	NSLog(@"%@", dict);
//	NSInteger count = [dict count];
//	NSLog(@"%ld", (long)count);
	
	_dataSource = [dict objectForKey:@"data"];
	
//	_dataSource = [[NSMutableArray alloc]init];
//	
//	for (int i = 'A'; i <= 'Z'; i++) {
//		NSMutableArray *obj = [[NSMutableArray alloc]init];
//		for (int j = 1; j <= 5; j++) {
//			[obj addObject:[NSString stringWithFormat:@"%c%d", i, j]];
//		}
//		[_dataSource addObject:obj];
//	}
	
	[_tableView reloadData];
}

//返回组数sections
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	return _dataSource.count;
}

//返回行数rows
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return [[_dataSource objectAtIndex:section] count];
}

//单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	NSString *str = @"cell...";
	UITableViewCell *tableViewCell = [_tableView dequeueReusableCellWithIdentifier:str];
	if (tableViewCell == nil) {
		tableViewCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str];
	}
	tableViewCell.textLabel.text = _dataSource[indexPath.section][indexPath.row];
	tableViewCell.detailTextLabel.text = [NSString stringWithFormat:@"%ld%ld", indexPath.section, indexPath.row];;
	return tableViewCell;
}

//row height
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 45;
}

//header height
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
	return 20;
}

//header title
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
	return @"我有一个㊙️要告诉你...";
}

//footer height
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
	return 20;
}

//footer title
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
	return [NSString stringWithFormat:@"section:%ld", section];
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
	return YES;
}

//手指在单元格上移动事件
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
	if (editingStyle == UITableViewCellEditingStyleInsert) {
		NSLog(@"insert...");
	} else if (editingStyle == UITableViewCellEditingStyleDelete){
		NSLog(@"delete...");
		
		NSURL *url = [NSURL URLWithString:@"http://cms.com?r=main/delete"];
		NSURLRequest *request = [NSURLRequest requestWithURL:url];
		_connection = [NSURLConnection connectionWithRequest:request delegate:self];
		
		[_dataSource[indexPath.section] removeObjectAtIndex:indexPath.row];
		[_tableView reloadData];
	} else {
		NSLog(@"hi...");
	}
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
	
	NSLog(@"didReceiveData:%@", data);
	NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:nil error:nil];
	NSLog(@"json:%@", dict);
	NSInteger code = [dict objectForKey:@"code"];
	NSString *msg = [dict objectForKey:@"msg"];
	if (code == 0) {
		NSLog(@"success!");
	}
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
	NSLog(@"connectionDidFinishLoading");
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
	NSHTTPURLResponse *httpUrlResponse = (NSHTTPURLResponse *)response;
	NSLog(@"didReceiveResponse:%ld", httpUrlResponse.statusCode);
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
	NSLog(@"didFailWithError:%@", error);
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath;{
	return UITableViewCellEditingStyleDelete;
	if (indexPath.row % 4 == 0) {
		return UITableViewCellEditingStyleInsert;
	}else if (indexPath.row % 4 == 1) {
		return UITableViewCellEditingStyleDelete;
	}if (indexPath.row % 4 == 2) {
		return UITableViewCellEditingStyleNone;
	}
	return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
}

//内存不足警告
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
