//
//  ViewController.h
//  Zanyari
//
//  Created by B's Mac on 17/08/13.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btnQuiz;
@property (weak, nonatomic) IBOutlet UIButton *btnFunFacts;
@property (weak, nonatomic) IBOutlet UIButton *btnSettings;


- (IBAction)btnQuiz_click:(id)sender;
- (IBAction)btnFunFacts_Click:(id)sender;
- (IBAction)btnSettings_Click:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnTF;
- (IBAction)btnTF_Click:(id)sender;

@end
