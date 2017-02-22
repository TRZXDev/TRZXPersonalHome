//
//  IncubateVIPMsgTableViewCell.m
//  tourongzhuanjia
//
//  Created by Rhino on 16/5/24.
//  Copyright © 2016年 JWZhang. All rights reserved.
//

#import "IncubateVIPMsgTableViewCell.h"
#define RGBA(R/*红*/, G/*绿*/, B/*蓝*/, A/*透明*/) \
[UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]
@implementation IncubateVIPMsgTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setStr:(NSString *)str
{
    _str = str;
    
    self.topFirstLable.attributedText = [self setLocationAttributeWithStr:self.topFirstLable.text];
    
    self.bottomFirstLable.attributedText = [self setLocationAttributeWithStr:self.bottomFirstLable.text];
    
}
//改变字体颜色
- (NSAttributedString *)setLocationAttributeWithStr:(NSString *)str
{
    NSMutableAttributedString *attributeText = [[NSMutableAttributedString alloc]initWithString:str];
    [attributeText setAttributes:@{NSForegroundColorAttributeName:RGBA(140, 102, 53, 1.0),NSFontAttributeName:[UIFont systemFontOfSize:18]} range:NSMakeRange(2, str.length-2)];
    return attributeText;
}

@end
