//
//  CJWUIButtonScrollView.m
//
//  Created by Corey Wendling on 6/13/13.
//  Copyright (c) 2013
//  See the file LICENSE for copying permission.
//

#import "CJWUIButtonScrollView.h"

#pragma mark - CJWUIScrollButton

@implementation CJWUIScrollButton

- (id)initWithSize:(CGSize)size {
    CGRect frame = CGRectMake(0, 0, size.width, size.height);
    self = [super initWithFrame:frame];
    if (self) {
        self.labels = [[NSMutableArray alloc] init];
        self.images = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addLabel:(CGRect)rect text:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font {
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    label.font = font;
    label.text = text;
    label.textColor = textColor;
    label.backgroundColor = [UIColor clearColor];
    label.opaque = NO;
    label.numberOfLines = 0;
    label.lineBreakMode = UILineBreakModeWordWrap;
    [label sizeToFit];
    [self.labels addObject:label];
    [self addSubview:label];
}

- (void)addImage:(CGRect)rect image:(UIImage *)image {
    if (image == nil) {
        NSLog(@"CJWUIScrollButton image is nil");
    }
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = rect;
    [self.images addObject:imageView];
    [self addSubview:imageView];
}

@end

#pragma mark - CJWUIButtonScrollView

@implementation CJWUIButtonScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.buttonArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)buttonTouched:(id)sender {
    [self.delegate2 buttonScrollViewButtonClicked:sender];
}

- (void)addButton:(CJWUIScrollButton *)button {
    [self.buttonArray addObject:button];
    [button addTarget:self action: @selector(buttonTouched:) forControlEvents: UIControlEventTouchUpInside];
}

- (void)addImageToButton:(NSUInteger)idx rect:(CGRect)rect image:(UIImage *)image {
    [(CJWUIScrollButton *)[self.buttonArray objectAtIndex:idx] addImage:rect image:image];
}

- (void)removeAllButtons {
    [self.buttonArray removeAllObjects];
}

- (void)updateButtons {
    [self.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIView *view = (UIView *)obj;
        [view removeFromSuperview];
    }];
    __block int i=0;
    __block float height=0;
    [self.buttonArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        CJWUIScrollButton *button = (CJWUIScrollButton *)obj;
        CGRect rect = CGRectMake(button.frame.origin.x, self.buttonSpacing + (button.frame.size.height + self.buttonSpacing) * i, button.frame.size.width, button.frame.size.height);
        [button setFrame:rect];
        height = self.buttonSpacing + (button.frame.size.height + self.buttonSpacing * i) + button.frame.size.height;
        [self addSubview:button];
        i++;
    }];
    self.contentSize = CGSizeMake(self.frame.size.width, height);
}

@end
