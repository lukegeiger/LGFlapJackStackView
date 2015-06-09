//
//  LGFlapjackStackView.m
//  FlapjackStack
//
//  Created by Luke Geiger on 6/4/15.
//  Copyright (c) 2015 Geiger. All rights reserved.
//

#import "LGFlapJackStackView.h"
#import "LGFlapJackTableViewCell.h"
#import "LGFlapJack.h"

@interface LGFlapJackStackView () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)  UITableView *tableView;
@end

@implementation LGFlapJackStackView

static NSString *cellIdentifier = @"CellIdentifier";

#pragma mark Life Cycle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self defaultSettings];
    }
    return self;
}

-(id)init{
    self = [super init];
    if (self) {
        [self defaultSettings];
    }
    return self;
}

-(void)defaultSettings{
    
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

    _flapJackHeight = 50;
    _barLabelFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
    _inlineLabelFont =  [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
    _inlineLabelTextColor = [UIColor colorWithRed:100/255. green:100/255. blue:100/255. alpha:1.0];
    _barLabelTextColor = [UIColor colorWithRed:85/255. green:85/255. blue:85/255. alpha:1.0];
    _name = @"LGFlapJackStack";
    
    self.tableView = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[LGFlapJackTableViewCell class] forCellReuseIdentifier:cellIdentifier];
    self.tableView.tableFooterView = [UIView new];
    
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    [self addSubview:self.tableView];
}

#pragma mark Setter Overrides

-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    self.tableView.frame = self.bounds;
}

-(void)setBarLabelFont:(UIFont *)barLabelFont{
    _barLabelFont = barLabelFont;
    [self.tableView reloadData];
}

-(void)setInlineLabelFont:(UIFont *)inlineLabelFont{
    _inlineLabelFont = inlineLabelFont;
    [self.tableView reloadData];
}

-(void)setBarLabelTextColor:(UIColor *)barLabelTextColor{
    _barLabelTextColor = barLabelTextColor;
    [self.tableView reloadData];
}

-(void)setInlineLabelTextColor:(UIColor *)inlineLabelTextColor{
    _inlineLabelTextColor = inlineLabelTextColor;
    [self.tableView reloadData];
}

-(void)setTableFooterView:(UIView *)tableFooterView{
    _tableFooterView = tableFooterView;
    self.tableView.tableFooterView = tableFooterView;
}

-(void)setTableHeaderView:(UIView *)tableHeaderView{
    _tableHeaderView = tableHeaderView;
    self.tableHeaderView = tableHeaderView;
}

-(void)setFlapJackHeight:(CGFloat)flapJackHeight{
    _flapJackHeight = flapJackHeight;
    [self.tableView reloadData];
}

#pragma mark Setter Overrides

-(void)setFlapJacks:(NSArray *)flapJacks
{
    _flapJacks = flapJacks;
    [self.tableView reloadData];
}

#pragma mark Table View Data Source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _flapJacks.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _flapJackHeight;
}

#pragma mark Table View Delegate

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LGFlapJackTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.leftBarLabel.font = self.barLabelFont;
    cell.rightBarLabel.font = self.barLabelFont;
    cell.inlineLabel.font = self.inlineLabelFont;
    cell.leftBarLabel.textColor = self.barLabelTextColor;
    cell.rightBarLabel.textColor = self.barLabelTextColor;
    cell.inlineLabel.textColor = self.inlineLabelTextColor;
    
    LGFlapJack *flapJack = [_flapJacks objectAtIndex:indexPath.section];
    
    [cell updateForFlapJack:flapJack];

    return cell;
}

#pragma mark Funcs

-(void)reload{
    [self.tableView reloadData];
}

-(UIImage*)graphAsImage{
    UIImage *image = nil;
    UIGraphicsBeginImageContextWithOptions(self.tableView.bounds.size, NO, [UIScreen mainScreen].scale);
    [self.tableView.layer renderInContext:UIGraphicsGetCurrentContext()];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

-(NSString*)graphAsCSVStringWithLeftBarName:(NSString *)leftBarName rightBarName:(NSString *)rightBarName{
    NSMutableString *csvString = [NSMutableString new];
    [csvString appendString:[NSString stringWithFormat:@"Category,%@,%@\n",leftBarName,rightBarName]];
    for (LGFlapJack*flapJack in _flapJacks) {
        [csvString appendString:[NSString stringWithFormat:@"%@,%@,%@\n",flapJack.inlineString,flapJack.leftBarTotal,flapJack.rightBarTotal]];
    }
    return csvString;
}

@end
