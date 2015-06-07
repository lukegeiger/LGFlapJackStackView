//
//  LGFlapjackStackView.h
//  FlapjackStack
//
//  Created by Luke Geiger on 6/4/15.
//  Copyright (c) 2015 Geiger. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 This is a graph that allows you to display two point values against each other. The higher the point value on the left or right, the more dominant the side appears in terms of width. This is a useful class if you are trying to display a "head to head" sort of deal.
 */
@interface LGFlapJackStackView : UIView

/**
  Each head to head match up a flapjack. The number of flap jacks in this array, will determine the number of sections.
 */
@property (nonatomic, strong) NSArray *flapJacks;

/**
 The font of the category name of each matchup that gets displayed on the cell.
 */
@property (nonatomic, strong) UIFont *inlineLabelFont;

/**
 The font of the bar labels that gets displayed on each cell.
 */
@property (nonatomic, strong) UIFont *barLabelFont;

/**
 The text color of the category name of each matchup that gets displayed on the cell.
 */
@property (nonatomic, strong) UIColor *inlineLabelTextColor;

/**
 The text color of the bar labels of each matchup that gets displayed on the cell.
 */
@property (nonatomic, strong) UIColor *barLabelTextColor;

/**
 The height of each section.
 */
@property (nonatomic, assign) CGFloat flapJackHeight;

/**
 Optional, if you want to add a legend footer, just pass it in here.
 */
@property (nonatomic, weak)   UIView *tableFooterView;

/**
 Optional, if you want to add a legend header, just pass it in here.
 */
@property (nonatomic, weak)   UIView *tableHeaderView;


/**
    Reloads the table.
 */

-(void)reload;

@end
