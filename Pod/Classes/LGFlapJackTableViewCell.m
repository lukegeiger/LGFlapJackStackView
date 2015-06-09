//
//  LGFlapJackTableViewCell.m
//  FlapjackStack
//
//  Created by Luke Geiger on 6/4/15.
//  Copyright (c) 2015 Geiger. All rights reserved.
//

#import "LGFlapJackTableViewCell.h"



@interface LGFlapJackTableViewCell ()
@property (nonatomic, strong) UIView *leftBarView;
@property (nonatomic, strong) UIView *rightBarView;
@property (nonatomic, assign) float leftPercentage;
@property (nonatomic, assign) float rightPercentage;
@property (nonatomic, strong) NSString *inlineString;
@end

@implementation LGFlapJackTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.leftPercentage = 0.5;
        self.rightPercentage = 0.5;
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.inlineLabel = [[UILabel alloc]init];
        self.inlineLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.inlineLabel];
        
        self.leftBarView = [[UIView alloc]init];
                
        self.leftBarLabel = [[UILabel alloc]init];
        self.leftBarLabel.textAlignment = NSTextAlignmentCenter;
        self.leftBarLabel.numberOfLines = 0;
        
        [self.leftBarView addSubview:self.leftBarLabel];
        [self.contentView addSubview:self.leftBarView];
        
        self.rightBarView = [[UIView alloc]init];
        
        self.rightBarLabel = [[UILabel alloc]init];
        self.rightBarLabel.numberOfLines = 0;
        self.rightBarLabel.textAlignment = NSTextAlignmentCenter;
        
        [self.rightBarView addSubview:self.rightBarLabel];
        [self.contentView addSubview:self.rightBarView];

    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    float inlineLabelWidth = (self.inlineString)?70:0;
    self.inlineLabel.frame = CGRectMake(0, 0, inlineLabelWidth, self.frame.size.height);
    
    float width = self.frame.size.width - self.inlineLabel.frame.size.width;
    
    float leftWidth = self.leftPercentage * width;    
    float rightWidth = self.rightPercentage * width;

    self.leftBarView.frame = CGRectMake(self.inlineLabel.frame.size.width, 0, leftWidth, self.frame.size.height);
    self.rightBarView.frame = CGRectMake(leftWidth+self.inlineLabel.frame.size.width, 0, rightWidth, self.frame.size.height);
    
    self.leftBarLabel.frame = self.leftBarView.bounds;
    self.rightBarLabel.frame = self.rightBarView.bounds;
}

-(void)updateForFlapJack:(LGFlapJack *)flapJack{
    
    self.inlineString = (flapJack.inlineString.length>0)?flapJack.inlineString:nil;
    self.inlineLabel.text = self.inlineString;
    
    self.leftBarView.backgroundColor = flapJack.leftBarColor;
    self.rightBarView.backgroundColor = flapJack.rightBarColor;
    
    float pointTotal = flapJack.leftBarTotal.integerValue + flapJack.rightBarTotal.integerValue;
    float leftPercentage = (flapJack.leftBarTotal.integerValue / pointTotal);
    float rightPercentage = (flapJack.rightBarTotal.integerValue / pointTotal);
    
    self.leftPercentage = leftPercentage;
    self.rightPercentage = rightPercentage;
    
    self.leftBarLabel.text = flapJack.leftBarFormatString;
    self.rightBarLabel.text = flapJack.rightBarFormatString;
}



@end
