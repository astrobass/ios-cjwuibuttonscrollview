//
//  CJWUIButtonScrollView.h
//
//  Created by Corey Wendling on 6/13/13.
//  Copyright (c) 2013
//  See the file LICENSE for copying permission.
//

#import <UIKit/UIKit.h>
#import "CJWLibrary.h"

@interface CJWUIScrollButton : UIButton

@property (nonatomic) UIColor    *highlightBackgroundColor;

@property (nonatomic) NSMutableArray *labels;
@property (nonatomic) NSMutableArray *images;
@property (nonatomic) NSMutableDictionary *dictionary;

- (id)initWithSize:(CGSize)size;
- (void)addLabel:(CGRect)rect text:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font;
- (void)addImage:(CGRect)rect image:(UIImage *)image;

@end

@class CJWUIButtonScrollView;
@protocol CJWUIButtonScrollViewDelegate <NSObject>

-(void)buttonScrollViewButtonClicked:(id)sender;

@end

@interface CJWUIButtonScrollView : UIScrollView

@property (nonatomic) id<CJWUIButtonScrollViewDelegate> delegate2;
@property (nonatomic) NSMutableArray *buttonArray;
@property (nonatomic) float buttonSpacing;
@property (nonatomic) UIColor *buttonBackgroundColor;
@property (nonatomic) UIColor *highlightButtonBackgroundColor;

- (void)addButton:(CJWUIScrollButton *)button;
- (void)addImageToButton:(NSUInteger)idx rect:(CGRect)rect image:(UIImage *)image;
//- (void)removeButton:(id)key;
- (void)removeAllButtons;
- (void)updateButtons;

@end
