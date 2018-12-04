//
//  LinkedList.m
//  LinkedList
//
//  Created by Dima  on 12/2/18.
//  Copyright © 2018 Dima . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+LinkedList.h"
#import "NSObject+Node.h"

@interface LinkedList ()

@property (strong, nonatomic) NSMutableArray* array;

@end

@implementation LinkedList

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.array = [[NSMutableArray alloc] init];
    }
    return self;
}

- (instancetype)initWithArray:(NSMutableArray*) newArray
{
    self = [super init];
    if (self) {
        self.array = [[NSMutableArray alloc]initWithArray:newArray];
    }
    return self;
}

+ (NSInteger) randomeValueForArray:(NSInteger) fromValue toValue:(NSInteger) toValue {
    return (arc4random() % (toValue - fromValue)) + fromValue;
}

+ (LinkedList*) randomList:(NSInteger)elementsAmount from:(NSInteger)from to:(NSInteger)to {
    LinkedList* list = [[LinkedList alloc] init];
    
    for (NSInteger i = 0; i < elementsAmount; i++) {
        NSInteger randomValue = [self randomeValueForArray:from toValue:to];
        [list addLast:randomValue];
    }
    return list;
}

- (BOOL) addLast:(NSInteger)value {
    NSInteger count = [self size];
    if (count == 0) {
        Node* noder = [[Node alloc] initWith:nil previous:nil value:value];
        [self.array addObject:noder];
    } else {
        Node* firstNode = [self.array firstObject];
        Node* lastNode = [self.array lastObject];
        Node* node = [[Node alloc] initWith:nil previous: lastNode value:value];
        lastNode.next = node;
        node.next = firstNode;
        firstNode.previous = node;
        [self.array addObject:node];
    }
    return true;
}

- (BOOL) addFirst:(NSInteger)value {
    Node* lastNode = [self.array lastObject];
    Node* firstNode = [self.array firstObject];
    Node* noder = [[Node alloc] initWith:firstNode previous:lastNode value:value];
    firstNode.previous = noder;
    lastNode.next = noder;
    [self.array insertObject:noder atIndex:0];
    return true;
}

- (BOOL) deleteLast {
    Node* lastNode = [self.array lastObject];
    Node* firstNode = lastNode.next;
    Node* prev = lastNode.previous;
    prev.next = firstNode;
    firstNode.previous = prev;
    [self.array removeLastObject];
    return true;
}

- (BOOL) deleteNode:(NSInteger) value {
    BOOL isDeleted = false;
    Node* toDelete = nil;
    for (Node* node in self.array) {
        if (value == node.nodeValue) {
            Node* prevNode = node.previous;
            Node* nextNode = node.next;
            prevNode.next = nextNode;
            nextNode.previous = prevNode;
            toDelete = node;
        }
    }
    if (toDelete != nil) {
        [self.array removeObject:toDelete];
        isDeleted = true;
    }
    return isDeleted;
}

- (BOOL) deleteFirst {
    Node* firsNode = [self.array firstObject];
    Node* lastNode = firsNode.previous;
    Node* secondNode = firsNode.next;
    secondNode.previous = lastNode;
    lastNode.next = secondNode;
    [self.array removeObject:firsNode];
    return true;
}

- (BOOL) clear {
    BOOL isCleared = false;
    if ([self.array count] != 0) {
        [self.array removeAllObjects];
        isCleared = true;
    }
    return isCleared;
}

- (NSInteger) size {
    return [self.array count];
}

- (NSString *)description
{
    NSMutableString* string = [[NSMutableString alloc] init];
    for (Node* node in self.array) {
        [string appendString:[NSMutableString stringWithFormat:@"\n list index = `%@`, node = `%@`", [NSNumber numberWithInteger:[_array indexOfObject:node]], node]];
    }
    return string;
}

- (LinkedList*) insertSort {
    NSMutableArray* newArray = [[NSMutableArray alloc] initWithArray:self.array];
    for (int i = 1; i < [newArray count]; i++) {
        Node* currentNode = [newArray objectAtIndex:i];
        NSInteger currentValue = [currentNode nodeValue];
        NSInteger backIndex = i;
        if (currentValue > [[newArray objectAtIndex:backIndex - 1] nodeValue]) {
            Node* previous = [newArray objectAtIndex:i - 1];
            currentNode.previous = previous;
            previous.next = currentNode;
        }
        
        while (backIndex > 0 && currentValue < [[newArray objectAtIndex:backIndex - 1] nodeValue]) {
          
            Node* current = [newArray objectAtIndex:backIndex];
            Node* prev = [newArray objectAtIndex:backIndex - 1];
            Node* currentNext = current.next;
            Node* prevPrev = prev.previous;
            
            current.previous = prevPrev;
            prevPrev.next = current;
            
            current.next = prev;
            prev.previous = current;
            
            currentNext.previous = prev;
            prev.next = currentNext;
            
            [newArray exchangeObjectAtIndex:backIndex - 1  withObjectAtIndex:backIndex];
            backIndex--;
            
        }
    }
    LinkedList* newList = [[LinkedList alloc] initWithArray:newArray];
    return newList;
}

@end
