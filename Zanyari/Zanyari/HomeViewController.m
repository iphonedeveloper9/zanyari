//
//  ViewController.m
//  Zanyari
//
//  Created by B's Mac on 17/08/13.
//  Copyright (c) 2013 iphonedeveloper9. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

#pragma mark
#pragma mark view methods

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    NSString * selectedLang = [[NSUserDefaults standardUserDefaults]valueForKey:@"qLanguage"];
    
    if ([selectedLang isEqualToString:@"english"])
    {
        [self.btnQuiz setBackgroundImage:[UIImage imageNamed:@"quiz.png"] forState:UIControlStateNormal];
        [self.btnFunFacts setBackgroundImage:[UIImage imageNamed:@"funfacts.png"] forState:UIControlStateNormal];
        [self.btnSettings setBackgroundImage:[UIImage imageNamed:@"support.png"] forState:UIControlStateNormal];
        [self.btnTF setBackgroundImage:[UIImage imageNamed:@"true_false_eng_book.png"] forState:UIControlStateNormal];
    }
    
    if ([selectedLang isEqualToString:@"kurmanji"])
    {
        [self.btnQuiz setBackgroundImage:[UIImage imageNamed:@"quiz_kur.png"] forState:UIControlStateNormal];
        [self.btnFunFacts setBackgroundImage:[UIImage imageNamed:@"fun_rest.png"] forState:UIControlStateNormal];
        [self.btnSettings setBackgroundImage:[UIImage imageNamed:@"sup_kur.png"] forState:UIControlStateNormal];
        [self.btnTF setBackgroundImage:[UIImage imageNamed:@"true_false_kur_book.png"] forState:UIControlStateNormal];
    }
    
    if ([selectedLang isEqualToString:@"sorani"])
    {
        [self.btnQuiz setBackgroundImage:[UIImage imageNamed:@"quiz_sor.png"] forState:UIControlStateNormal];
        [self.btnFunFacts setBackgroundImage:[UIImage imageNamed:@"fun_rest.png"] forState:UIControlStateNormal];
        [self.btnSettings setBackgroundImage:[UIImage imageNamed:@"sup_sor.png"] forState:UIControlStateNormal];
        [self.btnTF setBackgroundImage:[UIImage imageNamed:@"true_false_sor_book.png"] forState:UIControlStateNormal];
    }
    
    if ([selectedLang isEqualToString:@"bahdini"])
    {
        [self.btnQuiz setBackgroundImage:[UIImage imageNamed:@"quiz_kur.png"] forState:UIControlStateNormal];
        [self.btnFunFacts setBackgroundImage:[UIImage imageNamed:@"fun_rest.png"] forState:UIControlStateNormal];
        [self.btnSettings setBackgroundImage:[UIImage imageNamed:@"sup_bah.png"] forState:UIControlStateNormal];
        [self.btnTF setBackgroundImage:[UIImage imageNamed:@"true_false_bah_book.png"] forState:UIControlStateNormal];
    }
}


#pragma mark
#pragma mark button clicks

- (IBAction)btnQuiz_click:(id)sender {
    
    [self performSegueWithIdentifier:@"categorySegue" sender:nil];
}
- (IBAction)btnFunFacts_Click:(id)sender {
    
    [self performSegueWithIdentifier:@"funFactsSegue" sender:nil];
}
- (IBAction)btnSettings_Click:(id)sender {
    
    [self performSegueWithIdentifier:@"settingsSegue" sender:nil];
}
- (IBAction)btnTF_Click:(id)sender {
    
    [self performSegueWithIdentifier:@"TFSegue" sender:nil];
}

@end
