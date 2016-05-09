//
//  dataPickerView.m
//  DataPickerViewDemo
//
//  Created by xxt-imac on 16/5/6.
//  Copyright © 2016年 xxt-imac. All rights reserved.
//

#import "dataPickerView.h"




@implementation dataPickerView

-(instancetype)dataPickerViewWithFatherView:(UIView *)fatherView AndDataPickerMinuteInterval:(NSInteger)interval AddDataPickerBackgroundColor:(UIColor *)backColor AddDataPickerDatePickerMode:(UIDatePickerMode)dataPickerMode
{
    dataPickerView *pickerBackView = [[dataPickerView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    pickerBackView.userInteractionEnabled = YES;
    [fatherView addSubview:pickerBackView];
//    pickerBackView.backgroundColor = [UIColor redColor];
    

    //黑色背景 蒙版（这是一张灰黑色的图片）
    
    UIImageView *dataPickerBackView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    dataPickerBackView.image = [UIImage imageNamed:@"蒙版.png"];
    [pickerBackView addSubview:dataPickerBackView];
    dataPickerBackView.userInteractionEnabled = YES;
    UIView * tapView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    UITapGestureRecognizer * tapsGesture= [[UITapGestureRecognizer alloc] initWithTarget:pickerBackView action:@selector(dismissTheView:)];
    [tapView addGestureRecognizer:tapsGesture];
    [dataPickerBackView addSubview:tapView];
    
    
    UIImageView *dataPicBacView = [[UIImageView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-216 -44 -2, [UIScreen mainScreen].bounds.size.width, 44+ 216  +2)];
    [dataPickerBackView addSubview:dataPicBacView];
    dataPicBacView.image = [UIImage imageNamed:@"底色.png"];
    dataPicBacView.userInteractionEnabled = YES;
    dataPicBacView.backgroundColor = [UIColor clearColor];
    //默认是今天的时间
    NSDate  *dates = [NSDate date]; // 获取被选中的时间
    NSDateFormatter *selectDateFormatter = [[NSDateFormatter alloc] init];
    selectDateFormatter.dateFormat = @"yyyy年MM月dd日"; // 设置时间和日期的格式
    NSString *dateAndTime = [selectDateFormatter stringFromDate:dates]; // 把date类型转为设置好格式的string类型
    
    self.dataPicker  = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 0 , [UIScreen mainScreen].bounds.size.width, 216)];
//    self.dataPicker = dataPicker;
    NSDate *currentDate = [NSDate date];
    self.dataPicker.minuteInterval = interval;
    self.dataPicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:0];
    self.dataPicker.backgroundColor = backColor;
    self.dataPicker.datePickerMode = dataPickerMode;
  
    [dataPicBacView addSubview:self.dataPicker];
    //取消按钮
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelButton.userInteractionEnabled = YES;
    [cancelButton bringSubviewToFront:dataPicBacView];
    cancelButton.frame =CGRectMake(0, self.dataPicker.frame.size.height +self.dataPicker.frame.origin.y  + 1, [UIScreen mainScreen].bounds.size.width / 2 - 1, 44);
    cancelButton.titleLabel.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:16];
    [UIColor colorWithRed:192/255.0 green:224/255.0 blue:87/255.0 alpha:1];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor colorWithRed:192/255.0 green:224/255.0 blue:87/255.0 alpha:1] forState:UIControlStateNormal];
    
    [cancelButton setBackgroundColor:[UIColor whiteColor]];
    [cancelButton addTarget:pickerBackView action:@selector(cancelButtonPressAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [dataPicBacView addSubview:cancelButton];
    
    
    //确认按钮
    UIButton *confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    confirmButton.frame =CGRectMake(cancelButton.frame.size.width + 1, self.dataPicker.frame.size.height +self.dataPicker.frame.origin.y  + 1, [UIScreen mainScreen].bounds.size.width / 2 - 1, 44);
    confirmButton.titleLabel.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:16];
    [confirmButton setTitle:@"确定" forState:UIControlStateNormal];
    [confirmButton setTitleColor:[UIColor colorWithRed:192/255.0 green:224/255.0 blue:87/255.0 alpha:1] forState:UIControlStateNormal];
    [confirmButton setBackgroundColor:[UIColor whiteColor]];
    [confirmButton addTarget:pickerBackView action:@selector(confirmButtonPressAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [dataPicBacView addSubview:confirmButton];
  
    [pickerBackView addSubview:dataPickerBackView];
//    UIWindow *keywindow = [[UIApplication sharedApplication] keyWindow];
//    [keywindow addSubview:dataPickerBackView];
    
    //增加弹出动画
    CGRect frame = CGRectMake(0, dataPicBacView.frame.origin.y + dataPickerBackView.frame.origin.y, dataPicBacView.frame.size.width, dataPicBacView.frame.size.height);
    dataPicBacView.frame = CGRectMake(0, frame.origin.y + frame.size.height, frame.size.width, frame.size.height);
    [UIView animateWithDuration:0.2 animations:^{
        dataPicBacView.frame = frame;
    } completion:^(BOOL finished) {
        
    }];

    
    
    
    return pickerBackView;
}
- (void)cancelButtonPressAction:(id)sender{
    NSLog(@"sdf");
}
#pragma mark - 弹出时间选择器上 确认和取消按钮对应的方法 -
- (void)confirmButtonPressAction:(id)sender {
    NSDate  *dates = [self.dataPicker date]; // 获取被选中的时间
    NSDateFormatter *selectDateFormatter = [[NSDateFormatter alloc] init];
    selectDateFormatter.dateFormat = @"yyyy年MM月dd日 HH:mm"; // 设置时间和日期的格式
    NSString *dateAndTime = [selectDateFormatter stringFromDate:dates]; // 把date类型转为设置好格式的string类型
    NSLog(@"%@",self.dataPicker.date);
//        NSLog(@" %@ %@",__func__,dateAndTime);
    if ([self.dateDelegate respondsToSelector:@selector(dataPickerWithConfirmData:selfView:)]) {
        [self.dateDelegate dataPickerWithConfirmData:nil selfView:self];
    }
    [self removeFromSuperview];
}

-(void)dismissTheView:(id)sender{
    NSLog(@"remobe");
    [self removeFromSuperview];
}

@end
