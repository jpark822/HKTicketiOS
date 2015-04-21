//
//  HKTSelectableImageView.m
//  HKTickets
//
//  Created by Jay Park on 4/20/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

#import "HKTSelectableGroupedImageView.h"


@implementation HKTSelectableGroupedImageView

- (void)awakeFromNib {
    [super awakeFromNib];
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectView)];
    [self addGestureRecognizer:recognizer];
}

- (void)selectView {
    self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor blackColor].CGColor;
    
    [self.selectableDelegate HKTSelectableImageViewDidSelect:self];
}

- (void)deselectView {
    self.layer.borderWidth = 0;
}

@end
