//
//  IncubateVIPMsgTableViewCell.h
//  tourongzhuanjia
//
//  Created by Rhino on 16/5/24.
//  Copyright © 2016年 JWZhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IncubateVIPMsgTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *firstImageView;
@property (weak, nonatomic) IBOutlet UIImageView *secondImageView;
@property (weak, nonatomic) IBOutlet UILabel *topFirstLable;
@property (weak, nonatomic) IBOutlet UILabel *topSecondLable;
@property (weak, nonatomic) IBOutlet UILabel *bottomFirstLable;
@property (weak, nonatomic) IBOutlet UIView *leftFirstLine;

@property (weak, nonatomic) IBOutlet UILabel *bottomSecondLabel;

@property (nonatomic,copy)NSString *str;

@end
