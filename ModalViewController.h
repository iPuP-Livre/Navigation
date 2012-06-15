//
//  ModalViewController.h
//  Navigation
//
//  Created by Marian PAUL on 21/03/12.
//  Copyright (c) 2012 iPuP SARL. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ModalViewControllerDelegate;

@interface ModalViewController : UIViewController
{
    UINavigationController *_navigationController;
}
@property (nonatomic, assign) id <ModalViewControllerDelegate> delegate;
@end

@protocol ModalViewControllerDelegate <NSObject>
- (void) modalViewControllerDidFinish:(ModalViewController*)viewController;
@end
