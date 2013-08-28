//
//  ViewController.h
//  Zanyari
//
//  Created by B's Mac on 17/08/13.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface HomeViewController : UIViewController
{
    AVAudioPlayer *audioPlayer;
}

@property (weak, nonatomic) IBOutlet UIButton *btnQuiz;
@property (weak, nonatomic) IBOutlet UIButton *btnFunFacts;
@property (weak, nonatomic) IBOutlet UIButton *btnSettings;
@property (weak, nonatomic) IBOutlet UIButton *btnTF;

- (IBAction)btnQuiz_click:(id)sender;
- (IBAction)btnFunFacts_Click:(id)sender;
- (IBAction)btnSettings_Click:(id)sender;
- (IBAction)btnTF_Click:(id)sender;

@end
