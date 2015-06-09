//
//  LGViewController.m
//  LGFlapJackStackView
//
//  Created by Luke Geiger on 06/05/2015.
//  Copyright (c) 2014 Luke Geiger. All rights reserved.
//

#import "LGViewController.h"
#import "LGFlapJackStackView.h"
#import "LGFlapJack.h"
#import <MessageUI/MFMailComposeViewController.h>

@interface LGViewController () <MFMailComposeViewControllerDelegate>
@property (nonatomic, strong) NSMutableArray *flapJacks;
@property (nonatomic, strong) LGFlapJackStackView *lgFlapJackStackView;
@end

@implementation LGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"LGFlapJackStack";
    
    //For the purposes of this demo
    NSMutableArray*flapJacks = [NSMutableArray new];
    for (int i = 0; i<12; i++) {
        LGFlapJack *flapJack = [LGFlapJack new];
        flapJack.leftBarTotal = [NSNumber numberWithInt:[self getRandomNumberBetween:0 to:100]];
        flapJack.rightBarTotal = [NSNumber numberWithInt:[self getRandomNumberBetween:0 to:100]];
        flapJack.leftBarColor = [UIColor colorWithRed:17/255. green:159/255. blue:194/255. alpha:1.0];
        flapJack.rightBarColor = [UIColor colorWithRed:206/255. green:218/255. blue:60/255. alpha:1.0];
        flapJack.inlineString = [self randomCategoryName];
        [flapJacks addObject:flapJack];
    }
    
    self.lgFlapJackStackView = [[LGFlapJackStackView alloc]initWithFrame:self.view.bounds];
    self.lgFlapJackStackView.flapJacks = flapJacks;
    self.lgFlapJackStackView.flapJackHeight = 42;
    self.lgFlapJackStackView.barLabelFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
    self.lgFlapJackStackView.barLabelTextColor = [UIColor colorWithRed:85/255. green:85/255. blue:85/255. alpha:1.0];
    self.lgFlapJackStackView.inlineLabelFont =  [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
    self.lgFlapJackStackView.inlineLabelTextColor = [UIColor colorWithRed:100/255. green:100/255. blue:100/255. alpha:1.0];
    self.lgFlapJackStackView.tableFooterView = [self sampleFooterView];
    
    //Name of the graph to be shown in email attachements.
    self.lgFlapJackStackView.name = @"lukegeiger";

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(exportGraphWasPressed)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor colorWithRed:17/255. green:159/255. blue:194/255. alpha:1.0];
    
    [self.view addSubview:self.lgFlapJackStackView];
}

#pragma mark Demo Funcs

-(int)getRandomNumberBetween:(int)from to:(int)to {
    
    return (int)from + arc4random() % (to-from+1);
}

-(UIView*)sampleFooterView{
    
    UIView*footer = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 115)];
    
    UIView*topCircle = [[UIView alloc]initWithFrame:CGRectMake(10, 5, 40, 40)];
    topCircle.backgroundColor = [UIColor colorWithRed:17/255. green:159/255. blue:194/255. alpha:1.0];
    topCircle.layer.cornerRadius = 20;
    topCircle.clipsToBounds = YES;
    [footer addSubview:topCircle];
    
    UIView*botomCircle = [[UIView alloc]initWithFrame:CGRectMake(10, 50, 40, 40)];
    botomCircle.backgroundColor = [UIColor colorWithRed:206/255. green:218/255. blue:60/255. alpha:1.0];
    botomCircle.layer.cornerRadius = 20;
    botomCircle.clipsToBounds = YES;
    [footer addSubview:botomCircle];
    
    UILabel*topLabel = [[UILabel alloc]initWithFrame:CGRectMake(topCircle.frame.origin.x+topCircle.frame.size.width+5, topCircle.frame.origin.y, 200, 40)];
    topLabel.backgroundColor = [UIColor clearColor];
    topLabel.textAlignment = NSTextAlignmentLeft;
    topLabel.text = @"Blue Team";
    topLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
    [footer addSubview:topLabel];
    
    UILabel*bottomLabel = [[UILabel alloc]initWithFrame:CGRectMake(topLabel.frame.origin.x, botomCircle.frame.origin.y, 200, 40)];
    bottomLabel.backgroundColor = [UIColor clearColor];
    bottomLabel.textAlignment = NSTextAlignmentLeft;
    bottomLabel.text = @"Green Team";
    bottomLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
    [footer addSubview:bottomLabel];
    
    return footer;
}

-(NSString*)randomCategoryName{
    NSArray *categories = @[@"PTS",@"STLS",@"BLKS",@"RBDS",@"AST",@"TOS",@"FOL",@"TECH",@"DRBD",@"ORBD",@"TOR",@"WP",@"PAR",@"TDX"];
    return [categories objectAtIndex:[self getRandomNumberBetween:0 to:(int)categories.count-1]];
}


-(void)exportGraphWasPressed{
    if ([MFMailComposeViewController canSendMail]) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Export" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *one = [UIAlertAction actionWithTitle:@"Excel" style:UIAlertActionStyleDefault handler:^(UIAlertAction*action){
            MFMailComposeViewController *mailViewController = [MFMailComposeViewController new];
            [mailViewController setMessageBody:@"If you enjoyed this demo, follow me on twitter! @lukejgeiger" isHTML:NO];
            mailViewController.mailComposeDelegate = self;
            
            NSData*data = [[self.lgFlapJackStackView graphAsCSVStringWithLeftBarName:@"Blue Team" rightBarName:@"Green Team"]dataUsingEncoding:NSUTF8StringEncoding];
            
            [mailViewController addAttachmentData:data mimeType:@"text/csv" fileName:[NSString stringWithFormat:@"%@.csv",self.lgFlapJackStackView.name]];
            [self presentViewController:mailViewController animated:YES completion:nil];
        }];
        
        UIAlertAction *two = [UIAlertAction actionWithTitle:@"Screenshot" style:UIAlertActionStyleDefault handler:^(UIAlertAction*action){
            MFMailComposeViewController *mailViewController = [MFMailComposeViewController new];
            [mailViewController setMessageBody:@"If you enjoyed this demo, follow me on twitter! @lukejgeiger" isHTML:NO];
            mailViewController.mailComposeDelegate = self;
            UIImage*graphs = self.lgFlapJackStackView.graphAsImage;
            NSData *data = UIImageJPEGRepresentation(graphs, 0.7);
            [mailViewController addAttachmentData:data mimeType:@"image/jpeg" fileName:self.lgFlapJackStackView.name];
            [self presentViewController:mailViewController animated:YES completion:nil];
        }];
        
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction*action){}];
        
        [alertController addAction:one];
        [alertController addAction:two];
        [alertController addAction:cancel];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }

}

#pragma mark - MFMailComposeViewControllerDelegate

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [controller dismissViewControllerAnimated:YES completion:nil];
}


@end
