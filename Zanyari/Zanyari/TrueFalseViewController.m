//
//  TrueFalseViewController.m
//  Zanyari
//
//  Created by B's Mac on 19/08/13.
//  Copyright (c) 2013 iphonedeveloper9. All rights reserved.
//

#import "TrueFalseViewController.h"
#import "LoadingScreen.h"
#import "Toast+UIView.h"

@interface TrueFalseViewController ()

@end

@implementation TrueFalseViewController


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
    
    tfId = 1;
    
    receivedData = [[NSMutableData alloc]init];
    
    [self FetchNewTf];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma mark private methods

-(void)FetchNewTf
{
    //http://www.zanyari.org/zanyari/gettf.php?id=2&lang=english
    
    NSString *postStr = [NSString stringWithFormat:@"id=%d&lang=%@", tfId, [[NSUserDefaults standardUserDefaults]valueForKey:@"qLanguage"]];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.zanyari.org/zanyari/gettf.php?%@", postStr]];
    
    NSLog(@"%@", url);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120];
    tfCon = [NSURLConnection connectionWithRequest:request delegate:self];
    
    [[LoadingScreen sharedInstance]dismissLoadingScreen];
    
    [[LoadingScreen sharedInstance] startLoadingScreen];
}

-(void)CheckAns:(NSString *)ans
{
    if ([[dictTfData valueForKey:@"answer"] isEqualToString:ans]) {
        
        [self.view makeToast:@"Correct Answer!"
                    duration:0.7
                    position:@"center"
                       image:[UIImage imageNamed:@"correct.png"]];
    }
    
    else
    {
        [self.view makeToast:@"Wrong Answer!"
                    duration:0.7
                    position:@"center"
                       image:[UIImage imageNamed:@"wrong.png"]];
    }
    
}

#pragma mark
#pragma mark connections

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
    if(connection == tfCon)
    {
        [receivedData setLength:0];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    
    if(connection == tfCon)
    {
        [receivedData appendData:data];
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
    if(connection == tfCon)
    {
        
    }
    [[LoadingScreen sharedInstance]dismissLoadingScreen];
    
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    if(connection == tfCon)
    {
        // convert to JSON
        NSError *myError = nil;
        dictTfData = [[NSDictionary alloc]init];
        dictTfData = [NSJSONSerialization JSONObjectWithData:receivedData options:NSJSONReadingMutableLeaves error:&myError];
        
        NSLog(@"%@", dictTfData);
        
        self.lblSentence.text = [dictTfData valueForKey:@"fact"];
        
        [[LoadingScreen sharedInstance]dismissLoadingScreen];
    }
}

#pragma mark
#pragma mark button clicks 

- (IBAction)btnTrue_Click:(id)sender {
    
    tfId ++;
    
    [self CheckAns:@"1"];
    
    [self performSelector:@selector(FetchNewTf) withObject:nil afterDelay:1.0];
    
}

- (IBAction)btnFalse_Click:(id)sender {
    
    tfId ++;
    
    [self CheckAns:@"0"];
    
    [self performSelector:@selector(FetchNewTf) withObject:nil afterDelay:1.0];
}

@end
