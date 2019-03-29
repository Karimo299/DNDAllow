#include "DNDARootListController.h"

@implementation DNDARootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}

- (void) paypal {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://paypal.me/Karimo299"]];
}

- (void) git {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://github.com/Karimo299/DNDAllow"]];
}

- (void) tweet {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://twitter.com/karimo299"]];
}

@end
