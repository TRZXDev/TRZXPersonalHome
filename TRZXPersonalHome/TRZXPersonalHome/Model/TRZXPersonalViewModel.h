//
//  TRZXPersonalViewModel.h
//  TRZXPersonalHome
//
//  Created by 张江威 on 2017/2/20.
//  Copyright © 2017年 张江威. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "ReactiveCocoa.h"
#import "TRZXCourse.h"
#import "TRZXNetwork.h"


@interface TRZXPersonalViewModel : NSObject
@property (strong, nonatomic) NSDictionary *parameters; ///  配置网络请求参数
@property (strong, nonatomic) RACSignal *requestSignal; ///< 网络请求信号量
@property (strong, nonatomic) NSMutableArray *dataSource; ///< tableView的数据源

@end

