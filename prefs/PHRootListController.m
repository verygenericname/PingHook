#import <Preferences/Preferences.h>
#import "spawn.h"

@interface PHRootListController : PSListController
@end

@implementation PHRootListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}
	return _specifiers;
}
@end
