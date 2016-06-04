//
//  ThirdViewController.h
//  zaker
//
//  Created by JaysonWang on 16/6/1.
//  Copyright © 2016年 颢迅网络. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController
<
	UITableViewDelegate,
	UITableViewDataSource,
	NSURLConnectionDelegate,
	NSURLConnectionDataDelegate
>
{
	UITableView *_tableView;
	
	NSMutableArray *_dataSource;
	
	NSURLConnection *_connection;
	NSMutableData *_data;
}
@end
