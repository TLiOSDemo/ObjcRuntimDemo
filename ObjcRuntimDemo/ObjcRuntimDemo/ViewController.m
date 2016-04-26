//
//  ViewController.m
//  ObjcRuntimDemo
//
//  Created by Andrew on 16/3/16.
//  Copyright © 2016年 Andrew. All rights reserved.
//

#import "ViewController.h"
#import <objc/objc-api.h>
#import <objc/runtime.h>
#import <TLKeyboardUtil/TLKeyboardUtil.h>
#import <TL_Config.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self testOCRuntime];
    [self initView];
    
    [[TLKeyboardUtil sharedInstance] addKeyboardAutoPopWithView:self.view];
}


-(void)initView{
    UITextView *textview=[[UITextView alloc]initWithFrame:CGRectMake(0,300, SCREEN_WIDTH, 100)];
    textview.backgroundColor=[UIColor groupTableViewBackgroundColor];
    textview.keyboardType=UIKeyboardTypeNumberPad;
    [self.view addSubview:textview];
    
}

-(void)testOCRuntime{
    static char keyChar='k';
    NSArray *array=@[@"one",@"two",@"thress"];
    
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(100, 300, 100, 200)];
    [btn setTitle:@"中国" forState:UIControlStateNormal];
    
    
    NSString *string=@"来自星星的你";
    objc_setAssociatedObject(array, &keyChar, btn, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
//    NSString *associatedObject = (NSString *)objc_getAssociatedObject(array, &keyChar);
//    NSLog(@"associatedObject:%@", associatedObject);
    
    UIButton *button=(UIButton *)objc_getAssociatedObject(array,&keyChar);
    NSLog(@"button=%@",button.description);
    
    
    
    
    
}

@end
