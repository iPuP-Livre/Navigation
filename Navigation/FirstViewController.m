//
//  FirstViewController.m
//  Navigation
//
//  Created by Marian PAUL on 21/03/12.
//  Copyright (c) 2012 iPuP SARL. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"First";
    
    // bouton done
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Retour" style:UIBarButtonItemStyleDone target:self action:@selector(returnToModal:)];
    self.navigationItem.rightBarButtonItem = doneButton;
    
    // construction du bouton pour aller dans la deuxième vue
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self action:@selector(goToSecondView:) forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(0, 0, 80, 30)];
    [button setCenter:self.view.center];
    [button setTitle:@"Second" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    
    self.navigationController.navigationBar.tintColor = [UIColor orangeColor];
    //self.navigationItem.titleView = customView;
    //[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"background_bar.png"] forBarMetrics:UIBarMetricsDefault];
}

- (void) goToSecondView:(id)sender 
{
    SecondViewController *viewController = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void) returnToModal:(id)sender 
{
    [self dismissModalViewControllerAnimated:YES];    
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
