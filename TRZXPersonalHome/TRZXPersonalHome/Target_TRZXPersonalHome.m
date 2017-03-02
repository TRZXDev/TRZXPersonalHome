//
//  Target_TRZXPersonalHome.m
//  TRZXPersonalHome
//
//  Created by 张江威 on 2017/2/27.
//  Copyright © 2017年 张江威. All rights reserved.
//

#import "Target_TRZXPersonalHome.h"
#import "TRZXPersonalHomeViewController.h"
#import "CTMediator+PersonalProfile.h"



@implementation Target_TRZXPersonalHome

- (UIViewController *)Action_PersonalHomeViewController:(NSDictionary *)params;
{
    TRZXPersonalHomeViewController *PersonalHomeVC = [[TRZXPersonalHomeViewController alloc] init];
    PersonalHomeVC.midStrr = params[@"midStrr"];
    PersonalHomeVC.otherStr = params[@"otherStr"];
    return PersonalHomeVC;
}



/**
 关于我
 
 @param title 标题
 @param eduArray 教育经历
 @param workArr 工作经理
 @param type 用户类型
 @param abstract 个人简介
 @return //
 */
+ (UIViewController *)Action_PersonalProfileViewControllerTitle:(NSString *)title eduArr:(NSArray *)eduArray workArr:(NSArray *)workArr userType:(NSString *)type abstract:(NSString *)abstract{
    NSDictionary *dict = @{@"titleStr":title?title:@"",
                           @"workArray":workArr?workArr:@[],
                           @"eduArray":eduArray?eduArray:@[],
                           @"type":type?type:type,
                           @"abstractz":abstract?abstract:@""
                           };
    return [[CTMediator sharedInstance]PersonalProfile_TRZXPersonalProfileViewController:dict];
}

@end