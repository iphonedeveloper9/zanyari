//
//  TrueFalseViewController.h
//  Zanyari
//
//  Created by B's Mac on 19/08/13.
//  Copyright (c) 2013 iphonedeveloper9. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrueFalseViewController : UIViewController
{
    NSURLConnection *tfCon;
    NSMutableData *receivedData;
    
    NSDictionary *dictTfData;
    
    int tfId;
}

@property (weak, nonatomic) IBOutlet UIButton *btnTrue;
@property (weak, nonatomic) IBOutlet UIButton *btnFalse;
@property (weak, nonatomic) IBOutlet UILabel *lblSentence;

- (IBAction)btnFalse_Click:(id)sender;
- (IBAction)btnTrue_Click:(id)sender;

@end
