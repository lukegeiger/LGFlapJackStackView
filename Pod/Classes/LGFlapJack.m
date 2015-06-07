//
//  LGFlapjack.m
//  FlapjackStack
//
//  Created by Luke Geiger on 6/4/15.
//  Copyright (c) 2015 Geiger. All rights reserved.
//

#import "LGFlapJack.h"

@implementation LGFlapJack

-(NSString*)leftBarFormatString{
    float percentage = (self.leftBarTotal.floatValue/(self.leftBarTotal.integerValue+self.rightBarTotal.integerValue));
    return [NSString stringWithFormat:@"%@\n(%.1lf%%)",self.leftBarTotal,(percentage*100)];
}

-(NSString*)rightBarFormatString{
    float percentage = (self.rightBarTotal.floatValue/(self.leftBarTotal.integerValue+self.rightBarTotal.integerValue));
    return [NSString stringWithFormat:@"%@\n(%.1lf%%)",self.rightBarTotal,(percentage*100)];
}

@end
