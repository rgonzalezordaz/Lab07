//
//  Municipio.m
//  Lab05
//
//  Created by Ricardo Gonzalez on 30/06/16.
//  Copyright © 2016 RGO. All rights reserved.
//

#import "Municipio.h"

@interface Municipio ()

@end

@implementation Municipio
/**********************************************************************************************/
#pragma mark - Initialization methods
/**********************************************************************************************/

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-------------------------------------------------------------------------------
- (void)initController {
    if ([self.stEstadoSelected isEqual:@"Jalisco"]){
        self.destinationTitles          = [[NSMutableArray alloc] initWithObjects: @"Guadalajara", @"Zapopan", @"Tlaquepaque", @"Mazamitla", @"Vallarta", nil];
        self.destinationPhotos          = [[NSMutableArray alloc] initWithObjects: @"Guadalajara.jpg", @"Zapopan.jpg", @"Tlaquepaque.jpg", @"Mazamitla.jpg", @"Vallarta.jpg", nil];
        self.destinationDescriptions   = [[NSMutableArray alloc] initWithObjects: @"Mejor conocida como la perla de occidente Guadalajara es la capital del estado", @"Tierra de amistad, trabajo y respeto, la ciudad màs industrializada de Jalisco", @"Cuna alfarera del paìs, excelente lugar turistico tanto por sus actividades artisticas como su cultura", @"Con un excelente ambiente templade es un lugar ideal para relajarse y olvidarse de la ciudad", @"Por sus hermosas playas y vida nocturna Puerto Vallarta es ideal para vacacionar", nil];
    } else if ([self.stEstadoSelected isEqual:@"Michoacan"]){
        self.destinationTitles          = [[NSMutableArray alloc] initWithObjects: @"Morelia", @"Uruapan", @"Zitacuaro", @"Cotija", @"Patzcuaro", nil];
        self.destinationPhotos          = [[NSMutableArray alloc] initWithObjects: @"Morelia.jpg", @"Uruapan.jpg", @"Zitacuaro.jpg", @"Cotija.jpg", @"Patzcuaro.jpg", nil];
        self.destinationDescriptions   = [[NSMutableArray alloc] initWithObjects: @"La capital del estado de Michoacan cuenta con excelentes atracciones para los turistas", @"Con hermosos paisajes naturales y un excellente clima Uruapan es un lugar para estar en contacto con la naturaleza", @"Al igual que Uruapan, Zitacuaro cuenta con hermosos paisajes naturales ideales para descansar", @"Cotija es un pueblo rodeado de cerros verdes, cuenta con bellas mujeres y un excelente queso", @"Patzcuaro es mejor conocido por sus tradiciones como el particular festejo del dìa de muertos", nil];
    } else if ([self.stEstadoSelected isEqual:@"Colima"]){
        self.destinationTitles          = [[NSMutableArray alloc] initWithObjects: @"Colima", @"Manzanillo", @"Tecoman", @"Comala", @"Armeria", nil];
        self.destinationPhotos          = [[NSMutableArray alloc] initWithObjects: @"Colima.jpg", @"Manzanillo.jpg", @"Tecoman.jpg", @"Comala.jpg", @"Armeria.jpg", nil];
        self.destinationDescriptions   = [[NSMutableArray alloc] initWithObjects: @"Con un excellente clima tropical Colima es la capital del estado", @"Ideal para quienes piensan vacacionar, Manzanillo cuenta con preciosas playas", @"Tecoman cuenta con hermosos paisajes y un fuerte contacto con la naturaleza", @"Destino que cuenta con hermosos paisajes y un fuerte contacto con la naturaleza", @"Destino de lujo para almas aventureras que buscan libertad", nil];
    } else if ([self.stEstadoSelected isEqual:@"Sinaloa"]){
        self.destinationTitles          = [[NSMutableArray alloc] initWithObjects: @"Culiacan", @"Guasave", @"Navolato", @"Rosario", @"Mazatlan", nil];
        self.destinationPhotos          = [[NSMutableArray alloc] initWithObjects: @"Culiacan.jpg", @"Guasave.jpg", @"Navolato.jpg", @"Rosario.jpg", @"Mazatlan.jpg", nil];
        self.destinationDescriptions   = [[NSMutableArray alloc] initWithObjects: @"La capital del estado cuenta con hermosas mujeres", @"Lugar con excelentes playas y bellas mujeres", @"Navolato Sinaloa un lugar con bastante tradicion", @"Destino que cuenta con hermosos paisajes y un fuerte contacto con la naturaleza", @"Hermosas playas, Mazatlan tiene un excellente clima y es ideal para vacacionar", nil];
    } else if ([self.stEstadoSelected isEqual:@"Nayarit"]){
        self.destinationTitles          = [[NSMutableArray alloc] initWithObjects: @"Tepic", @"Jala", @"Compostela", @"Bahia de Banderas", @"Tecuala", nil];
        self.destinationPhotos          = [[NSMutableArray alloc] initWithObjects: @"Tepic.jpg", @"Jala.jpg", @"Compostela.jpg", @"BahiaDeBanderas.jpg", @"Tecuala.jpg", nil];
        self.destinationDescriptions   = [[NSMutableArray alloc] initWithObjects: @"Tepic es la capital de estado de Nayarit", @"Destino para quienes buscan la tranquilidad durante sus vacaciones", @"Compostela es conocido por sus hermosas playas y su tranquilidad", @"Bahia de banderas cuenta con playas certificadas como bandera azul, esta por demàs señalar que es ideal para quienes desean unas excellentes vacaciones", @"Con hermosos paisajes naturales y un excellente clima Tecuala es un lugar para estar en contacto con la naturaleza", nil];
    }
    
    
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
    celdaMunicipio *cell = (celdaMunicipio *)[tableView dequeueReusableCellWithIdentifier:@"celdaMunicipio"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"celdaMunicipio" bundle:nil] forCellReuseIdentifier:@"celdaMunicipio"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"celdaMunicipio"];
    }
    //Fill cell with info from arrays
   cell.lblMunicipio.text   = self.destinationTitles[indexPath.row];
   cell.lblMunDesc.text        = self.destinationDescriptions[indexPath.row];
   cell.imgMunicipio.image       = [UIImage imageNamed:self.destinationPhotos[indexPath.row]];
    
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        self.SelectedTitles        = self.destinationTitles[indexPath.row];
        self.SelectedDescriptions  = self.destinationDescriptions[indexPath.row];
        self.SelectedPhotos        = self.destinationPhotos[indexPath.row];
    [self performSegueWithIdentifier:@"Destination" sender:self];
}
/**********************************************************************************************/
#pragma mark - Navigation
/**********************************************************************************************/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.destinationViewController isKindOfClass:[Destination class]]) {
        Destination *destination     = [segue destinationViewController];
        destination.Title        = self.SelectedTitles;
        destination.Description = self.SelectedDescriptions;
        destination.Photo = self.SelectedPhotos;
        
    }
}

@end
