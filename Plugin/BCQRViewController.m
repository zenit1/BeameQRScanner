//
//  QRViewController.m
//  testCocoaBinarySocket
//
//  Created by Artur Khidirnabiev on 17.04.16.
//  Copyright © 2016 Zeev Glozman. All rights reserved.
//

#import "BCQRViewController.h"

@implementation BCQRViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *endpoint = [[NSUserDefaults standardUserDefaults] objectForKey:@"endpoint"];
    
    endpoint = [NSString stringWithFormat:@"https://%@/Web/index.html", endpoint];
    
    self.qrImageView.image = [UIImage imageWithCIImage:[self createQRForString:endpoint]];
}

- (CIImage *)createQRForString:(NSString *)qrString {
    NSData *stringData = [qrString dataUsingEncoding: NSISOLatin1StringEncoding];
    
    CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [qrFilter setValue:stringData forKey:@"inputMessage"];
    
    return qrFilter.outputImage;
}

- (IBAction)closeButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
