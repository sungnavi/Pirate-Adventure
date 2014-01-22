//
//  CCViewController.h
//  Pirate Adventure
//
//  Created by Sungnavi on 2014. 1. 11..
//  Copyright (c) 2014년 Sungnavi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCCharacter.h"
#import "CCBoss.h"

@interface CCViewController : UIViewController

//iVar

@property NSArray *tiles;
@property CGPoint myPos;
@property CCCharacter *character;
@property CCBoss *boss;

//IBOutlet

@property (strong, nonatomic) IBOutlet UILabel *lblHealth;
@property (strong, nonatomic) IBOutlet UILabel *lblDamage;
@property (strong, nonatomic) IBOutlet UILabel *lblWeapon;
@property (strong, nonatomic) IBOutlet UILabel *lblArmor;
@property (strong, nonatomic) IBOutlet UILabel *lblStory;
@property (strong, nonatomic) IBOutlet UIButton *btnNotrh;
@property (strong, nonatomic) IBOutlet UIButton *btnWest;
@property (strong, nonatomic) IBOutlet UIButton *btnEast;
@property (strong, nonatomic) IBOutlet UIButton *btnSouth;
@property (strong, nonatomic) IBOutlet UIImageView *backImage;
@property (strong, nonatomic) IBOutlet UIButton *btnAction;


//IBAction

- (IBAction)btnActionPressed:(UIButton *)sender;
- (IBAction)btnNorthPressed:(UIButton *)sender;
- (IBAction)btnEastPressed:(UIButton *)sender;
- (IBAction)btnSouthPressed:(UIButton *)sender;
- (IBAction)btnWestPressed:(UIButton *)sender;
- (IBAction)btnReset:(UIButton *)sender;

@end
