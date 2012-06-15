//
//  ThirdViewController.m
//  Navigation
//
//  Created by Marian PAUL on 21/03/12.
//  Copyright (c) 2012 iPuP SARL. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void) viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Third";
    
    // bouton annuler
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Annuler" style:UIBarButtonItemStyleDone target:self action:@selector(returnToSecond:)];
    self.navigationItem.leftBarButtonItem = cancelButton;
    
    // Construction d'une vue custom pour la droite de la barre
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:[UIImage imageNamed:@"01-refresh.png"], [UIImage imageNamed:@"05-shuffle.png"], [UIImage imageNamed:@"12-eye.png"], nil]];
    
    [segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    segmentedControl.frame = CGRectMake(0, 0, 90, 30);
    segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    segmentedControl.momentary = YES;
    
    // création du bouton de droite à partir du segmented control        
    UIBarButtonItem *segmentBarItem = [[UIBarButtonItem alloc] initWithCustomView:segmentedControl];
    self.navigationItem.rightBarButtonItem = segmentBarItem;
    
    // construction du bouton pour aller dans la première vue.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self action:@selector(goToFirstView:) forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(0, 0, 80, 30)];
    [button setCenter:self.view.center];
    [button setTitle:@"First" forState:UIControlStateNormal];
    [self.view addSubview:button];

}

- (void) returnToSecond:(id)sender 
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) segmentAction:(id)sender 
{
    UISegmentedControl *control = (UISegmentedControl*)sender;
    NSLog(@"a appuyé sur %d", control.selectedSegmentIndex);
    // Typiquement, faire un switch case sur le selectedSegmentIndex
}

- (void) goToFirstView:(id)sender 
{
    [self.navigationController popToRootViewControllerAnimated:YES];
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
