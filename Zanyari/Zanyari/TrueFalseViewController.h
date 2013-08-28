//
//  TrueFalseViewController.h
//  Zanyari
//
//  Created by B's Mac on 19/08/13.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface TrueFalseViewController : UIViewController
{
    NSURLConnection *tfCon;
    NSMutableData *receivedData;
    
    NSDictionary *dictTfData;
    
    int tfId;
    
    AVAudioPlayer *audioPlayer;
}

@property (weak, nonatomic) IBOutlet UIButton *btnTrue;
@property (weak, nonatomic) IBOutlet UIButton *btnFalse;
@property (weak, nonatomic) IBOutlet UILabel *lblSentence;

- (IBAction)btnFalse_Click:(id)sender;
- (IBAction)btnTrue_Click:(id)sender;

@end
