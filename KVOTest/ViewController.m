//
//  ViewController.m
//  KVOTest
//
//  Created by iBlock on 14-3-17.
//  Copyright (c) 2014年 iBlock. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.timer = [[CurrentTimer alloc] init];
    
    [self.timer addObserver:self forKeyPath:@"date" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"date"])
    {
        NSLog(@"%@", change[NSKeyValueChangeNewKey]);
        NSString *dateStr = [NSString stringWithFormat:@"%@", change[NSKeyValueChangeNewKey]];
        self.showDate.text = dateStr;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
