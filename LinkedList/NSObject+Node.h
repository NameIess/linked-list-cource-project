//
//  NSObject+Node.h
//  LinkedList
//
//  Created by Dima  on 12/2/18.
//  Copyright © 2018 Dima . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

@property (strong, nonatomic) Node* next;
@property (strong, nonatomic) Node* previous;
@property (assign, nonatomic) NSInteger nodeValue;

- (instancetype)initWith:(Node*) next previous:(Node*) previous value:(NSInteger) value;

@end
