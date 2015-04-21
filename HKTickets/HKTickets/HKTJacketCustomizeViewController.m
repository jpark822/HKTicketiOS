//
//  HKTJacketCustomizeViewController.m
//  HKTickets
//
//  Created by Jay Park on 4/20/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

#import "HKTJacketCustomizeViewController.h"
#import "HKTSelectableGroupedImageView.h"

@interface HKTJacketCustomizeViewController () <HKTSelectableImageViewDelegate>

@property (strong, nonatomic) NSArray *lapelArray;
@property (strong, nonatomic) HKTSelectableGroupedImageView *selectedLapel;
@property (weak, nonatomic) IBOutlet HKTSelectableGroupedImageView *LapelNotchRegularView;
@property (weak, nonatomic) IBOutlet HKTSelectableGroupedImageView *LapelNotchSlimView;
@property (weak, nonatomic) IBOutlet HKTSelectableGroupedImageView *LapelNotchPeakWide;
@property (weak, nonatomic) IBOutlet HKTSelectableGroupedImageView *LapelNotchPeakRegular;
@property (weak, nonatomic) IBOutlet HKTSelectableGroupedImageView *LapelShawlView;

@property (strong, nonatomic) NSArray *buttonArray;
@property (strong, nonatomic) HKTSelectableGroupedImageView *selectedButton;
@property (weak, nonatomic) IBOutlet HKTSelectableGroupedImageView *buttonSingleView;
@property (weak, nonatomic) IBOutlet HKTSelectableGroupedImageView *buttonTwoView;
@property (weak, nonatomic) IBOutlet HKTSelectableGroupedImageView *buttonThreeView;
@property (weak, nonatomic) IBOutlet HKTSelectableGroupedImageView *buttonDoubleBreastedView;

@end

@implementation HKTJacketCustomizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.lapelArray = @[self.LapelNotchRegularView, self.LapelNotchSlimView, self.LapelNotchPeakWide, self.LapelNotchPeakRegular, self.LapelShawlView];
    self.LapelNotchRegularView.selectableDelegate = self;
    self.LapelNotchSlimView.selectableDelegate = self;
    self.LapelNotchPeakRegular.selectableDelegate = self;
    self.LapelNotchPeakWide.selectableDelegate = self;
    self.LapelShawlView.selectableDelegate = self;
    
    self.buttonArray = @[self.buttonDoubleBreastedView, self.buttonSingleView, self.buttonThreeView, self.buttonTwoView];
    self.buttonDoubleBreastedView.selectableDelegate = self;
    self.buttonSingleView.selectableDelegate = self;
    self.buttonThreeView.selectableDelegate = self;
    self.buttonTwoView.selectableDelegate = self;
    
}

- (void)HKTSelectableImageViewDidSelect:(HKTSelectableGroupedImageView *)selectedView {
    NSLog(selectedView.imageIdentifier);
    
    NSArray *arrayGroup;
    if ([selectedView.groupIdentifier isEqualToString:@"lapel"]) {
        self.selectedLapel = selectedView;
        arrayGroup = self.lapelArray;
    }
    else if ([selectedView.groupIdentifier isEqualToString:@"button"]) {
        self.selectedLapel = selectedView;
        arrayGroup = self.buttonArray;
    }
    
    NSArray *untappedViews = [arrayGroup filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF != %@", selectedView]];
    for (HKTSelectableGroupedImageView *lapelView in untappedViews) {
        [lapelView deselectView];
    }
}

@end
