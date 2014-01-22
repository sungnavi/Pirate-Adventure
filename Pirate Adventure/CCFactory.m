//
//  CCFactory.m
//  Pirate Adventure
//
//  Created by Sungnavi on 2014. 1. 11..
//  Copyright (c) 2014년 Sungnavi. All rights reserved.
//

#import "CCFactory.h"
#import "CCTile.h"

@implementation CCFactory

- (NSArray *)tiles
{
    CCTile *tile1 = [[CCTile alloc]init];
    tile1.story = @"1 Captain, we need a fearless leader such as you to undertake a voyage.  You must stop the evil pirate Boss before he steals any more plunder.  Would you like a blunted sword to get started?";
    tile1.backImage = [UIImage imageNamed:@"PirateStart.jpg"];
    CCWeapon *bluntedSwordweapon = [[CCWeapon alloc]init];
    bluntedSwordweapon.name = @"BluntedSword";
    bluntedSwordweapon.damage = 7;
    tile1.weapon = bluntedSwordweapon;
    tile1.actionBtnName = @"Take the Sword";
    
    
    CCTile *tile2 = [[CCTile alloc]init];
    tile2.story = @"2 You have come across an armory.  Would you like to upgrade your armor to steel armor?";
    tile2.backImage = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    tile2.armor = [[CCArmor alloc]init];
    tile2.armor.name = @"Steel Armor";
    tile2.armor.health = 7;
    tile2.actionBtnName = @"Take Steel Armor";
    
    CCTile *tile3 = [[CCTile alloc]init];
    tile3.story = @"3 A mysterious dock appears on the horizon.  Should we stop and ask for directions?";
    tile3.backImage = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    tile3.healthEffect = 17;
    tile3.actionBtnName = @"Stop at the Dock";
    
    NSMutableArray *firstColumn = [[NSMutableArray alloc]initWithObjects: tile1, tile2, tile3, nil];
    
    CCTile *tile4 = [[CCTile alloc]init];
    tile4.story = @"4 You have found a parrot can be used in your armor slot!  Parrots are a great defender and are fiercly loyal to their captain.";
    tile4.backImage= [UIImage imageNamed:@"PirateParrot.jpg"];
    tile4.armor = [[CCArmor alloc]init];
    tile4.armor.name = @"Parrot Armor";
    tile4.armor.health = 20;
    tile4.actionBtnName = @"Adpot Parrot";
    
    CCTile *tile5 = [[CCTile alloc]init];
    tile5.story = @"5 You have stumbled upon a cache of pirate weapons.  Would you like to upgrade to a pistol?";
    tile5.backImage = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    tile5.weapon = [[CCWeapon alloc]init];
    tile5.weapon.name = @"Pistol";
    tile5.weapon.damage = 12;
    tile5.actionBtnName = @"Take Pistol";
    
    CCTile *tile6 = [[CCTile alloc]init];
    tile6.story = @"6 You have been captured by pirates and are ordered to walk the plank";
    tile6.backImage = [UIImage imageNamed:@"PiratePlank.jpg"];
    tile6.healthEffect = -22;
    tile6.actionBtnName = @"Show no fear!";
    
    NSMutableArray *secondColumn = [[NSMutableArray alloc]initWithObjects:tile4, tile5, tile6, nil];
    
    CCTile *tile7 = [[CCTile alloc]init];
    tile7.story = @"7 You sight a pirate battle off the coast";
    tile7.backImage = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    tile7.healthEffect = -15;
    tile7.actionBtnName = @"Fight those scum!";
    
    CCTile *tile8 = [[CCTile alloc]init];
    tile8.story = @"8 The legend of the deep, the mighty kraken appears";
    tile8.backImage = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    tile8.healthEffect = -40;
    tile8.actionBtnName = @"Abandon Ship";
    
    CCTile *tile9 = [[CCTile alloc]init];
    tile9.story = @"9 You stumble upon a hidden cave of pirate treasurer";
    tile9.backImage = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    tile9.healthEffect = 27;
    tile9.actionBtnName = @"Take Treasurer";

    NSMutableArray *thirdColumn = [[NSMutableArray alloc]initWithObjects:tile7,tile8,tile9, nil];

    
    CCTile *tile10 = [[CCTile alloc]init];
    tile10.story = @"10 A group of pirates attempts to board your ship";
    tile10.backImage = [UIImage imageNamed:@"PirateAttack.jpg"];
    tile10.healthEffect = -15;
    tile10.actionBtnName = @"Repel the invaders";
    
    CCTile *tile11 = [[CCTile alloc]init];
    tile11.story = @"11 In the deep of the sea many things live and many things can be found.  Will the fortune bring help or ruin?";
    tile11.backImage = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    tile11.healthEffect = -7;
    tile11.actionBtnName = @"Swim Deeper";
    
    CCTile *tile12 = [[CCTile alloc]init];
    tile12.story = @"12 Your final faceoff with the fearsome pirate boss";
    tile12.backImage = [UIImage imageNamed:@"PirateBoss.jpeg"];
    tile12.healthEffect = -15;
    tile12.actionBtnName = @"Fight";

    NSMutableArray *fourthColumn = [[NSMutableArray alloc]initWithObjects:tile10, tile11, tile12, nil];
    
    NSArray *tiles = [[NSArray alloc]initWithObjects:firstColumn, secondColumn, thirdColumn, fourthColumn, nil];
    
    return tiles;
}


-(CCCharacter*)character
{
    CCCharacter* character = [[CCCharacter alloc]init];
    character.health = 100;
    
    CCArmor* armor = [[CCArmor alloc]init];
    armor.name = @"Cloak";
    armor.health = 5;
    character.armor = armor;
    
    CCWeapon* weapon = [[CCWeapon alloc]init];
    weapon.name = @"Fists";
    weapon.damage = 10;
    character.weapon = weapon;
    
    return character;
}

-(CCBoss*) boss
{
    CCBoss* boss = [[CCBoss alloc]init];
    boss.health = 20;
    return  boss;
}

@end
