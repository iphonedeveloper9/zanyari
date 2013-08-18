//
//  SettingsViewController.h
//  Zanyari
//
//  Created by B's Mac on 17/08/13.
//  Copyright (c) 2013 iphonedeveloper9. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController<UIPickerViewDelegate, UITextFieldDelegate>
{
    NSArray *arrLanguages;
}
@property (weak, nonatomic) IBOutlet UIPickerView *LangPicker;
@property (weak, nonatomic) IBOutlet UIView *langPickerView;
@property (weak, nonatomic) IBOutlet UITextField *txtLanguage;
- (IBAction)btnDone_Click:(id)sender;

@end
