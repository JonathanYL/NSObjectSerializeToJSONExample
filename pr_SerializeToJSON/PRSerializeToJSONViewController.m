//
//  PRSerializeToJSONViewController.m
//  pr_SerializeToJSON
//
//  Created by Jonathan Yeung on 2014-08-12.
//  Copyright (c) 2014 Jonathan Yeung. All rights reserved.
//

#import "PRSerializeToJSONViewController.h"

@interface PRSerializeToJSONViewController ()

@end

@implementation PRSerializeToJSONViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self serializeFunction];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - serialize
- (void)serializeFunction
{
    // Instantiating the profiles.
    PRProfile *firstProfile = [[PRProfile alloc] initWithDetails:@"1"
                                                   withName:@"Jonathan"
                                                withAddress:@"123 Fake Street"
                                                 withGender:@"Male"];
    
    PRProfile *secondProfile = [[PRProfile alloc] initWithDetails:@"2"
                                                         withName:@"Jerry"
                                                      withAddress:@"123 Fun Street"
                                                       withGender:@"Male"];
    
    // Creating a mutable array.
    NSMutableArray *profileList = [[NSMutableArray alloc] init];
    [profileList addObject:firstProfile];
    [profileList addObject:secondProfile];
    
    
    // Serializing stuff now.
    NSMutableArray *profileListJSON = [[NSMutableArray alloc] init];
    for (int i = 0; i < profileList.count; i++) {
        PRProfile *profile = [profileList objectAtIndex:i];
        NSDictionary *profileDict = [NSDictionary dictionaryWithObjectsAndKeys:profile.id, @"id",
                                     profile.name, @"name", profile.address, @"address",
                                     profile.gender, @"gender", nil];

        NSData *encodedData = [NSJSONSerialization dataWithJSONObject:profileDict
                                                              options:NSJSONWritingPrettyPrinted error:nil];
        NSString *jsonString =[[NSString alloc] initWithData:encodedData encoding:NSUTF8StringEncoding];
        [profileListJSON addObject:jsonString];
        NSLog(@"%@", jsonString);

    }
    
    // Set up a key value pair in dictionary and convert to JSON.
    NSMutableDictionary *postDict = [[NSMutableDictionary alloc]init];
    [postDict setValue:profileListJSON forKey:@"Profiles"];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:postDict options:0 error:nil];
    
    // Checking the format
    NSLog(@"%@",[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
}
@end
