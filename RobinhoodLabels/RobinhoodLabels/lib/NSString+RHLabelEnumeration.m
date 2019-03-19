//
//  NSString+RHLabelEnumeration.m
//  RobinhoodLabels
//
//  Created by Gevorg Ghukasyan on 2019-03-17.
//  Copyright © 2019 Gevorg Ghukasyan. All rights reserved.
//

#import "NSString+RHLabelEnumeration.h"

@implementation NSString (RHLabelEnumeration)

- (void)enumerateCharactersUsingBlock:(void (^)(NSString *character, NSInteger idx))block {
    
    for (NSInteger i = 0; i < [self length]; i++) {
        NSString *character = [self substringWithRange:NSMakeRange(i, 1)];
        block(character, i);
    }
}

@end
