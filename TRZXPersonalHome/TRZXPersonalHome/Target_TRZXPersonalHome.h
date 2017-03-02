//
//  Target_TRZXPersonalHome.h
//  TRZXPersonalHome
//
//  Created by 张江威 on 2017/2/27.
//  Copyright © 2017年 张江威. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Target_TRZXPersonalHome : NSObject

- (UIViewController *)Action_PersonalHomeViewController:(NSDictionary *)params;


/**
 关于我
 
 @return //
 */
+ (UIViewController *)Action_PersonalProfileViewControllerTitle:(NSString *)title eduArr:(NSArray *)eduArray workArr:(NSArray *)workArr model:(id)model;


@end
