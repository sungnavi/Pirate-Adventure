//
//  CCFactory.h
//  Pirate Adventure
//
//  Created by Sungnavi on 2014. 1. 11..
//  Copyright (c) 2014년 Sungnavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCCharacter.h"
#import "CCBoss.h"

@interface CCFactory : NSObject

-(NSArray *)tiles;
-(CCCharacter *)character;
-(CCBoss *)boss;

@end
