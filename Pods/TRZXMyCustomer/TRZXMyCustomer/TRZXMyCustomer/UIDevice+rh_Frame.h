//
//  UIDevice+rh_Frame.h
//  TRZXMyCustomer
//
//  Created by Rhino on 2017/2/27.
//  Copyright © 2017年 Rhino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (rh_Frame)

typedef NS_ENUM(NSInteger, RHiPhoneModel){//0~3
    iPhone4 = 0,//320*480
    iPhone5,//320*568
    iPhone6,//375*667
    iPhone6Plus,//414*736
    UnKnown
};
+ (RHiPhoneModel)rh_iPhonesModel;

@end
