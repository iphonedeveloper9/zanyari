//
//  FunFactsViewController.h
//  Zanyari
//
//  Created by B's Mac on 17/08/13.
//  Copyright (c) 2013 iphonedeveloper9. All rights reserved.
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
