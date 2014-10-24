//
//  Owner.m
//  Assessment4
//
//  Created by S on 10/24/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//

#import "Owner.h"
#import "Dog.h"


@implementation Owner

@dynamic name;
@dynamic dog;

+ (void)ownerFromJSON:(void (^)(NSArray *))complete
{
    NSURL *url = [NSURL URLWithString:@"http://s3.amazonaws.com/mobile-makers-assets/app/public/ckeditor_assets/attachments/25/owners.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
     {
         NSError *jsonError = nil;

         NSMutableArray *tempArray = [[NSMutableArray alloc] init];

         if (data)
         {
             tempArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
         }
         complete(tempArray);

         NSLog(@"Connection Error: %@", connectionError);
         NSLog(@"JSON Error: %@", jsonError);
     }];
}

@end
