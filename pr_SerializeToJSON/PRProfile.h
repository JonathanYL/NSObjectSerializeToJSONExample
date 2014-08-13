//
//  PRProfile.h
//  pr_SerializeToJSON
//
//  Created by Jonathan Yeung on 2014-08-12.
//  Copyright (c) 2014 Jonathan Yeung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PRProfile : NSObject

@property (strong, nonatomic) NSString *id;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *gender;

-(id)initWithDetails:(NSString*)newId
            withName:(NSString*)newName
         withAddress:(NSString*)newAddress
          withGender:(NSString*)gender;

@end
