//
//  HKTJacketCustomizeViewController.m
//  HKTickets
//
//  Created by Jay Park on 4/20/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

#import "HKTJacketCustomizeViewController.h"
#import "HKTSelectableGroupedImageView.h"
#import <MessageUI/MFMailComposeViewController.h>

@interface HKTJacketCustomizeViewController () <HKTSelectableImageViewDelegate, MFMailComposeViewControllerDelegate>

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

@property (strong, nonatomic) NSArray *ventArray;
@property (strong, nonatomic) HKTSelectableGroupedImageView *selectedVent;
@property (weak, nonatomic) IBOutlet HKTSelectableGroupedImageView *ventNoneView;
@property (weak, nonatomic) IBOutlet HKTSelectableGroupedImageView *ventCenterView;
@property (weak, nonatomic) IBOutlet HKTSelectableGroupedImageView *ventSideView;

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
    
    self.ventArray = @[self.ventNoneView, self.ventCenterView, self.ventSideView];
    self.ventNoneView.selectableDelegate = self;
    self.ventCenterView.selectableDelegate = self;
    self.ventSideView.selectableDelegate = self;
}

- (void)HKTSelectableImageViewDidSelect:(HKTSelectableGroupedImageView *)selectedView {
    NSLog(selectedView.imageIdentifier);
    
    NSArray *arrayGroup;
    if ([selectedView.groupIdentifier isEqualToString:@"lapel"]) {
        self.selectedLapel = selectedView;
        arrayGroup = self.lapelArray;
    }
    else if ([selectedView.groupIdentifier isEqualToString:@"button"]) {
        self.selectedButton = selectedView;
        arrayGroup = self.buttonArray;
    }
    else if ([selectedView.groupIdentifier isEqualToString:@"vent"]) {
        self.selectedVent = selectedView;
        arrayGroup = self.ventArray;
    }
    
    //deselct all other items in that group
    NSArray *untappedViews = [arrayGroup filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF != %@", selectedView]];
    for (HKTSelectableGroupedImageView *lapelView in untappedViews) {
        [lapelView deselectView];
    }
}

- (IBAction)nextPressed:(id)sender {
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *composeViewController = [[MFMailComposeViewController alloc] initWithNibName:nil bundle:nil];
        [composeViewController setMailComposeDelegate:self];
        [composeViewController setToRecipients:@[@"hongkongtailors@hongkong.com"]];
        [composeViewController setSubject:@"Order #294A824D"];
        [composeViewController setMessageBody:@"Neil Balani \n body measurements \n chest: 42 \n waist: 34 \n hips: 38 \n  \n Finishing Measurements \n chest: 43 \n waist: 35 \n hips: 39 \n  \n lapel: L9 \n buttons: two button \n vent: single" isHTML:NO];
        [self presentViewController:composeViewController animated:YES completion:nil];
    }
}

- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error;
{
    if (result == MFMailComposeResultSent || result == MFMailComposeResultSaved) {
        NSLog(@"It's away!");
        [controller dismissViewControllerAnimated:YES completion:^{
            [self.navigationController popToRootViewControllerAnimated:YES];
        }];
    }
    else  {
        [controller dismissViewControllerAnimated:YES completion:nil];
    }
    
    
    
}


@end
