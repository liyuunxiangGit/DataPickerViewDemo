//
//  dataPickerView.h
//  DataPickerViewDemo
//
//  Created by xxt-imac on 16/5/6.
//  Copyright © 2016年 xxt-imac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class dataPickerView;
@protocol dataPickerViewDelegate <NSObject>

-(void)dataPickerWithConfirmData:(NSString *)data selfView:(dataPickerView *)dataPickerView;

@end

@interface dataPickerView : UIView

@property (nonatomic,weak) id<dataPickerViewDelegate> dateDelegate;

@property (nonatomic,strong) dataPickerView *pickerBackView;
@property (nonatomic,strong) UIDatePicker *fineldatePicker;
@property (nonatomic,strong) UIDatePicker *dataPicker;

//-(instancetype)dataPickerViewWithFatherView:(UIView *)fatherView;
-(instancetype)dataPickerViewWithFatherView:(UIView *)fatherView
                 AndDataPickerMinuteInterval:(NSInteger)interval
                 AddDataPickerBackgroundColor:(UIColor *)backColor
                AddDataPickerDatePickerMode:(UIDatePickerMode)dataPickerMode;
@end
