//
//  QuizViewController.h
//  Zanyari
//
//  Created by B's Mac on 17/08/13.
//

#import <UIKit/UIKit.h>

@interface QuizViewController : UIViewController
{
    NSURLConnection *questCon;
    NSMutableData *receivedData;
    
    NSDictionary *dictQuestionData;
    
    NSArray *arrOpts;
    
    int questionId;
    
    NSTimer* queTimer;
    
    int timer;
}

@property (weak, nonatomic) IBOutlet UIButton *btnOpt1;
@property (weak, nonatomic) IBOutlet UIButton *btnOpt2;
@property (weak, nonatomic) IBOutlet UIButton *btnOpt3;
@property (weak, nonatomic) IBOutlet UIButton *btnOpt4;
@property (weak, nonatomic) IBOutlet UIButton *btnSkip;

@property (weak, nonatomic) IBOutlet UILabel *lblQuestion;
@property (weak, nonatomic) IBOutlet UILabel *lblTimer;

@property (nonatomic, readwrite) NSString *category;

- (IBAction)btnOpt1_Click:(id)sender;
- (IBAction)btnOpt2_Click:(id)sender;
- (IBAction)btnOpt3_Click:(id)sender;
- (IBAction)btnOpt4_Click:(id)sender;
- (IBAction)btnSkip_Click:(id)sender;

@end
