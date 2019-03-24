//
//  ViewController.m
//  RobinhoodLabels
//
//  Created by Gevorg Ghukasyan on 2019-03-13.
//  Copyright © 2019 Gevorg Ghukasyan. All rights reserved.
//

#import "ViewController.h"
#import "RHNumbersView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet RHNumbersView *labelRobinhood;
@property (weak, nonatomic) IBOutlet UILabel *labelText;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setupRHLabels];
    [self changeText];
    [NSTimer scheduledTimerWithTimeInterval:4
                                    repeats:YES
                                      block:^(NSTimer * _Nonnull timer) {
                                          
                                          [self changeText];
                                      }];
}

- (void)setupRHLabels {
    
    self.labelRobinhood.animationDuration = 2;
    self.labelRobinhood.config = [RHLabelConfig defaultConfig];
}

- (void)changeText {
    
    NSNumber *n1 = [[NSNumber alloc]initWithInt:(arc4random() % 8999) + 1000];
    NSLog(@"changeText %@", [n1 stringValue]);
    self.labelText.text = [n1 stringValue];
    
    self.labelRobinhood.text = [n1 stringValue];
}


@end
