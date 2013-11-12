//
//  MMAnnotationView.m
//  MMMapKit2
//
//  Created by Kyle Mai on 10/8/13.
//  Copyright (c) 2013 Kyle Mai. All rights reserved.
//

#import "MMAnnotationView.h"

@implementation MMAnnotationView

- (id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    
    if (self) {
        // Initialization code
        self.image = [UIImage imageNamed:@"mobilemakers"];
    }
    
    return self;
}

@end
