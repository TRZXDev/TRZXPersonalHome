//
//  LianXiKeFuTableViewCell.m
//  tourongzhuanjia
//
//  Created by 移动微世界 on 16/4/21.
//  Copyright © 2016年 JWZhang. All rights reserved.
//

#import "LianXiKeFuTableViewCell.h"

@implementation LianXiKeFuTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.lianxiBtn.layer.cornerRadius = 17;
    self.lianxiBtn.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
