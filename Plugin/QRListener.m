//
//  QRListener.m
//  testCocoaBinarySocket
//
//  Created by Artur Khidirnabiev on 06.04.16.
//  Copyright © 2016 Zeev Glozman. All rights reserved.
//

#import "QRListener.h"

@implementation QRListener
static QRListener *manager;

+ (id)shared{
    if (manager == nil){
        manager = [[QRListener alloc] init];
    }
    
    return manager;
}

- (void)readerDidCancel:(QRCodeReaderViewController *)reader{
    self.cancelCallback();
}

- (void)reader:(QRCodeReaderViewController *)reader didScanResult:(NSString *)result{
    
}
@end
