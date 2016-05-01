//
//  CDVQRManager.m
//  testCocoaBinarySocket
//
//  Created by Artur Khidirnabiev on 06.04.16.
//  Copyright © 2016 Zeev Glozman. All rights reserved.
//

#import "BCQRManager.h"

#import "QRCodeReaderViewController.h"
#import "QRListener.h"

@implementation BCQRManager
- (void)startScan:(CDVInvokedUrlCommand*)command{
    dispatch_async(dispatch_get_main_queue(), ^{
        QRListener *listener = [QRListener shared];
        
        listener.cancelCallback = ^{
            [self.viewController dismissViewControllerAnimated:YES completion:nil];
        };
        
        
        QRCodeReader *reader = [QRCodeReader readerWithMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]];
        
        QRCodeReaderViewController *controller = [QRCodeReaderViewController readerWithCancelButtonTitle:@"Cancel" codeReader:reader startScanningAtLoad:YES showSwitchCameraButton:NO showTorchButton:NO];
        
        controller.delegate = listener;
        controller.modalPresentationStyle = UIModalPresentationFormSheet;
        
        [reader setCompletionWithBlock:^(NSString *resultAsString) {
            [self.viewController dismissViewControllerAnimated:YES completion:nil];
            
            CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultAsString];
            [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
        }];
        
        [self.viewController presentViewController:controller animated:YES completion:nil];
    });
}
@end
