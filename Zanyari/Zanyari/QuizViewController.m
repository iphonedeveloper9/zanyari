//
//  QuizViewController.m
//  Zanyari
//
//  Created by B's Mac on 17/08/13.
//

#import "QuizViewController.h"
#import "LoadingScreen.h"
#import "Toast+UIView.h"

@interface QuizViewController ()

@end

@implementation QuizViewController
@synthesize category;

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
    
    questionId = 1;
    
    dictQuestionData = [[NSDictionary alloc]init];
    
    receivedData = [[NSMutableData alloc]init];
    
    self.btnSkip.hidden = YES;
    
    timer = 0;
    
    self.btnOpt1.titleLabel.font = [UIFont fontWithName:@"efflor" size:15];
    self.btnOpt2.titleLabel.font = [UIFont fontWithName:@"efflor" size:15];
    self.btnOpt3.titleLabel.font = [UIFont fontWithName:@"efflor" size:15];
    self.btnOpt4.titleLabel.font = [UIFont fontWithName:@"efflor" size:15];
    self.btnSkip.titleLabel.font = [UIFont fontWithName:@"efflor" size:15];
    
    self.lblQuestion.font = [UIFont fontWithName:@"efflor" size:14];
    self.lblTimer.font = [UIFont fontWithName:@"efflor" size:17];


    [self FetchNewQuestion];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark private methods

-(void)SetQueAndOpts
{
    self.lblQuestion.text = [dictQuestionData valueForKey:@"question"];
    
    [self.btnOpt1 setTitle:[dictQuestionData valueForKey:@"opt1"] forState:UIControlStateNormal];
    [self.btnOpt2 setTitle:[dictQuestionData valueForKey:@"opt2"] forState:UIControlStateNormal];
    [self.btnOpt3 setTitle:[dictQuestionData valueForKey:@"opt3"] forState:UIControlStateNormal];
    [self.btnOpt4 setTitle:[dictQuestionData valueForKey:@"opt4"] forState:UIControlStateNormal];
    
    timer = 15;
    
    self.lblTimer.text = [NSString stringWithFormat:@"00:%02d",timer];
    
    queTimer = [NSTimer scheduledTimerWithTimeInterval: 1.0 target: self
                                              selector: @selector(QuestionTimer) userInfo: nil repeats: YES];
    
}

-(void)FetchNewQuestion
{
   // http://zanyari.org/zanyari/getques.php?id=3&lang=english&cat=SCIENCE
    
    NSString *postStr = [NSString stringWithFormat:@"id=%d&lang=%@&cat=%@", questionId, [[NSUserDefaults standardUserDefaults]valueForKey:@"qLanguage"], category];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://zanyari.org/zanyari/getques.php?%@", postStr]];
    
    NSLog(@"%@", url);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120];
    questCon = [NSURLConnection connectionWithRequest:request delegate:self];
    
    [[LoadingScreen sharedInstance]dismissLoadingScreen];
    
    [[LoadingScreen sharedInstance] startLoadingScreen];
}

-(void)EnableOpts
{
    self.btnSkip.hidden = YES;
    self.btnOpt1.enabled = YES;
    self.btnOpt2.enabled = YES;
    self.btnOpt3.enabled = YES;
    self.btnOpt4.enabled = YES;
    
    self.btnOpt1.alpha = 1;
    self.btnOpt2.alpha = 1;
    self.btnOpt3.alpha = 1;
    self.btnOpt4.alpha = 1;

}

-(void)DisableOpts
{
    [queTimer invalidate];
    
    self.btnSkip.hidden = NO;
    self.btnOpt1.enabled = NO;
    self.btnOpt2.enabled = NO;
    self.btnOpt3.enabled = NO;
    self.btnOpt4.enabled = NO;
    
    self.btnOpt1.alpha = 0.5;
    self.btnOpt2.alpha = 0.5;
    self.btnOpt3.alpha = 0.5;
    self.btnOpt4.alpha = 0.5;
}

