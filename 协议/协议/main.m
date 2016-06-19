//
//  main.m
//  协议
//
//  Created by JaysonWang on 16/6/19.
//  Copyright © 2016年 颢迅网络. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol USB <NSObject>

@required
-(void)read;
-(void)write;

@optional
-(void)copy;
-(void)delete;

@end


@interface KeyBord : NSObject<USB>

@end

@implementation KeyBord

-(void)read{
	NSLog(@"read...");
}

-(void)write{
	NSLog(@"write...");
}

@end

@interface Demo : NSObject

+(void)_initialize;

@end

@implementation Demo
+(void)_initialize{
	NSLog(@"init...");
	KeyBord *key = [[KeyBord alloc]init];
	[key read];
	[key write];
}

@end

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		[Demo _initialize];
	}
    return 0;
}
