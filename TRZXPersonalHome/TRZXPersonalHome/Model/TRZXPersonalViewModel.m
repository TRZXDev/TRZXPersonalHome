//
//  TRZXPersonalViewModel.m
//  TRZXPersonalHome
//
//  Created by 张江威 on 2017/2/20.
//  Copyright © 2017年 张江威. All rights reserved.
//

#import "TRZXPersonalViewModel.h"

#import "MJExtension.h"

@implementation TRZXPersonalViewModel

// 采用懒加载的方式来配置网络请求
- (RACSignal *)requestSignal {
    
    if (!_requestSignal) {
        
        _requestSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            
            
            [TRZXNetwork requestWithUrl:nil params:self.parameters method:GET cachePolicy:NetworkingReloadIgnoringLocalCacheData callbackBlock:^(id response, NSError *error) {
                
                if (response) {
                    
                    self.dataSource = [TRZXCourse mj_objectArrayWithKeyValuesArray:response[@"data"]];
                    [subscriber sendNext:self.dataSource];
                    [subscriber sendCompleted];
                    
                }else{
                    [subscriber sendError:error];
                }
            }];
            
            // 在信号量作废时，取消网络请求
            return [RACDisposable disposableWithBlock:^{
                
                [TRZXNetwork cancelRequestWithURL:nil];
            }];
        }];
    }
    return _requestSignal;
}


@end

