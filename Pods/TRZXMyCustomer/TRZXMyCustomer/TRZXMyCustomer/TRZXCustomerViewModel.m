//
//  TRZXCustomerViewModel.m
//  TRZXMyCustomer
//
//  Created by Rhino on 2017/2/27.
//  Copyright © 2017年 Rhino. All rights reserved.
//

#import "TRZXCustomerViewModel.h"
#import "TRZXNetwork.h"


@implementation TRZXCustomerViewModel


//================================================================================================

/**
 *  我的客户
 *
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)myCustomerWithType:(NSString *)type pageNo:(NSString *)page success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSDictionary *param = @{
                            @"type":type?type:@"",
                            @"pageNo":page?page:@"1",
                            @"apiType":@"myCustomer",
                            @"requestType":@"Member_Api"
                            };
    [TRZXNetwork configHttpHeaders:@{@"equipment":@"ios",
                                     @"token":@"9bfc515a2fc0ea364a4340f38f7f47ff",
                                     @"userId":@"60a121b25cb34088987041b3b7632098"}];
    
    [TRZXNetwork requestWithUrl:nil params:param method:POST cachePolicy:NetworkingReloadIgnoringLocalCacheData callbackBlock:^(id response, NSError *error) {
        if (response) {
            success(response);
        }else{
            failure(error);
        }
    }];
}

@end
