//
//  TRZXSDBaseRefreshView.h
//  GSD_WeiXin(wechat)

#import <UIKit/UIKit.h>

UIKIT_EXTERN NSString *const kTRZXSDBaseRefreshViewObserveKeyPath;

typedef enum {
    SDWXRefreshViewStateNormal,
    SDWXRefreshViewStateWillRefresh,
    SDWXRefreshViewStateRefreshing,
} SDWXRefreshViewState;

@interface TRZXSDBaseRefreshView : UIView

@property (nonatomic, strong) UIScrollView *scrollView;

- (void)endRefreshing;

@property (nonatomic, assign) UIEdgeInsets scrollViewOriginalInsets;
@property (nonatomic, assign) SDWXRefreshViewState refreshState;

@end
