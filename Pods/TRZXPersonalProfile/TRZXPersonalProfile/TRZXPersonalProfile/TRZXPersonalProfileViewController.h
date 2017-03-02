//
//  TRZXPersonalProfileViewController.h
//  TRZXPersonalProfile
//
//  Created by Rhino on 2017/3/1.
//  Copyright © 2017年 Rhino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRZXProfileUserModel.h"

@interface TRZXPersonalProfileViewController : UIViewController

//标题
@property (copy,   nonatomic) NSString *titleStr;
//用户模型
@property (strong, nonatomic) TRZXProfileUserModel *PersonalMode;
//教育经历
@property (strong, nonatomic) NSArray *eduArray;
//工作经历
@property (strong, nonatomic) NSArray *workArray;



@end
