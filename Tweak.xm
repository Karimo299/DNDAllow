@interface BBBulletin : NSObject
@property (assign,nonatomic) BOOL ignoresQuietMode;
@property (assign,nonatomic) BOOL ignoresDowntime;
@property (nonatomic,copy) NSString * sectionID;
@end

static NSUserDefaults *prefs;
BOOL enabled;

static void loadPrefs() {
  prefs = [[NSUserDefaults alloc] initWithSuiteName:@"com.karimo299.dndallow"];
  enabled = [prefs objectForKey:@"isEnabled"] ? [[prefs objectForKey:@"isEnabled"] boolValue] : YES;
}

 %hook BBBulletin
-(id)init {
  if (enabled && [[prefs valueForKey:[NSString stringWithFormat:@"EnabledApps-%@", %orig.sectionID]] boolValue]) {
    %orig.ignoresQuietMode = YES;
    %orig.ignoresDowntime = YES;
  }

  return %orig;
}

-(void)setIgnoresQuietMode:(BOOL)arg1 {
  if (enabled && [[prefs valueForKey:[NSString stringWithFormat:@"EnabledApps-%@", self.sectionID]] boolValue]) %orig(YES);
    else %orig;
}

-(void)setIgnoresDowntime:(BOOL)arg1 {
  if (enabled && [[prefs valueForKey:[NSString stringWithFormat:@"EnabledApps-%@", self.sectionID]] boolValue]) %orig(YES);
  else %orig;
}
%end
%ctor {
  CFNotificationCenterAddObserver(
	CFNotificationCenterGetDarwinNotifyCenter(), NULL,
	(CFNotificationCallback)loadPrefs,
	CFSTR("com.karimo299.dndallow/prefChanged"), NULL,
	CFNotificationSuspensionBehaviorDeliverImmediately);
  loadPrefs();
}
