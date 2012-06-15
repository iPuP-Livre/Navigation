//
//  ModalViewController.m
//  Navigation
//
//  Created by Marian PAUL on 21/03/12.
//  Copyright (c) 2012 iPuP SARL. All rights reserved.
//

#import "ModalViewController.h"
#import "FirstViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

@synthesize delegate = _delegate;

- (void)viewDidLoad {
    [super viewDidLoad];

    // on met une couleur pour bien voir les animations
    [self.view setBackgroundColor:[UIColor redColor]];
    
    // construction du bouton retour
    UIButton *theButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [theButton addTarget:self action:@selector(retourToMain:) forControlEvents:UIControlEventTouchUpInside];
    [theButton setFrame:CGRectMake(0, 0, 70, 30)];
    [theButton setCenter:self.view.center];
    [theButton setTitle:@"Retour" forState:UIControlStateNormal];
    [self.view addSubview:theButton];
    
    // construction du bouton pour aller dans le navigation controller
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self action:@selector(goToFirstView:) forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(80, 400, 180, 30)];
    [button setTitle:@"Navigation Controller" forState:UIControlStateNormal];
    [self.view addSubview:button];

}

- (void)retourToMain:(id)sender {
    // informe le delegate que l'on souhaite se retirer
    [self.delegate modalViewControllerDidFinish:self];    
}

- (void) goToFirstView:(id)sender 
{    
    if (!_navigationController) // [1]
    {
        FirstViewController *firstViewController = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
        _navigationController = [[UINavigationController alloc] initWithRootViewController:firstViewController];
    }
    
    [self presentModalViewController:_navigationController animated:YES];    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
