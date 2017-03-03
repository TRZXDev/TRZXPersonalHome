//
//  CTMediator+MyCustomer.m
//  TRZXMyCustomer
//
//  Created by Rhino on 2017/2/27.
//  Copyright © 2017年 Rhino. All rights reserved.
//

#import "CTMediator+MyCustomer.h"

NSString * const kMyCustomerA = @"MyCustomer";

NSString * const kMyCustomerViewController              = @"MyCustomer_TRZXMyCustomerViewController";


@implementation CTMediator (MyCustomer)

- (UIViewController *)rh_MyCustomer_TRZXMyCustomerViewController:(NSDictionary *)parms{
    UIViewController *viewController = [self performTarget:kMyCustomerA
                                                    action:kMyCustomerViewController
                                                    params:parms
                                         shouldCacheTarget:NO
                                        ];
    if ([viewController isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return viewController;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

@end
