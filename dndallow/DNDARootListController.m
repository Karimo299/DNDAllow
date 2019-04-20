#include "DNDARootListController.h"
#include <spawn.h>
#include <signal.h>

@implementation DNDARootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}

- (void) respring {
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Respring"
	message:@"Are You Sure You Want To Respring?"
	preferredStyle:UIAlertControllerStyleActionSheet];

	UIAlertAction *respringBtn = [UIAlertAction actionWithTitle:@"Respring"
	style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
		pid_t pid;
		int status;
		const char* args[] = {"killall", "SpringBoard", NULL};
		posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char*
		const*)args, NULL);
		waitpid(pid, &status, WEXITED);
	}];

	UIAlertAction *cancelBtn = [UIAlertAction actionWithTitle:@"Cancel"
	style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {}];

	[alert addAction:respringBtn];
	[alert addAction:cancelBtn];

	[self presentViewController:alert animated:YES completion:nil];
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