-(void)ShowToast
{
    [self.view makeToast:@"Correct Answer!"
                duration:0.7
                position:@"center"
                   image:[UIImage imageNamed:@"correct.png"]];
    
    [queTimer invalidate];
}

-(void)ShowWrongAnsToast
{
    NSString *correctAns = [arrOpts objectAtIndex:[[dictQuestionData objectForKey:@"answer"]integerValue] - 1];
    [self.view makeToast:[NSString stringWithFormat:@"Wrong Answer! \nCorrect Answer is: %@", correctAns]
                duration:2.0
                position:@"center"
                   image:[UIImage imageNamed:@"wrong.png"]];
    
    [queTimer invalidate];

}

-(void)QuestionTimer
{
    timer --;
    
    self.lblTimer.text = [NSString stringWithFormat:@"00:%02d",timer];
    
    if (timer == 0) {
        
        [queTimer invalidate];
        
        [self DisableOpts];
        
        [self.view makeToast:@"Timeout!"
                    duration:0.7
                    position:@"center"
                       image:[UIImage imageNamed:@"abc.png"]];

    }
}

#pragma mark connections

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
    if(connection == questCon)
    {
        [receivedData setLength:0];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    
    if(connection == questCon)
    {
        [receivedData appendData:data];
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
    if(connection == questCon)
    {
    }
    [[LoadingScreen sharedInstance]dismissLoadingScreen];

}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    if(connection == questCon)
    {
        // convert to JSON
        NSError *myError = nil;
        dictQuestionData = [[NSDictionary alloc]init];
        dictQuestionData = [NSJSONSerialization JSONObjectWithData:receivedData options:NSJSONReadingMutableLeaves error:&myError];
        
        NSLog(@"%@", dictQuestionData);
        
        arrOpts = [[NSArray alloc]init];
        arrOpts = [NSArray arrayWithObjects:[dictQuestionData valueForKey:@"opt1"],
                   [dictQuestionData valueForKey:@"opt2"], [dictQuestionData valueForKey:@"opt3"], [dictQuestionData valueForKey:@"opt4"],nil];
        
        [self EnableOpts];
        
        [self SetQueAndOpts];
        
        [[LoadingScreen sharedInstance]dismissLoadingScreen];

    }
}

#pragma mark button clicks

- (IBAction)btnOpt1_Click:(id)sender {
    
    if ([[dictQuestionData objectForKey:@"answer"]integerValue] == 1) {
        
        questionId++;
        
        [self performSelector:@selector(FetchNewQuestion) withObject:nil afterDelay:1.0];
        
        [self ShowToast];
    }
    else
    {
        [self ShowWrongAnsToast];
        [self DisableOpts];
    }
}

- (IBAction)btnOpt2_Click:(id)sender {
    
    if ([[dictQuestionData objectForKey:@"answer"]integerValue] == 2) {
        
        questionId++;
        
        [self performSelector:@selector(FetchNewQuestion) withObject:nil afterDelay:1.0];
        
        [self ShowToast];

    }
    else
    {
        [self ShowWrongAnsToast];
        [self DisableOpts];
    }
}

- (IBAction)btnOpt3_Click:(id)sender {
    
    if ([[dictQuestionData objectForKey:@"answer"]integerValue] == 3) {
        
        questionId++;
        
        [self performSelector:@selector(FetchNewQuestion) withObject:nil afterDelay:1.0];
        
        [self ShowToast];

    }
    else
    {
        [self ShowWrongAnsToast];
        [self DisableOpts];
    }
}

- (IBAction)btnOpt4_Click:(id)sender {
    
    if ([[dictQuestionData objectForKey:@"answer"]integerValue] == 4) {
        
        questionId++;
        
        [self performSelector:@selector(FetchNewQuestion) withObject:nil afterDelay:1.0];
        
        [self ShowToast];
    }
    else
    {
        [self ShowWrongAnsToast];
        [self DisableOpts];
    }
}

- (IBAction)btnSkip_Click:(id)sender {
    
    questionId++;
    
    [self  FetchNewQuestion];
}

@end
