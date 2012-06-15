//
//  ViewController.h
//  Navigation
//
//  Created by Marian PAUL on 21/03/12.
//  Copyright (c) 2012 iPuP SARL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalViewController.h"

@interface ViewController : UIViewController <ModalViewControllerDelegate>
- (void)goToModalView:(UIModalTransitionStyle)transitionStyle;
@end
