//
//  TRMyCustomerCell.h
//  TRZX
//
//  Created by Rhino on 16/9/13.
//  Copyright © 2016年 Tiancaila. All rights reserved.
//

#import <UIKit/UIKit.h>

//@class TRMyCustomerModel;
@interface TRMyCustomerCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *registerTimeLabel;
@property (weak, nonatomic) IBOutlet UIView *bgView;


//@property (strong,nonatomic) TRMyCustomerModel *model;

@end
