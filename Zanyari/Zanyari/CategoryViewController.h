//
//  CategoryViewController.h
//  Zanyari
//
//  Created by B's Mac on 17/08/13.
//  Copyright (c) 2013 iphonedeveloper9. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryViewController : UIViewController
{
    NSString *selectedCatrgory;
}

- (IBAction)btnHistory_Click:(id)sender;
- (IBAction)btnGeography_Click:(id)sender;
- (IBAction)btnScience_Click:(id)sender;
- (IBAction)btnRandom_Click:(id)sender;
- (IBAction)btnEntnmt_Click:(id)sender;

@end
