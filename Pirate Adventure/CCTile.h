//
//  CCTile.h
//  Pirate Adventure
//
//  Created by Sungnavi on 2014. 1. 11..
//  Copyright (c) 2014년 Sungnavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCArmor.h"
#import "CCWeapon.h"

@interface CCTile : NSObject

@property (strong,nonatomic) NSString *story;
@property (strong,nonatomic) UIImage *backImage;
@property (strong,nonatomic) NSString *actionBtnName;
@property (strong, nonatomic) CCArmor *armor;
@property (strong, nonatomic) CCWeapon *weapon;
@property (nonatomic) int healthEffect;

@end
