//
//  KLFoo.m
//  Demo Project
//
//  Created by kinglong huang on 9/7/12.
//  Copyright (c) 2012 KLStudio. All rights reserved.
//

#import "KLFoo.h"

@implementation KLFoo

#pragma mark - LifeCycle

- (NSString *)foo {
    return _foo;
}

- (void)setFoo:(NSString *)newFoo {
    if (_foo != newFoo) {
        [_foo release];
        _foo = [newFoo retain];
    }
}

- (void)dealloc {
    //MRC
    [_foo release];_foo = nil;  //OR self.foo = nil;
    [_bar release];_bar = nil;  //OR self.bar = nil;
    
    [super dealloc];
}

#pragma mark - Public

+ (id)fooWithString:(NSString *)string {
    return [[[self alloc] initWithString:string] autorelease];
}

- (id)initWithString:(NSString *)string {
    self = [super init];
    if (self) {
        self.foo = string;
        self.bar = [[[NSString alloc] initWithFormat:@"hi %d", 3] autorelease];
        return self;
    }
    return nil;
}

- (BOOL)doWorkWithString:(NSString *)blah {
    return YES;
}

@end