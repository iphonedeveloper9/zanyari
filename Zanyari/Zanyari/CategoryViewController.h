//
//  CategoryViewController.h
//  Zanyari
//
//  Created by B's Mac on 17/08/13.
//

#import <UIKit/UIKit.h>

@interface CategoryViewController : UIViewController
{
    NSString *selectedCatrgory;
}

- (IBAction)btnHistory_Click:(id)sender;
- (IBAction)btnGeography_Click:(id)sender;
- (IBAction)btnScience_Click:(id)sender;
- (IBAction)btnRandom_Click:(id)sender;
- (IBAction)btnEntnmt_Click:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btnHistory;
@property (weak, nonatomic) IBOutlet UIButton *btnGeography;
@property (weak, nonatomic) IBOutlet UIButton *btnScience;
@property (weak, nonatomic) IBOutlet UIButton *btnEntmt;
@property (weak, nonatomic) IBOutlet UIButton *btnRandom;

@end
