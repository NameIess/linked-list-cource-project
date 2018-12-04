//
//  Node.m
//  LinkedList
//
//  Created by Dima  on 12/2/18.
//  Copyright © 2018 Dima . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Node.h"

@implementation Node

- (instancetype)initWith:(Node*) next previous:(Node*) previous value:(NSInteger) value
{
    self = [super init];
    if (self) {
        self.next = next;
        self.previous = previous;
        self.nodeValue = value;
    }
    return self;
}

- (BOOL)isEqual:(id)other
{
    if (other == self) {
        return YES;
    } else if (![super isEqual:other]) {
        return NO;
    } else {
        Node* node = other;
        return [node.next isEqual:_next] && [node.previous isEqual:_previous] && node.nodeValue == _nodeValue;
    }
}


- (NSUInteger)hash
{
    NSInteger prime = 31;
    NSInteger result = 1;
    result = prime * result + [self.next  hash];
    result = prime * result + [self.previous hash];
    
    return prime * result + self.nodeValue;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"value =  %@, prev = %@, next = %@, prev address = %p, next address = %p " ,
            [NSNumber numberWithInteger:_nodeValue],
            [NSNumber numberWithInteger:_previous.nodeValue],
            [NSNumber numberWithInteger:_next.nodeValue],
            self.previous, self.next];
}

@end
