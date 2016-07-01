//
//  Municipio.h
//  Lab05
//
//  Created by Ricardo Gonzalez on 30/06/16.
//  Copyright © 2016 RGO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "celdaMunicipio.h"
#import "Destination.h"

@interface Municipio : UIViewController
@property NSMutableArray *destinationTitles;
@property NSMutableArray *destinationDescriptions;
@property NSMutableArray *destinationPhotos;
@property NSString *stEstadoSelected;
@property NSString *SelectedTitles;
@property NSString *SelectedDescriptions;
@property NSString *SelectedPhotos;
@end
