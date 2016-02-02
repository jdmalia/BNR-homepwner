//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Jason Malia on 1/20/16.
//  Copyright © 2016 Story Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

/*  See the @class directive? That tells the compiler that there is a BNRItem class and that the compiler does not need to know this class’s details in the current file – only that it exists. This allows you to use the BNRItem symbol in the declaration of createItem without importing BNRItem.h. Using the @class directive can speed up compile times considerably because fewer files have to be recompiled when one file changes. */
@class BNRItem;

@interface BNRItemStore : NSObject

@property (nonatomic, readonly, copy) NSArray *allItems;

// Notice that is a call method and prefixed with a + instead of -
+ (instancetype)sharedStore;
- (BNRItem *)createItem;
- (void)removeItem:(BNRItem *)item;

@end
