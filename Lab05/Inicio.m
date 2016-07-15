//
//  ViewController.m
//  Lab05
//
//  Created by Ricardo Gonzalez on 28/06/16.
//  Copyright © 2016 RGO. All rights reserved.
//

#import "Inicio.h"
#import <DigitsKit/DigitsKit.h>

@interface Inicio ()
@property NSMutableArray *destinationTitles;
@property NSMutableArray *destinationDescriptions;
@property NSMutableArray *destinationPhotos;
@property NSString *stEstadoSelected;

@end

@implementation Inicio
/**********************************************************************************************/
#pragma mark - Initialization methods
/**********************************************************************************************/

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
    
    DGTAuthenticateButton *authButton;
    authButton = [DGTAuthenticateButton buttonWithAuthenticationCompletion:^(DGTSession *session, NSError *error) {
        if (session.userID) {
            // TODO: associate the session userID with your user model
            NSString *msg = [NSString stringWithFormat:@"Phone number: %@", session.phoneNumber];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You are logged in!"
                                                            message:msg
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        } else if (error) {
            NSLog(@"Authentication error: %@", error.localizedDescription);
        }
    }];
    authButton.center = self.view.center;
    [self.view addSubview:authButton];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-------------------------------------------------------------------------------
- (void)initController {
    self.destinationTitles          = [[NSMutableArray alloc] initWithObjects: @"Jalisco", @"Michoacan", @"Colima", @"Sinaloa", @"Nayarit", nil];
    self.destinationPhotos          = [[NSMutableArray alloc] initWithObjects: @"Jalisco.png", @"Michoacan.png", @"Colima.png", @"Sinaloa.png", @"Nayarit.png", nil];
    self.destinationDescriptions   = [[NSMutableArray alloc] initWithObjects: @"Tierra de los charros, jaripeos, mariachi y tequila ", @"Tierra de guitarras, ahuacates y tradiciòn", @"El temple del brazo es vigor en la tierra", @"Estado agricola màs importante de Mexico", @"Destino para almas aventureras que buscan tranquilidad", nil];
}

/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}
//-------------------------------------------------------------------------------
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    //1. Setup the CATransform3D structure
    CATransform3D rotation;
    rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
    rotation.m34 = 1.0/ -600;
    
    //2. Define the initial state (Before the animation)
    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = 0;
    
    cell.layer.transform = rotation;
    cell.layer.anchorPoint = CGPointMake(0, 0.5);
    
    //3. Define the final state (After the animation) and commit the animation
    [UIView beginAnimations:@"rotation" context:NULL];
    [UIView setAnimationDuration:0.4];
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    
    //Reassure that cell its in its place (WaGo)
    cell.frame = CGRectMake(0, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
    [UIView commitAnimations];
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Initialize cells
    celdaEstado *cell = (celdaEstado *)[tableView dequeueReusableCellWithIdentifier:@"celdaEstado"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"celdaEstado" bundle:nil] forCellReuseIdentifier:@"celdaEstado"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"celdaEstado"];
    }
    //Fill cell with info from arrays
    cell.lblEstado.text   = self.destinationTitles[indexPath.row];
    cell.lblDescripcion.text        = self.destinationDescriptions[indexPath.row];
    cell.imgEstado.image       = [UIImage imageNamed:self.destinationPhotos[indexPath.row]];
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.stEstadoSelected       = self.destinationTitles[indexPath.row];
    //self.stDescriptionSelected  = self.destinationDescriptions[indexPath.row];
    //self.stPhotoSelected        = self.destinationPhotos[indexPath.row];
    [self performSegueWithIdentifier:@"Municipio" sender:self];
}
/**********************************************************************************************/
#pragma mark - Navigation
/**********************************************************************************************/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.destinationViewController isKindOfClass:[Municipio class]]) {
    Municipio *destination     = [segue destinationViewController];
    destination.stEstadoSelected        = self.stEstadoSelected;
        
    }
}
@end
