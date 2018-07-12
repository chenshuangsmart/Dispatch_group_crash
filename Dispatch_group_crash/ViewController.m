//
//  ViewController.m
//  Dispatch_group_crash
//
//  Created by cs on 2018/7/12.
//  Copyright © 2018年 cs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
/** 数组 */
@property(nonatomic, strong)dispatch_group_t group;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.group == nil) {
        dispatch_group_t group = dispatch_group_create();
        self.group = group;
    }
    
    dispatch_group_enter(self.group);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(2);
        dispatch_group_leave(self.group);
    });
    
    dispatch_group_enter(self.group);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(2);
        dispatch_group_leave(self.group);
    });

    dispatch_group_enter(self.group);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(2);
        dispatch_group_leave(self.group);
    });

    dispatch_group_notify(self.group, dispatch_get_main_queue(), ^{
        NSLog(@"操作全部完成");
    });
}

//- (void)errorRequest {
//    dispatch_group_t group = dispatch_group_create();
//    self.group = group;
//
//    // enter code
//    [request  requestGetUrl:url success:^(id responds) {
//        // leave code
//    }];
//}
//
//- (void)rightRequest {
//    if (self.group == nil) {
//        dispatch_group_t group = dispatch_group_create();
//        self.group = group;
//    }
//
//    // enter code
//    [request  requestGetUrl:url success:^(id responds) {
//        // leave code
//    }];
//}

@end
