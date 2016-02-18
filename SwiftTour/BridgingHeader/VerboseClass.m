//
//  VerboseClass.m
//  SwiftTour
//
//  Created by Fatih Nayebi on 2015-11-22.
//  Copyright © 2015 Fatih Nayebi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VerboseClass.h"

//  VerboseClass.m
@implementation VerboseClass

- (instancetype)init {
    self = [super init];
    if (self) {
        _anArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)aMethod:(NSMutableArray *)anArray {
    self.anArray = [[NSMutableArray alloc] initWithArray:@[@"One", @"Two", @"Three"]];
}


@end
