//
//  BeameQRController.h
//  QRScanner
//
//  Created by Artur Khidirnabiev on 30.04.16.
//  Copyright © 2016 Artur Khidirnabiev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Cordova/CDVPlugin.h>


@interface BeameQRController : CDVPlugin
- (void)startScan:(CDVInvokedUrlCommand*)command;
@end
