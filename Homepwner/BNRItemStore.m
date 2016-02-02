//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Jason Malia on 1/20/16.
//  Copyright © 2016 Story Technology. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation BNRItemStore

+ (instancetype) sharedStore
{
    // A singleton
    /* Notice that the variable sharedStore is declared as static. A static variable is not destroyed when the method is done executing. Like a global variable, it is not kept on the stack. */
    static BNRItemStore *sharedStore;
    
    // Do I need to create a sharedStore?
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

// If a programmer calls [[BNRItemStore alloc] init], let him
// know the error of his ways
- (instancetype)init
{
    [NSException raise:@"Singleton"
                format:@"Use +[BNRItemStore sharedStore]"];
    
    return nil;
}

// Here is the real (secret) initializer
- (instancetype)initPrivate
{
    self = [super init];
    if (self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    
    return self;
}

/* We only want BNRItemsStore to have control over the list of items so we override the getter for allItems to ensure an immutable array is returned. */
- (NSArray *)allItems
{
    return [self.privateItems copy];
}

- (BNRItem *)createItem
{
    BNRItem *item = [BNRItem randomItem];
    [self.privateItems addObject:item];
    
    return item;
}

- (void)removeItem:(BNRItem *)item
{
    /* You could use NSMutableArray’s removeObject: method here instead of removeObjectIdenticalTo:, but consider the difference: removeObject: goes to each object in the array and sends it the message isEqual:. A class can implement this method to return YES or NO based on its own determination. For example, two BNRItem objects could be considered equal if they had the same valueInDollars. */
    [self.privateItems removeObjectIdenticalTo:item];
}

@end
