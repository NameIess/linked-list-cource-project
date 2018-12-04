//
//  main.m
//  LinkedList
//
//  Created by Dima  on 12/2/18.
//  Copyright © 2018 Dima . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Node.h"
#import "NSObject+LinkedList.h"
#include <curses.h>

int const ADD_FIRST = 1;
int const ADD_LAST = 2;
int const DELETE = 3;
int const DELETE_FIRST = 4;
int const DELETE_LAST = 5;
int const INSERT_SORT = 6;
int const CLEAR = 7;
int const PRINT_LIST = 8;
int const EXIT = 9;

void menu() {
    NSLog(@"What do you want to do next?\n 1 - add first element\n 2 - add last element\n 3 - delete by key\n 4 - delete first element\n 5 - delete last element\n 6 - sort linked list\n 7 - clear linkedList\n 8 - print linkedList\n 9 - exit\n");
}

void succsesAction(NSString* message) {
    NSLog(@"Action succsfully complite: %@", message);
}

void failureAction(NSString* message) {
    NSLog(@"Action failed: %@", message);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Enter 'yes' if you want to create a Linked List");
        char yes[5];
        scanf("%s", yes);
        NSString * userInput = [[NSString alloc] initWithCString: yes encoding: NSUTF8StringEncoding];
        if ([userInput isEqualToString:@"yes"]) {
            NSLog(@"Enter elements amount: ");
            int elementsAmount = 0;
            scanf("%i", &elementsAmount);
            NSLog(@"Random elements from value: ");
            int from = 0;
            scanf("%i", &from);
            NSLog(@"to value: ");
            int to = 0;
            scanf("%i", &to);
            LinkedList* list = [LinkedList randomList:elementsAmount from:from to:to];
            NSLog(@"linked list = %@", list);
            
            int action = 0;
            
            while (action != EXIT) {
                menu();
                scanf("%i", &action);
            
            if (action == ADD_FIRST) {
                NSLog(@"Enter value to add : ");
                int firstValue = 0;
                scanf("%i", &firstValue);
                [list addFirst:firstValue] ?
                    succsesAction([NSString stringWithFormat:@"linked list with new first value = %@", list]) :
                    failureAction([NSString stringWithFormat:@"linked list without new first value = %@", list]);
            } else if (action == ADD_LAST) {
                NSLog(@"Enter value to add: ");
                int lastValue = 0;
                scanf("%i", &lastValue);
                [list addLast:lastValue] ?
                    succsesAction([NSString stringWithFormat:@"linked list with new last value = %@", list]) :
                    failureAction([NSString stringWithFormat:@"linked list without new last value = %@", list]);
            } else if (action == DELETE) {
                NSLog(@"Enter value to delete: ");
                int lastValue = 0;
                scanf("%i", &lastValue);
                [list deleteNode:lastValue] ?
                    succsesAction([NSString stringWithFormat:@"linked list without value = %@", list]) :
                    failureAction([NSString stringWithFormat:@"linked list with value = %@", list]);
            } else if (action == DELETE_FIRST) {
                [list deleteFirst] ?
                    succsesAction([NSString stringWithFormat:@"linked list without first value = %@", list]) :
                    failureAction([NSString stringWithFormat:@"linked list with first value = %@", list]);
            } else if (action == DELETE_LAST) {
                [list deleteLast] ?
                    succsesAction([NSString stringWithFormat:@"linked list without last value = %@", list]) :
                    failureAction([NSString stringWithFormat:@"linked list with last value = %@", list]);
            } else if (action == CLEAR) {
                [list clear] ?
                    succsesAction([NSString stringWithFormat:@"linkedList is clear %@", list]) :
                    failureAction([NSString stringWithFormat:@"linkedList was not cleared %@", list]);
            } else if (action == PRINT_LIST) {
                succsesAction([NSString stringWithFormat:@"LinkedList print = %@", [list description]]);
            } else if (action == INSERT_SORT) {
                list = [list insertSort];
                succsesAction([NSString stringWithFormat:@"Linked list after insert Sort %@", list]);
            }

          }
        }
    }
    NSLog(@"exit");
    return 0;
}

