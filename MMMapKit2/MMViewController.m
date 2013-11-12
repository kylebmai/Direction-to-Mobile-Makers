//
//  MMViewController.m
//  MMMapKit2
//
//  Created by Kyle Mai on 10/8/13.
//  Copyright (c) 2013 Kyle Mai. All rights reserved.
//

#import "MMViewController.h"
#import "MMAcademyLocation.h"
#import "MMAnnotationView.h"

@interface MMViewController ()
{
    CLLocationCoordinate2D coordinate;
}

@end

@implementation MMViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    coordinate = CLLocationCoordinate2DMake(41.8939,-87.6353);
    MKCoordinateSpan zoomLevel = {0.01, 0.01};
    [_mapView2 setRegion:MKCoordinateRegionMake(coordinate, zoomLevel) animated:YES];
    
    MMAcademyLocation *point = [[MMAcademyLocation alloc] init];
    point.coordinate = coordinate;
    [_mapView2 addAnnotation:point];
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    NSString *annotationID = @"annotationID";
    
    MKAnnotationView *view = [mapView dequeueReusableAnnotationViewWithIdentifier:annotationID];
    
    if (!view)
    {
        view = [[MMAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:annotationID];
        view.canShowCallout = YES;
        view.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    }
    else
    {
        view.annotation = annotation;
    }
    
    
    return view;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
//    **** Get location by apple URL scheme
//    NSString *coordinatesString = [NSString stringWithFormat:@"http://maps.apple.com/?daddr=%f,%f&saddr=1+infinite+loop,+cupertino,+ca", coordinate.latitude, coordinate.longitude];
//    
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: coordinatesString]];
    
//  *** Get location by using MapKit ***
    MKPlacemark *placeMark = [[MKPlacemark alloc] initWithCoordinate:coordinate addressDictionary:nil];
    MKMapItem *destination = [[MKMapItem alloc] initWithPlacemark:placeMark];
    [destination openInMapsWithLaunchOptions:@{MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving}];
    
}


@end


/*
 
 
 q=
 The query parameter. This parameter is treated as if it had been typed into the query box by the user in the Maps app. q=* is not supported
 near=
 The location part of the query.
 ll=
 The latitude and longitude points (in decimal format, comma separated, and in that order) for the map center point.
 sll=
 The latitude and longitude points from which a business search should be performed.
 spn=
 The approximate latitude and longitude span.
 sspn=
 A custom latitude and longitude span format used by Apple.
 t=
 The type of map to display.
 z=
 The zoom level.
 saddr=
 The source address, which is used when generating driving directions
 daddr=
 The destination address, which is used when generating driving directions.
 
*/
