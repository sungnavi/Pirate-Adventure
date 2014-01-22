//
//  CCCharacter.h
//  Pirate Adventure
//
//  Created by Sungnavi on 2014. 1. 15..
//  Copyright (c) 2014년 Sungnavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCWeapon.h"
#import "CCArmor.h"

@interface CCCharacter : NSObject

@property (strong, nonatomic) CCArmor *armor;
@property (strong, nonatomic) CCWeapon *weapon;
@property (nonatomic) int damage;
@property (nonatomic) int health;

@end
