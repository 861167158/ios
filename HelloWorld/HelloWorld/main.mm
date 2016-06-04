//
//  main.m
//  HelloWorld
//
//  Created by JaysonWang on 16/6/2.
//  Copyright © 2016年 颢迅网络. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "stdio.h"
#include "iostream"

int main(int argc, const char * argv[]) {
	@autoreleasepool {
	    // insert code here...
	    NSLog(@"Hello, World!\n");
		printf("hi, xugege!");
		int a;
		std::cin >> a;
		
		std::cout << "hello xugege\n" << a << std::endl;
		
	}
	return 0;
}
