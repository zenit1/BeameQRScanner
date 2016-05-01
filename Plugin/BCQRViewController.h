//
//  QRViewController.h
//  testCocoaBinarySocket
//
//  Created by Artur Khidirnabiev on 17.04.16.
//  Copyright © 2016 Zeev Glozman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BCQRViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *qrImageView;

- (IBAction)closeButton:(id)sender;
@end
