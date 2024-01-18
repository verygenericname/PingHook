#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

%hook AVPlayerItem

- (instancetype)initWithURL:(NSURL *)URL {
    NSDictionary* defaults = [[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.nathan.pinghook"];
    NSString *appID = @"com.nathan.pinghook";
    NSArray *keyList = [[NSUserDefaults standardUserDefaults] persistentDomainForName:appID].allKeys;
    NSString *filepath = [defaults objectForKey:@"FilePath"];
    BOOL isEnabled = [[defaults objectForKey:@"isEnabled"]?:@NO boolValue];
    if(isEnabled) {
        if ([URL.absoluteString containsString:@"ping.caf"]) {
            if ([[NSFileManager defaultManager] fileExistsAtPath:filepath]) {
                URL = [NSURL fileURLWithPath:filepath];
            }
        }
    }

    return %orig;
}

%end
