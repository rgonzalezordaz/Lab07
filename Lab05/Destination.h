//
//  Destination.h
//  Lab05
//
//  Created by Ricardo Gonzalez on 01/07/16.
//  Copyright © 2016 RGO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Destination : UIViewController

@property NSString *Title;
@property NSString *Description;
@property NSString *Photo;

@property (strong, nonatomic) IBOutlet UIImageView *imgMunicipio;

@property (strong, nonatomic) IBOutlet UILabel *lblMunicipio;
@property (strong, nonatomic) IBOutlet UILabel *lblDescripcion;

@end
