//
//  PRProfile.m
//  pr_SerializeToJSON
//
//  Created by Jonathan Yeung on 2014-08-12.
//  Copyright (c) 2014 Jonathan Yeung. All rights reserved.
//

#import "PRProfile.h"

@implementation PRProfile


-(id)initWithDetails:(NSString*)newId
            withName:(NSString*)newName
         withAddress:(NSString*)newAddress
          withGender:(NSString*)gender
{
    self = [super init];
    self.id = newId;
    self.name = newName;
    self.address = newAddress;
    self.gender = gender;
    return self;
}
@end
