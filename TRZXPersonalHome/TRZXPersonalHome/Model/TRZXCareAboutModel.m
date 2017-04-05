//
//  TRZXCareAboutModel.m
//  TRZXPersonalHome
//
//  Created by 张江威 on 2017/3/22.
//  Copyright © 2017年 张江威. All rights reserved.
//

#import "TRZXCareAboutModel.h"
#import <objc/runtime.h>

@implementation TRZXCareAboutModel

+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [careAboutData class]};
}

@end

@implementation careAboutData

@end
