//
//  QRListener.h
//  testCocoaBinarySocket
//
//  Created by Artur Khidirnabiev on 06.04.16.
//  Copyright © 2016 Zeev Glozman. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "QRCodeReaderViewController.h"

@interface QRListener : NSObject <QRCodeReaderDelegate>
@property (nonatomic, copy) void (^cancelCallback)(void);

+ (id)shared;
@end
