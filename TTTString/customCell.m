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
    TTTAttributedLabel *label = [[TTTAttributedLabel alloc] initWithFrame:CGRectMake(0, 0, 320, self.bounds.size.height)];
    label.numberOfLines = 0;
    
    _label = label;
    
    [self.contentView addSubview:self.label];

}


- (void)setTitleStr:(NSString *)titleStr{
    _titleStr = titleStr;

    [self.label setText:titleStr];
    
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


@end
