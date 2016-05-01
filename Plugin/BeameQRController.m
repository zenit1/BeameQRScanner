//
//  BeameQRController.m
//  QRScanner
//
//  Created by Artur Khidirnabiev on 30.04.16.
//  Copyright © 2016 Artur Khidirnabiev. All rights reserved.
//

#import "BeameQRController.h"
#import "BCQRViewController.h"

#import "QRCodeReaderViewController.h"
#import "QRListener.h"

@implementation BeameQRController
- (void)startScan:(CDVInvokedUrlCommand*)command{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *cancel = @"Cancel";
        
        if (command.arguments.firstObject != nil){
            cancel = command.arguments.firstObject;
        }
        
        QRListener *listener = [QRListener shared];
        
        listener.cancelCallback = ^{
            [self.viewController dismissViewControllerAnimated:YES completion:nil];
        };
        
        
        QRCodeReader *reader = [QRCodeReader readerWithMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]];
        
        QRCodeReaderViewController *controller = [QRCodeReaderViewController readerWithCancelButtonTitle:cancel codeReader:reader startScanningAtLoad:YES showSwitchCameraButton:NO showTorchButton:NO];
        
        controller.delegate = listener;
        controller.modalPresentationStyle = UIModalPresentationFormSheet;
        
        [reader setCompletionWithBlock:^(NSString *resultAsString) {
            CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultAsString];
            [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
        }];
        
        [self.viewController presentViewController:controller animated:YES completion:nil];
    });
}
@end
