//
//  CCViewController.m
//  Pirate Adventure
//
//  Created by Sungnavi on 2014. 1. 11..
//  Copyright (c) 2014년 Sungnavi. All rights reserved.
//

#import "CCViewController.h"
#import "CCFactory.h"
#import "CCTile.h"

@interface CCViewController ()

@end

@implementation CCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CCFactory *myFactory = [[CCFactory alloc]init];
    self.tiles = [myFactory tiles];
    self.character = [myFactory character];
    self.boss = [myFactory boss];
    
    self.myPos = CGPointMake(0,0);
    [self updateCharacterStateForArmor:nil withWeapon:nil withHealthEffect:0];
    [self updateTile];
    [self updateButtons];

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


# pragma mark - Helper functions

-(void)updateTile
{
    CCTile *myTile = [[CCTile alloc] init];
    myTile = [[self.tiles objectAtIndex:self.myPos.x] objectAtIndex:self.myPos.y];
    
    self.lblStory.text = myTile.story;
    [self.backImage setImage: myTile.backImage];
    
    self.lblHealth.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.lblDamage.text = [NSString stringWithFormat:@"%i", self.character.damage];
    self.lblWeapon.text = self.character.weapon.name;
    self.lblArmor.text = self.character.armor.name;
    [self.btnAction setTitle:myTile.actionBtnName forState:UIControlStateNormal];
    
}


-(BOOL)hideButtonAtPos: (CGPoint)point
{
    BOOL bHide;
    
    if ((point.x >= 0) && (point.y >= 0) && (point.x < [self.tiles count]) && (point.y < [[self.tiles objectAtIndex:point.x] count]))
    {
        bHide = NO;
    }
    else
    {
        bHide = YES;
    }
    
    return bHide;
    
}


-(void)updateCharacterStateForArmor: (CCArmor*)armor withWeapon:(CCWeapon*) weapon withHealthEffect:(int)healthEffect
{
    if (armor != nil) {
        self.character.health = self.character.health - self.character.armor.health + armor.health;
        self.character.armor = armor;
    }
    else if (weapon != nil) {
        self.character.damage = self.character.damage - self.character.weapon.damage + weapon.damage;
        self.character.weapon = weapon;
    }
    else if (healthEffect != 0){
        self.character.health += healthEffect;
    }
    else {
        self.character.health += self.character.armor.health;
        self.character.damage += self.character.weapon.damage;
    }
    
    if (self.myPos.x == 3 && self.myPos.y == 2) // at final fight stage
    {
        self.boss.health = self.boss.health - self.character.damage;
    }
    
}


-(void)updateButtons
{
    self.btnWest.hidden = [self hideButtonAtPos:CGPointMake(self.myPos.x -1, self.myPos.y)];
    self.btnEast.hidden = [self hideButtonAtPos:CGPointMake(self.myPos.x+1, self.myPos.y)];
    self.btnNotrh.hidden = [self hideButtonAtPos:CGPointMake(self.myPos.x, self.myPos.y+1)];
    self.btnSouth.hidden = [self hideButtonAtPos:CGPointMake(self.myPos.x, self.myPos.y-1)];
    
}

#pragma mark - IBActions functions

- (IBAction)btnActionPressed:(UIButton *)sender
{
    CCTile* curTile = [[self.tiles objectAtIndex: self.myPos.x] objectAtIndex:self.myPos.y];
    [self updateCharacterStateForArmor:curTile.armor withWeapon:curTile.weapon withHealthEffect:curTile.healthEffect];
    [self updateTile];
    
    if (self.boss.health <= 0)
    {
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Win the Game" message:@"You've defeat the evil pirate!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if (self.character.health <= 0)
    {
        UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:@"Lost the Game" message:@"You've defeated by eveil pirate!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
        
    }
}


- (IBAction)btnNorthPressed:(UIButton *)sender
{
    self.myPos = CGPointMake(self.myPos.x, self.myPos.y + 1);
    [self updateTile];
    [self updateButtons];
}

- (IBAction)btnEastPressed:(UIButton *)sender
{
    self.myPos = CGPointMake(self.myPos.x +1, self.myPos.y);
    [self updateTile];
    [self updateButtons];
}

- (IBAction)btnSouthPressed:(UIButton *)sender
{
    self.myPos = CGPointMake(self.myPos.x, self.myPos.y -1);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)btnWestPressed:(UIButton *)sender
{
    self.myPos = CGPointMake(self.myPos.x -1, self.myPos.y);
    [self updateTile];
    [self updateButtons];
}

- (IBAction)btnReset:(UIButton *)sender
{
    self.character = nil;
    self.boss = nil;
    [self viewDidLoad];
}


@end
