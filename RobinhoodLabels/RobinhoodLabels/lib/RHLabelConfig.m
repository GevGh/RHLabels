//
//  RHLabelConfig.m
//  RobinhoodLabels
//
//  Created by Gevorg Ghukasyan on 2019-03-20.
//  Copyright © 2019 Gevorg Ghukasyan. All rights reserved.
//


#import "RHLabelConfig.h"

@implementation RHLabelConfig

- (instancetype)init {
    self = [super init];
    
    return self;
}

+ (instancetype)defaultConfig {
    
    RHLabelConfig *config = [RHLabelConfig new];
    config.font = [UIFont systemFontOfSize:25];
    config.textColor = [UIColor blackColor];
    return config;
}

@end
