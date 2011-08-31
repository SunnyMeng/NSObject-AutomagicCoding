//
//  Foo.m
//  AutomagicCoding
//
//  Created by Stepan Generalov on 31.08.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Foo.h"
#import "NSObject+AutomagicCoding.h"

@implementation Foo

@synthesize integerValue = _integerValue;
@synthesize publicBar = _publicBar;


- (id)initWithDictionaryRepresentation: (NSDictionary *) aDict
{
    self = [super initWithDictionaryRepresentation: aDict];
    if (self) {
        [_publicBar retain];
    }
    
    return self;
}

- (NSArray *) keysForValuesInDictionaryRepresentation
{
    NSArray *array = [super keysForValuesInDictionaryRepresentation];
    return [array arrayByAddingObject:@"privateBar"];
}

- (void) dealloc
{
    [_publicBar release]; 
    _publicBar = nil;
    
    [super dealloc];
}

@end
