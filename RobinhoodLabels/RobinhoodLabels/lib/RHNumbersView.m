//
//  RHNumbersView.m
//  RobinhoodLabels
//
//  Created by Gevorg Ghukasyan on 2019-03-13.
//  Copyright © 2019 Gevorg Ghukasyan. All rights reserved.
//

#import "RHNumbersView.h"
#import "RHNumberPointView.h"
#import "NSString+RHLabelEnumeration.h"

@interface RHNumbersView ()

@property (strong, nonatomic) NSMutableArray *points;

@end

@implementation RHNumbersView

- (instancetype)init {
    
    self = [super init];
    if (self) {
        [self initalSetup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self initalSetup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initalSetup];
    }
    return self;
}

- (void)initalSetup {
    
    self.clipsToBounds = YES;
    self.animationDuration = 5;//by default 5 seconds
}

- (void)setText:(NSString *)text {
    _text = text;
    [self setup];
}

- (void)setup {
//    if (self.points) {
//        [self initalSetup];
//    } else {
        [self changeString];
//    }
}

//- (void)initalSetup {
//
//    NSString *text = _text;
//
//    self.points = [NSMutableArray new];
//    NSInteger length = text.length;
//
//    CGFloat superWidth = self.frame.size.width;
//    [text enumerateCharactersUsingBlock:^(NSString * _Nonnull character, NSInteger idx) {
//
//        RHNumberPointView *pointView = [[RHNumberPointView alloc] init];
//        CGFloat xOrigin = (superWidth / length) * idx;
//        pointView.frame = CGRectMake(xOrigin, self.center.y, pointView.frame.size.width, pointView.frame.size.height);
//
//        pointView.text = character;
//        [self.points addObject:pointView];
//    }];
//}

- (void)changeString {
    
    NSString *text = _text;
    if (!self.points) {
        self.points = [NSMutableArray new];
    }
    NSInteger length = text.length;
    
    CGFloat superWidth = self.frame.size.width;
    [text enumerateCharactersUsingBlock:^(NSString * _Nonnull character, NSInteger idx) {
        
        
        if (self.points.count >= length && self.points.count <= idx) {

            RHNumberPointView *pointView = self.points[idx];
            [pointView removeFromSuperview];
            [self.points removeObjectAtIndex:idx];
            return;
        }
        
        if (self.points.count > idx) { //need to animate
            
            RHNumberPointView *pointView = self.points[idx];
            //CGFloat xOrigin = (superWidth / length) * idx;
//            pointView.frame = CGRectMake(xOrigin, 0, pointView.width, self.frame.size.height);
            [pointView animateToValue:character withTime:self.animationDuration];
            return;
        } else { // self.points.count < idx // need to add new view
        
            RHNumberPointView *pointView = [[RHNumberPointView alloc] initWithFrame:CGRectMake(0, 0, self.fontWidth, self.frame.size.height)];
            
            pointView.text = character;
            
            [pointView configChange:self.config];
            CGFloat xOrigin = (self.fontWidth + 0) * idx;
            pointView.frame = CGRectMake(xOrigin, 0, self.fontWidth, self.frame.size.height);
            [self addSubview:pointView];
            [self.points addObject:pointView];
        }
    }];
}

- (double)fontWidth {
    
    UIFont *font = self.config.font;
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    return [[[NSAttributedString alloc] initWithString:@"8" attributes:attributes] size].width;
}

@end
