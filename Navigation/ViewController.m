//
//  ViewController.m
//  Navigation
//
//  Created by Marian PAUL on 21/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // on met une couleur pour bien voir les animations
    [self.view setBackgroundColor:[UIColor blueColor]];
    
    // flip
    UIButton *flipButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [flipButton addTarget:self action:@selector(flipToModalView:) forControlEvents:UIControlEventTouchUpInside];
    [flipButton setFrame:CGRectMake(30, 30, 120, 30)];
    [flipButton setTitle:@"Flip" forState:UIControlStateNormal];
    [self.view addSubview:flipButton];
    
    // Recouvrement vertical
    UIButton *coverButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [coverButton addTarget:self action:@selector(coverToModalView:) forControlEvents:UIControlEventTouchUpInside];
    [coverButton setFrame:CGRectMake(170, 30, 120, 30)];
    [coverButton setTitle:@"Recouvrement" forState:UIControlStateNormal];
    [self.view addSubview:coverButton];
    
    // Fondu
    UIButton *dissolveButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [dissolveButton addTarget:self action:@selector(dissolveToModalView:) forControlEvents:UIControlEventTouchUpInside];
    [dissolveButton setFrame:CGRectMake(30, 80, 120, 30)];
    [dissolveButton setTitle:@"Fondu" forState:UIControlStateNormal];
    [self.view addSubview:dissolveButton];
    
    // Recouvrement partiel
    UIButton *curlButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [curlButton addTarget:self action:@selector(partialCurlToModalView:) forControlEvents:UIControlEventTouchUpInside];
    [curlButton setFrame:CGRectMake(170, 80, 120, 30)];
    [curlButton setTitle:@"Curl" forState:UIControlStateNormal];
    [self.view addSubview:curlButton];

}

- (void) flipToModalView:(id)sender 
{
    [self goToModalView:UIModalTransitionStyleFlipHorizontal];
}
- (void) coverToModalView:(id)sender 
{
    [self goToModalView:UIModalTransitionStyleCoverVertical];
}
- (void) dissolveToModalView:(id)sender 
{
    [self goToModalView:UIModalTransitionStyleCrossDissolve];
}
- (void) partialCurlToModalView:(id)sender 
{
    [self goToModalView:UIModalTransitionStylePartialCurl];
}

- (void)goToModalView:(UIModalTransitionStyle)transitionStyle 
{    
    // allocation d'une instance de SecondViewController
    ModalViewController *controller = [[ModalViewController alloc] initWithNibName:@"ModalViewController" bundle:nil];
    // self est le delegate
    controller.delegate = self;
    //on choisit l'animation selon le paramètre
    controller.modalTransitionStyle = transitionStyle;
    // on affiche le controller
    [self presentModalViewController:controller animated:YES];    
}

// Méthode delegate de SecondViewController
- (void) modalViewControllerDidFinish:(ModalViewController *)viewController 
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
