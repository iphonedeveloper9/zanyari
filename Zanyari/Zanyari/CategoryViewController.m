//
//  CategoryViewController.m
//  Zanyari
//
//  Created by B's Mac on 17/08/13.
//  Copyright (c) 2013 iphonedeveloper9. All rights reserved.
//

#import "CategoryViewController.h"
#import "QuizViewController.h"

@interface CategoryViewController ()

@end

@implementation CategoryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark button clicks

- (IBAction)btnHistory_Click:(id)sender {
    
    selectedCatrgory = @"HISTORY";
    
    [self performSegueWithIdentifier:@"quizSegue" sender:nil];
}

- (IBAction)btnGeography_Click:(id)sender {
    
    selectedCatrgory = @"GEOGRAPHY";

    [self performSegueWithIdentifier:@"quizSegue" sender:nil];
}

- (IBAction)btnScience_Click:(id)sender {
    
    selectedCatrgory = @"SCIENCE";

    [self performSegueWithIdentifier:@"quizSegue" sender:nil];
}

- (IBAction)btnEntnmt_Click:(id)sender {
    
    selectedCatrgory = @"ENTERTAINMENT";
    
    [self performSegueWithIdentifier:@"quizSegue" sender:nil];
}

- (IBAction)btnRandom_Click:(id)sender {
    
    selectedCatrgory = @"random";
    
    [self performSegueWithIdentifier:@"quizSegue" sender:nil];
}


#pragma mark segue method

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"quizSegue"])
    {
        QuizViewController *qvc = [segue destinationViewController];
        
        qvc.category = selectedCatrgory;
    }
}


@end
