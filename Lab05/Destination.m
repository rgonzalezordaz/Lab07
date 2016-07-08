//
//  Destination.m
//  Lab05
//
//  Created by Ricardo Gonzalez on 01/07/16.
//  Copyright © 2016 RGO. All rights reserved.
//

#import "Destination.h"
@import GoogleMaps;
#import "Google/Analytics.h"


@interface Destination ()

@end

@implementation Destination
GMSMapView *mapView_;

/**********************************************************************************************/
#pragma mark - Initialization methods
/**********************************************************************************************/

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lblMunicipio.text          = self.Title;
    self.lblDescripcion.text    = self.Description;
    self.imgMunicipio.image   = [UIImage imageNamed: self.Photo];
    
    if ([self.Title isEqual:@"Guadalajara"]){
        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:20.6737778
                                                                longitude:-103.4054536
                                                                     zoom:6];
        mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
        mapView_.myLocationEnabled = YES;
        self.view = mapView_;
        
        // Creates a marker in the center of the map.
        GMSMarker *marker = [[GMSMarker alloc] init];
        marker.position = CLLocationCoordinate2DMake(20.6737778, -103.4054536);
        marker.title = @"Guadalajara";
        marker.snippet = @"Capital de Jalisco";
        marker.map = mapView_;
        
    }else if ([self.Title isEqual:@"Morelia"]){
        //19.7038033
        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:19.7038033
                                                                longitude:-101.2761646
                                                                     zoom:6];
        mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
        mapView_.myLocationEnabled = YES;
        self.view = mapView_;
        
        // Creates a marker in the center of the map.
        GMSMarker *marker = [[GMSMarker alloc] init];
        marker.position = CLLocationCoordinate2DMake(19.7038033, -101.2761646);
        marker.title = @"Morelia";
        marker.snippet = @"Capital de Michoacan";
        marker.map = mapView_;
        
        
        
    } else if ([self.Title isEqual:@"Colima"]){
        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:19.2400344
                                                                longitude:-103.7986483
                                                                     zoom:6];
        mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
        mapView_.myLocationEnabled = YES;
        self.view = mapView_;
        
        // Creates a marker in the center of the map.
        GMSMarker *marker = [[GMSMarker alloc] init];
        marker.position = CLLocationCoordinate2DMake(19.2400344, -103.7986483);
        marker.title = @"Colima";
        marker.snippet = @"Capital de Colima";
        marker.map = mapView_;
        
    } else if ([self.Title isEqual:@"Culiacan"]){
        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:24.8050567
                                                                longitude:-107.4933547
                                                                     zoom:6];
        mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
        mapView_.myLocationEnabled = YES;
        self.view = mapView_;
        
        // Creates a marker in the center of the map.
        GMSMarker *marker = [[GMSMarker alloc] init];
        marker.position = CLLocationCoordinate2DMake(24.8050567, -107.4933547);
        marker.title = @"Culiacan";
        marker.snippet = @"Capital de Sinaloa";
        marker.map = mapView_;
        
    } else if ([self.Title isEqual:@"Tepic"]){
        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:21.501062
                                                                longitude:-104.9119243
                                                                     zoom:6];
        mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
        mapView_.myLocationEnabled = YES;
        self.view = mapView_;
        
        // Creates a marker in the center of the map.
        GMSMarker *marker = [[GMSMarker alloc] init];
        marker.position = CLLocationCoordinate2DMake(21.501062, -104.9119243);
        marker.title = @"Tepic";
        marker.snippet = @"Capital de Nayarit";
        marker.map = mapView_;
    }
    
    // Do any additional setup after loading the view.
}

- (void) viewWillAppear:(BOOL)animated {
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:[self Title]];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
