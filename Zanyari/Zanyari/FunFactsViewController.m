//
//  FunFactsViewController.m
//  Zanyari
//
//  Created by B's Mac on 17/08/13.
//

#import "FunFactsViewController.h"
#import "LoadingScreen.h"

@interface FunFactsViewController ()

@end

@implementation FunFactsViewController

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
    
    funFactId = 1;
    
    receivedData = [[NSMutableData alloc]init];
    
    [self FetchNewFunFact];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark private methods

-(void)FetchNewFunFact
{
    //http://zanyari.org/zanyari/getfacts.php?id=2&lang=english
    
    NSString *postStr = [NSString stringWithFormat:@"id=%d&lang=%@", funFactId, [[NSUserDefaults standardUserDefaults]valueForKey:@"qLanguage"]];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://zanyari.org/zanyari/getfacts.php?%@", postStr]];
    
    NSLog(@"%@", url);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120];
    funFactCon = [NSURLConnection connectionWithRequest:request delegate:self];
    
    [[LoadingScreen sharedInstance]dismissLoadingScreen];
    
    [[LoadingScreen sharedInstance] startLoadingScreen];
}



#pragma mark connections

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
    if(connection == funFactCon)
    {
        [receivedData setLength:0];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    
    if(connection == funFactCon)
    {
        [receivedData appendData:data];
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
    if(connection == funFactCon)
    {
    }
    [[LoadingScreen sharedInstance]dismissLoadingScreen];
    
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    if(connection == funFactCon)
    {
        // convert to JSON
        NSError *myError = nil;
        dictfunFactData = [[NSDictionary alloc]init];
        dictfunFactData = [NSJSONSerialization JSONObjectWithData:receivedData options:NSJSONReadingMutableLeaves error:&myError];
        
        NSLog(@"%@", dictfunFactData);
        
        self.lblFunFact.text = [dictfunFactData valueForKey:@"fact"];
        
        [[LoadingScreen sharedInstance]dismissLoadingScreen];
    }
}

#pragma mark
#pragma mark button clicks

- (IBAction)btnNext_Click:(id)sender {
    
    funFactId ++;
    [self FetchNewFunFact];
}
@end
