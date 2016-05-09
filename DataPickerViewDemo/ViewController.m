//
//  ViewController.m
//  DataPickerViewDemo
//
//  Created by xxt-imac on 16/5/6.
//  Copyright © 2016年 xxt-imac. All rights reserved.
//

#import "ViewController.h"
#import "dataPickerView.h"
@interface ViewController ()<dataPickerViewDelegate>
@property (nonatomic,strong) dataPickerView *dataP;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataP = [[dataPickerView alloc]init];
    self.dataP.dateDelegate= self;

}
- (IBAction)button:(id)sender {
//    dataPickerView *dataPicker = [[dataPickerView alloc]init];
    
           [self.dataP dataPickerViewWithFatherView:self.view AndDataPickerMinuteInterval:15 AddDataPickerBackgroundColor:[UIColor whiteColor] AddDataPickerDatePickerMode:UIDatePickerModeDateAndTime];
    

 
   }
-(void)dataPickerWithConfirmData:(NSString *)data selfView:(dataPickerView *)dataPickerView
{
    NSLog(@"%@",dataPickerView.dataPicker.date);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
