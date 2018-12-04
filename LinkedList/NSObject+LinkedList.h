//
//  NSObject+LinkedList.h
//  LinkedList
//
//  Created by Dima  on 12/2/18.
//  Copyright © 2018 Dima . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LinkedList : NSObject
+ (NSInteger) randomeValueForArray:(NSInteger) fromValue toValue:(NSInteger) toValue;
+ (LinkedList*) randomList:(NSInteger) elementsAmount from:(NSInteger) from to:(NSInteger) to;
- (BOOL) addFirst:(NSInteger) value;
- (BOOL) addLast:(NSInteger) value;
- (BOOL) deleteFirst;
- (BOOL) deleteLast;
- (BOOL) deleteNode:(NSInteger) value;
- (BOOL) clear;
- (LinkedList*) insertSort;
- (NSInteger) size;

@end
