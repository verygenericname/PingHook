#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
extern "C" void SBSLockDevice();

%hook AVPlayerItem

- (instancetype)initWithURL:(NSURL *)URL {
    NSDictionary* defaults = [[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.nathan.pinghook"];
    NSString *filepath = [defaults objectForKey:@"FilePath"];
    BOOL isEnabled = [[defaults objectForKey:@"isEnabled"]?:@NO boolValue];
    BOOL isLockDeviceEnabled = [[defaults objectForKey:@"isLockDeviceEnabled"]?:@NO boolValue];
    if(isEnabled) {
        if ([URL.absoluteString containsString:@"ping.caf"] || [URL.absoluteString containsString:@"ping.aiff"]) {
            if ([[NSFileManager defaultManager] fileExistsAtPath:filepath]) {
                URL = [NSURL fileURLWithPath:filepath];
            }
        }
    }
    
    if(isLockDeviceEnabled) {
        SBSLockDevice();
    }

    return %orig;
}

%end
