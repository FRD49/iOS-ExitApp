#import "CDVExitApp.h"
#import <Cordova/CDV.h>

@implementation CDVExitApp

- (void)exitApp:(CDVInvokedUrlCommand*)command
{
    
    CDVPluginResult* pluginResult = nil;
    
    NSString* echo = [command.arguments objectAtIndex:0];
    BOOL popUpAlert = [echo boolValue];
    bool closeApp = false;
    
    
    if (popUpAlert) {
    
        UIAlertView *confirmationPopUp = [[UIAlertView alloc] initWithTitle:@"Alert"
                                                                    message:@"Do you really want to close the application?"
                                                                   delegate:self
                                                          cancelButtonTitle:@"No"
                                                          otherButtonTitles:@"Yes", nil];
        [confirmationPopUp show];
    
    } else {
        
        closeApp = YES;
        
    }
    
    
    if (closeApp) {
       [self exitApplication];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch(buttonIndex) {
        case 0: //"No" pressed
        break;
        case 1: //"Yes" pressed
        [self exitApplication];
        break;
    }
}

- (void) exitApplication{
    exit(0);
}


@end