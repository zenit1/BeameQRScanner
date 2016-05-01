//
//  CDVQRManager.h
//  testCocoaBinarySocket
//
//  Created by Artur Khidirnabiev on 06.04.16.
//  Copyright © 2016 Zeev Glozman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>

@interface BCQRManager : CDVPlugin
- (void)startScan:(CDVInvokedUrlCommand*)command;
@end
