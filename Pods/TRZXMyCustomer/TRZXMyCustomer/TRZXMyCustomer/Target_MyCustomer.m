//
//  Target_MyCustomer.m
//  TRZXMyCustomer
//
//  Created by Rhino on 2017/2/27.
//  Copyright © 2017年 Rhino. All rights reserved.
//

#import "Target_MyCustomer.h"
#import "TRZXMyCustomerViewController.h"
@implementation Target_MyCustomer


- (UIViewController *)Action_MyCustomer_TRZXMyCustomerViewController:(NSDictionary *)params{
    TRZXMyCustomerViewController *myCustomer = [[TRZXMyCustomerViewController alloc]init];
    myCustomer.titleString = params[@"title"];
    return myCustomer;
}



@end
