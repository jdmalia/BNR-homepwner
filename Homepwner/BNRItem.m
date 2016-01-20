//
//  BNRItem.m
//  Homepwner
//
//  Created by Jason Malia on 1/2/16.
//  Copyright © 2016 Story Technology. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

// CLASS METHODS
+ (instancetype)randomItem
{
    // Create an immutable array of three adjectives
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
    
    // Create an immutable array of three nouns
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];
    
    // Get the index of a random adjective noun from the list
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % [randomNounList count];
    
    // Note that NSInteger is not an object, but a type definition for "long"
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            randomAdjectiveList[adjectiveIndex],
                            randomNounList[nounIndex]];
    
    int randomValue = arc4random() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                        '0' + arc4random() % 10,
                                        'A' + arc4random() % 26,
                                        '0' + arc4random() % 10,
                                        'A' + arc4random() % 26,
                                        '0' + arc4random() % 10];
    
    BNRItem *newItem = [[self alloc] initWithItemName:randomName
                                          valueInDollars:randomValue
                                            serialNumber:randomSerialNumber];
    
    return newItem;
}

// INITIALIAZERS
- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber
{
    // Call the superclass's designated initializer
    self = [super init];
    
    // Did the superclass's designated initializer succeed?
    if (self) {
        // Give instance variable initial values
        _itemName = name;
        _valueInDollars = value;
        _serialNumber = sNumber;
        // Set _dateCreated to the current date and time
        _dateCreated = [[NSDate alloc] init];
    }
    
    // Returns the address of the newly initialized object
    return self;
};
- (instancetype)initWithItemName:(NSString *)name
{
    return [self initWithItemName:name
                   valueInDollars:0
                     serialNumber:@""];
};
- (instancetype)init
{
    return [self initWithItemName:@"Item"];
}
   
// INSTANCE METHODS
- (void)setItemName:(NSString *)str
{
    _itemName = str;
}
- (NSString *)itemName
{
    return _itemName;
}
- (void)setSerialNumber:(NSString *)str
{
    _serialNumber = str;
}
- (NSString *)serialNumber
{
    return _serialNumber;
}
- (void)setValueInDollars:(int)v
{
    _valueInDollars = v;
}
- (int)valueInDollars
{
    return _valueInDollars;
}
- (NSDate *)dateCreated
{
    return _dateCreated;
}

- (NSString *)description
{
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Worth: $%d, recorded on %@",self.itemName,
        self.serialNumber,
        self.valueInDollars,
        self.dateCreated];
    
    return descriptionString;
}

@end
