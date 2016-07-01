//
//  Destination.m
//  Lab05
//
//  Created by Ricardo Gonzalez on 01/07/16.
//  Copyright © 2016 RGO. All rights reserved.
//

#import "Destination.h"

@interface Destination ()

@end

@implementation Destination

/**********************************************************************************************/
#pragma mark - Initialization methods
/**********************************************************************************************/

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lblMunicipio.text          = self.Title;
    self.lblDescripcion.text    = self.Description;
    self.imgMunicipio.image   = [UIImage imageNamed: self.Photo];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
