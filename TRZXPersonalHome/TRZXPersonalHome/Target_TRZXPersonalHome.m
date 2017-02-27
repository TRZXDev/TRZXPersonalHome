//
//  Target_TRZXPersonalHome.m
//  TRZXPersonalHome
//
//  Created by 张江威 on 2017/2/27.
//  Copyright © 2017年 张江威. All rights reserved.
//

#import "Target_TRZXPersonalHome.h"
#import "TRZXPersonalHomeViewController.h"


@implementation Target_TRZXPersonalHome

- (UIViewController *)Action_PersonalHomeViewController:(NSDictionary *)params;
{
    TRZXPersonalHomeViewController *PersonalHomeVC = [[TRZXPersonalHomeViewController alloc] init];
    PersonalHomeVC.midStrr = params[@"midStrr"];
    PersonalHomeVC.otherStr = params[@"otherStr"];
    return PersonalHomeVC;
}

@end
