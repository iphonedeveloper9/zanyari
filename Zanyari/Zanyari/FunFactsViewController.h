//
//  FunFactsViewController.h
//  Zanyari
//
//  Created by B's Mac on 17/08/13.
//

#import <UIKit/UIKit.h>

@interface FunFactsViewController : UIViewController
{
    NSURLConnection *funFactCon;
    NSMutableData *receivedData;
    
    NSDictionary *dictfunFactData;
    
    int funFactId;


}
@property (weak, nonatomic) IBOutlet UILabel *lblFunFact;
- (IBAction)btnNext_Click:(id)sender;

@end
