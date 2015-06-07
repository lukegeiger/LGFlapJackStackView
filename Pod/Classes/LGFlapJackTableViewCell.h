//
//  LGFlapJackTableViewCell.h
//  FlapjackStack
//
//  Created by Luke Geiger on 6/4/15.
//  Copyright (c) 2015 Geiger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LGFlapJack.h"

/**
 This is the view that is responsible for displaying a single flap jack.
 */
@interface LGFlapJackTableViewCell : UITableViewCell

/**
 Updates the neccessary views for the desired flap jack.
 */
-(void)updateForFlapJack:(LGFlapJack *)flapJack;

/**
 The left bar label.
 */
@property (nonatomic, strong) UILabel *leftBarLabel;

/**
 The right bar label.
 */
@property (nonatomic, strong) UILabel *rightBarLabel;

/**
 The in line label.
 */
@property (nonatomic, strong) UILabel *inlineLabel;

@end
