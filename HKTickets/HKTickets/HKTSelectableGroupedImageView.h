//
//  HKTSelectableImageView.h
//  HKTickets
//
//  Created by Jay Park on 4/20/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HKTSelectableGroupedImageView;
@protocol HKTSelectableImageViewDelegate <NSObject>

- (void)HKTSelectableImageViewDidSelect:(HKTSelectableGroupedImageView *)selectedView;

@end

IB_DESIGNABLE
@interface HKTSelectableGroupedImageView : UIImageView

@property (nonatomic) IBInspectable NSString *imageIdentifier;
@property (nonatomic) IBInspectable NSString *groupIdentifier;

@property (weak, nonatomic) id<HKTSelectableImageViewDelegate> selectableDelegate;

- (void)deselectView;
- (void)selectView;

@end



