//
//  SettingsViewController.m
//  Zanyari
//
//  Created by B's Mac on 17/08/13.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark
#pragma mark view methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.LangPicker.delegate = self;
    self.txtLanguage.delegate = self;
    
    arrLanguages = [NSArray arrayWithObjects:@"English", @"Kurmanji", @"Sorani", @"Bahdini", nil];
    
    CGRect langPickerFrame = self.langPickerView.frame;
    
    langPickerFrame.origin.y = self.view.frame.size.height;
    
    self.langPickerView.frame = langPickerFrame;
    
    NSString *selLang = [self ConvertToTitleCase:[[NSUserDefaults standardUserDefaults]valueForKey:@"qLanguage"]];
    
    self.txtLanguage.text = selLang;
    
        
    int rowIndex = [arrLanguages indexOfObject:selLang];
    
    [self.LangPicker selectRow:rowIndex inComponent:0 animated:YES];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma mark private methods

- (NSString *)ConvertToTitleCase:(NSString*)str
{
    NSMutableString *str2 = [NSMutableString string];
    
    for (NSInteger i = 0; i < str.length; i++){
        NSString *ch = [str substringWithRange:NSMakeRange(i, 1)];
        if ([ch rangeOfCharacterFromSet:[NSCharacterSet uppercaseLetterCharacterSet]].location != NSNotFound) {
            [str2 appendString:@" "];
        }
        [str2 appendString:ch];
    }
    return str2.capitalizedString;
}

#pragma mark
#pragma mark pickerview methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
	return 1;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    NSString *selectedLanguage = [arrLanguages objectAtIndex:row];
    
    self.txtLanguage.text = selectedLanguage;
    
    selectedLanguage = [selectedLanguage lowercaseString];
    
    [[NSUserDefaults standardUserDefaults]setValue:selectedLanguage forKeyPath:@"qLanguage"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    return arrLanguages.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    return [arrLanguages objectAtIndex:row];
}

#pragma mark
#pragma mark textfield methods

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [textField resignFirstResponder];

    CGRect langPickerFrame = self.langPickerView.frame;
    langPickerFrame.origin.y = self.view.frame.size.height - langPickerFrame.size.height;

    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    
    self.langPickerView.frame = langPickerFrame;
    
    [UIView commitAnimations];
}

#pragma mark
#pragma mark button clicks

- (IBAction)btnDone_Click:(id)sender {
    
    CGRect langPickerFrame = self.langPickerView.frame;
    langPickerFrame.origin.y = self.view.frame.size.height;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    
    self.langPickerView.frame = langPickerFrame;
    
    [UIView commitAnimations];
}

@end
