//
//  TRZXCustomerViewModel.h
//  TRZXMyCustomer
//
//  Created by Rhino on 2017/2/27.
//  Copyright © 2017年 Rhino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRZXCustomerViewModel : NSObject


//================================================================================================

/**
 *  我的客户
 *
 *  @param type    类型
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)myCustomerWithType:(NSString *)type pageNo:(NSString *)page success:(void (^)(id))success failure:(void (^)(NSError *))failure;

@end
