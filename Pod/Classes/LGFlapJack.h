//
//  LGFlapjack.h
//  FlapjackStack
//
//  Created by Luke Geiger on 6/4/15.
//  Copyright (c) 2015 Geiger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 The LGFlapJack is a model object that determines how a flapjack should appear on screen. You can subclass this if you want to override the string that appears in the left and right bars of the flapjack
 */
@interface LGFlapJack : NSObject

/**
 The string that appears on the left of each cell.
 */
@property (nonatomic, strong) NSString *inlineString;

/**
 The color of the left bar.
 */
@property (nonatomic, strong) UIColor *leftBarColor;

/**
 The color of the right bar.
 */
@property (nonatomic, strong) UIColor *rightBarColor;

/**
 The total of the left bar.
 */
@property (nonatomic, strong) NSNumber *leftBarTotal;

/**
 The total of the right bar.
 */
@property (nonatomic, strong) NSNumber *rightBarTotal;

/**
 The string that appears in the left bar on the flap jack. Subclass this class to customize.
 */
-(NSString*)leftBarFormatString;

/**
 The string that appears in the right bar on the flap jack. Subclass this class to customize.
 */
-(NSString*)rightBarFormatString;

@end
