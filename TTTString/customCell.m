//
//  customCell.m
//  TTTString
//
//  Created by ws on 16/4/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "customCell.h"


@interface customCell ()



@end

@implementation customCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setUpSubViews];
    }
    
    return self;
}


- (void)setUpSubViews{
    
    self.isAccessibilityElement = NO;
    NSLog(@"%f",self.bounds.size.width);
    TTTAttributedLabel *label = [[TTTAttributedLabel alloc] initWithFrame:CGRectMake(0, 0, 320, self.bounds.size.height)];
    label.numberOfLines = 0;
    
    self.label = label;
    
    [self.contentView addSubview:self.label];

}


- (void)setTitleStr:(NSString *)titleStr{
    _titleStr = titleStr;
    
    [self.label setText:titleStr afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        
        
        //        NSRange stringRange = NSMakeRange(0, mutableAttributedString.length);
        //        NSRegularExpression *regular = [[NSRegularExpression alloc] initWithPattern:@"^\\w+" options:NSRegularExpressionCaseInsensitive error:nil];
        //        NSRange nameRange = [regular rangeOfFirstMatchInString:[mutableAttributedString string] options:NSMatchingReportProgress range:stringRange];
        ////        NSString *str = [mutableAttributedString attributedSubstringFromRange:nameRange].string;
        ////        NSLog(@"%@",str);
        //
        //        UIFont *titleNameFont = [UIFont systemFontOfSize:17];
        //        CTFontRef titleRefFont = CTFontCreateWithName((__bridge CFStringRef)titleNameFont.fontName, titleNameFont.pointSize, NULL);
        //
        //        if (titleRefFont) {
        //            [mutableAttributedString removeAttribute:(__bridge NSString *)kCTFontAttributeName range:nameRange];
        //            [mutableAttributedString addAttribute:(__bridge NSString *)kCTFontAttributeName value:(__bridge id _Nonnull)(titleRefFont) range:nameRange];
        //            CFRelease(titleRefFont);
        //        }
        //
        //        [mutableAttributedString replaceCharactersInRange:nameRange withString:[[mutableAttributedString string] substringWithRange:nameRange]];
        
        return mutableAttributedString;
    }];
    
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = NSTextAlignmentCenter;
    
    NSRange stringRange = NSMakeRange(0, [self.label.text length]);
    NSRegularExpression *regular = [[NSRegularExpression alloc] initWithPattern:@"^\\w+" options:NSRegularExpressionCaseInsensitive error:nil];
    NSRange nameRange = [regular rangeOfFirstMatchInString:self.label.text options:NSMatchingReportProgress range:stringRange];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",[self.label.text substringWithRange:nameRange]]];
    self.label.linkAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:18],
                             NSParagraphStyleAttributeName:paragraph,
                             NSForegroundColorAttributeName:[UIColor redColor],
                             NSStrokeWidthAttributeName : @1,
                             NSStrokeColorAttributeName : [UIColor redColor]};
    [self.label addLinkToURL:url withRange:nameRange];
    [self.label sizeToFit];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    
    self.label.frame = CGRectMake(0, 0, 320, self.bounds.size.height);
    
//    [self setNeedsDisplay];
}

@end
