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
@property (nonatomic,strong) UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    _label = [[UILabel alloc]init];
    _label.frame = CGRectMake(20, 40, 260, 25);
//    _label.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_label];
    
}
- (IBAction)button:(id)sender {
//    dataPickerView *dataPicker = [[dataPickerView alloc]init];
    if (self.dataP == nil) {
        self.dataP = [[dataPickerView alloc]init];
        self.dataP.dateDelegate= self;
         [self.dataP dataPickerViewWithFatherView:self.view AndDataPickerMinuteInterval:15 AddDataPickerBackgroundColor:[UIColor whiteColor] AddDataPickerDatePickerMode:UIDatePickerModeDateAndTime];
       
        
    }
    [self.view addSubview:self.dataP];

    
    

 
   }
-(void)dataPickerWithConfirmData:(NSString *)data selfView:(dataPickerView *)dataPickerView
{
    NSLog(@"%@",dataPickerView.dataPicker.date);
    self.label.text = [NSString stringWithFormat:@"%@",dataPickerView.dataPicker.date] ;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
