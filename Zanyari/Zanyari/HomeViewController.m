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
@end
