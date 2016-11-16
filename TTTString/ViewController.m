//
//  ViewController.m
//  TTTString
//
//  Created by mac on 16/4/13.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import "TTTAttributedLabel.h"
#import "customCell.h"

@interface ViewController ()<TTTAttributedLabelDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *sourceArr;

@property (nonatomic, strong) UITableView *myTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.myTableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame];
        [self.view addSubview:tableView];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = 200;
        tableView;
    });
}

- (void)attributedLabel:(TTTAttributedLabel *)label
   didSelectLinkWithURL:(NSURL *)url{
    
    NSLog(@"%@",url);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.sourceArr.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    customCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[customCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.label.delegate = self;
    cell.titleStr = self.sourceArr[indexPath.row];
    
    return cell;
}


- (NSArray *)sourceArr{
    
    if (_sourceArr == nil) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"espressos" ofType:@"txt"];
        _sourceArr = [[NSString stringWithContentsOfFile:filePath usedEncoding:nil error:nil] componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    }
    
    return _sourceArr;
}

@end
