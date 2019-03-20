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

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setupRHLabels];
    [self changeText];
    [NSTimer scheduledTimerWithTimeInterval:5
                                    repeats:YES
                                      block:^(NSTimer * _Nonnull timer) {
                                          
                                          [self changeText];
                                      }];
}

- (void)setupRHLabels {
    
    self.labelRobinhood.animationDuration = 3;
    self.labelRobinhood.config = [RHLabelConfig defaultConfig];
}

- (void)changeText {
    
    NSNumber *n1 = [[NSNumber alloc]initWithInt:(arc4random() % 10)];
    self.labelRobinhood.text = [n1 stringValue];
}


@end
