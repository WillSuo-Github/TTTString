//
//  ViewController.m
//  TTTString
//
//  Created by mac on 16/4/13.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import "TTTAttributedLabel.h"

@interface ViewController ()<TTTAttributedLabelDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *str = @"ws：i love you";
    
    
    TTTAttributedLabel *label = [[TTTAttributedLabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    label.numberOfLines = 0;
    label.delegate = self;
    [label setText:str afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        
        
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
//        
//        
        return mutableAttributedString;
    }];
    [self.view addSubview:label];
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = NSTextAlignmentCenter;
    
    NSRange stringRange = NSMakeRange(0, [label.text length]);
    NSRegularExpression *regular = [[NSRegularExpression alloc] initWithPattern:@"^\\w+" options:NSRegularExpressionCaseInsensitive error:nil];
    NSRange nameRange = [regular rangeOfFirstMatchInString:label.text options:NSMatchingReportProgress range:stringRange];
    NSURL *url = [NSURL URLWithString:@"www.baidu.com"];
    label.linkAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:18],
                                   NSParagraphStyleAttributeName:paragraph,
                                   NSForegroundColorAttributeName:[UIColor redColor],
                                   NSStrokeWidthAttributeName : @1,
                                   NSStrokeColorAttributeName : [UIColor redColor]};
    [label addLinkToURL:url withRange:nameRange];
    [label sizeToFit];
    
    
}

- (void)attributedLabel:(TTTAttributedLabel *)label
   didSelectLinkWithURL:(NSURL *)url{
    
    NSLog(@"%@",url);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
