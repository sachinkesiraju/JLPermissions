//
//  JLViewController.m
//  JLPermissionsExample
//
//  Created by Joseph Laws on 4/19/14.
//  Copyright (c) 2014 Joe Laws. All rights reserved.
//

#import "JLViewController.h"

#import "JLCalendarPermission.h"
#import "JLCameraPermission.h"
#import "JLContactsPermission.h"
#import "JLFacebookPermission.h"
#import "JLHealthPermission.h"
#import "JLLocationPermission.h"
#import "JLMicrophonePermission.h"
#import "JLNotificationPermission.h"
#import "JLPhotosPermission.h"
#import "JLRemindersPermission.h"
#import "JLTwitterPermission.h"

@interface JLViewController ()

@property(strong, nonatomic) IBOutlet UILabel *pushNotificationLabel;
@property(strong, nonatomic) IBOutlet UILabel *addressBookLabel;
@property(strong, nonatomic) IBOutlet UILabel *photoLibraryLabel;
@property(strong, nonatomic) IBOutlet UILabel *calendarLabel;
@property(strong, nonatomic) IBOutlet UILabel *remindersLabel;
@property(strong, nonatomic) IBOutlet UILabel *locationsLabel;
@property(strong, nonatomic) IBOutlet UILabel *twitterLabel;
@property(strong, nonatomic) IBOutlet UILabel *facebookLabel;
@property(strong, nonatomic) IBOutlet UILabel *microphoneLabel;
@property(strong, nonatomic) IBOutlet UILabel *healthLabel;
@property(strong, nonatomic) IBOutlet UILabel *cameraLabel;

@property(strong, nonatomic) IBOutlet UISwitch *showExtraAlertSwitch;

@end

@implementation JLViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  NSLog(@"viewDidLoad");
  [self updateStatusLabels];
}

- (void)updateStatusLabels {
  self.calendarLabel.text =
      [self authorizationText:[[JLCalendarPermission sharedInstance] authorizationStatus]];
  self.pushNotificationLabel.text =
<<<<<<< HEAD
      [self authorizationText:
                [[JLPermissions sharedInstance] notificationsAuthorized]];
  self.addressBookLabel.text = [self
      authorizationText:[[JLPermissions sharedInstance] contactsAuthorized]];
  self.photoLibraryLabel.text = [self
      authorizationText:[[JLPermissions sharedInstance] photosAuthorized]];
  self.remindersLabel.text = [self
      authorizationText:[[JLPermissions sharedInstance] remindersAuthorized]];
  self.locationsLabel.text = [self
      authorizationText:[[JLPermissions sharedInstance] locationsAuthorized]];
  self.twitterLabel.text = [self
      authorizationText:[[JLPermissions sharedInstance] twitterAuthorized]];
  self.facebookLabel.text = [self
      authorizationText:[[JLPermissions sharedInstance] facebookAuthorized]];
  self.microphoneLabel.text = [self
      authorizationText:[[JLPermissions sharedInstance] microphoneAuthorized]];
=======
      [self authorizationText:[[JLNotificationPermission sharedInstance] authorizationStatus]];
  self.addressBookLabel.text =
      [self authorizationText:[[JLContactsPermission sharedInstance] authorizationStatus]];
  self.photoLibraryLabel.text =
      [self authorizationText:[[JLPhotosPermission sharedInstance] authorizationStatus]];
  self.remindersLabel.text =
      [self authorizationText:[[JLRemindersPermission sharedInstance] authorizationStatus]];
  self.locationsLabel.text =
      [self authorizationText:[[JLLocationPermission sharedInstance] authorizationStatus]];
  self.twitterLabel.text =
      [self authorizationText:[[JLTwitterPermission sharedInstance] authorizationStatus]];
  self.facebookLabel.text =
      [self authorizationText:[[JLFacebookPermission sharedInstance] authorizationStatus]];
  self.microphoneLabel.text =
      [self authorizationText:[[JLMicrophonePermission sharedInstance] authorizationStatus]];
  self.healthLabel.text =
      [self authorizationText:[[JLHealthPermission sharedInstance] authorizationStatus]];
  self.cameraLabel.text =
      [self authorizationText:[[JLCameraPermission sharedInstance] authorizationStatus]];
>>>>>>> jlaws/master
}

- (NSString *)authorizationText:(JLAuthorizationStatus)status {
  switch (status) {
    case JLPermissionNotDetermined:
      return @"Unknown";
      break;
    case JLPermissionDenied:
      return @"Denied";
      break;
    case JLPermissionAuthorized:
      return @"Authorized";
      break;
    default:
      return @"";
      break;
  }
}

- (IBAction)pushNotifications:(id)sender {
  [[JLNotificationPermission sharedInstance] setExtraAlertEnabled:self.showExtraAlertSwitch.on];
  [[JLNotificationPermission sharedInstance] authorize:^(NSString *deviceID, NSError *error) {
    NSLog(@"pushNotifications returned %@ with error %@", deviceID, error);
    [self updateStatusLabels];
  }];
}

- (IBAction)contacts:(id)sender {
  [[JLContactsPermission sharedInstance] setExtraAlertEnabled:self.showExtraAlertSwitch.on];
  [[JLContactsPermission sharedInstance] authorize:^(bool granted, NSError *error) {
    NSLog(@"contacts returned %@ with error %@", @(granted), error);
    [self presentReenableVCForCore:[JLContactsPermission sharedInstance]
                           granted:granted
                             error:error];
    [self updateStatusLabels];
  }];
}

- (IBAction)photoLibrary:(id)sender {
  [[JLPhotosPermission sharedInstance] setExtraAlertEnabled:self.showExtraAlertSwitch.on];
  [[JLPhotosPermission sharedInstance] authorize:^(bool granted, NSError *error) {
    NSLog(@"photoLibrary returned %@ with error %@", @(granted), error);
    [self presentReenableVCForCore:[JLPhotosPermission sharedInstance] granted:granted error:error];
    [self updateStatusLabels];
  }];
}

- (IBAction)calendar:(id)sender {
  [[JLCalendarPermission sharedInstance] setExtraAlertEnabled:self.showExtraAlertSwitch.on];
  [[JLCalendarPermission sharedInstance] authorize:^(bool granted, NSError *error) {
    NSLog(@"calendar returned %@ with error %@", @(granted), error);
    [self presentReenableVCForCore:[JLCalendarPermission sharedInstance]
                           granted:granted
                             error:error];
    [self updateStatusLabels];
  }];
}

- (IBAction)reminders:(id)sender {
  [[JLRemindersPermission sharedInstance] setExtraAlertEnabled:self.showExtraAlertSwitch.on];
  [[JLRemindersPermission sharedInstance] authorize:^(bool granted, NSError *error) {
    NSLog(@"reminders returned %@ with error %@", @(granted), error);
    [self presentReenableVCForCore:[JLRemindersPermission sharedInstance]
                           granted:granted
                             error:error];
    [self updateStatusLabels];
  }];
}

- (IBAction)microphone:(id)sender {
  [[JLMicrophonePermission sharedInstance] setExtraAlertEnabled:self.showExtraAlertSwitch.on];
  [[JLMicrophonePermission sharedInstance] authorize:^(bool granted, NSError *error) {
    NSLog(@"microphone returned %@ with error %@", @(granted), error);
    [self presentReenableVCForCore:[JLMicrophonePermission sharedInstance]
                           granted:granted
                             error:error];
    [self updateStatusLabels];
  }];
}
<<<<<<< HEAD
=======

- (IBAction)health:(id)sender {
  [[JLHealthPermission sharedInstance] setExtraAlertEnabled:self.showExtraAlertSwitch.on];
  [[JLHealthPermission sharedInstance] authorize:^(bool granted, NSError *error) {
    NSLog(@"health returned %@ with error %@", @(granted), error);
    [self presentReenableVCForCore:[JLHealthPermission sharedInstance] granted:granted error:error];
    [self updateStatusLabels];
  }];
}
>>>>>>> jlaws/master

- (IBAction)locations:(id)sender {
  [[JLLocationPermission sharedInstance] setExtraAlertEnabled:self.showExtraAlertSwitch.on];
  [[JLLocationPermission sharedInstance] authorize:^(bool granted, NSError *error) {
    NSLog(@"locations returned %@ with error %@", @(granted), error);
    [self presentReenableVCForCore:[JLLocationPermission sharedInstance]
                           granted:granted
                             error:error];
    [self updateStatusLabels];
  }];
}

- (IBAction)twitter:(id)sender {
  [[JLTwitterPermission sharedInstance] setExtraAlertEnabled:self.showExtraAlertSwitch.on];
  [[JLTwitterPermission sharedInstance] authorize:^(bool granted, NSError *error) {
    NSLog(@"twitter returned %@ with error %@", @(granted), error);
    [self presentReenableVCForCore:[JLTwitterPermission sharedInstance]
                           granted:granted
                             error:error];
    [self updateStatusLabels];
  }];
}

- (IBAction)facebook:(id)sender {
  [[JLFacebookPermission sharedInstance] setExtraAlertEnabled:self.showExtraAlertSwitch.on];
  [[JLFacebookPermission sharedInstance] authorize:^(bool granted, NSError *error) {
    NSLog(@"facebook returned %@ with error %@", @(granted), error);
    [self presentReenableVCForCore:[JLFacebookPermission sharedInstance]
                           granted:granted
                             error:error];
    [self updateStatusLabels];
  }];
}

- (IBAction)camera:(id)sender {
  [[JLCameraPermission sharedInstance] setExtraAlertEnabled:self.showExtraAlertSwitch.on];
  [[JLCameraPermission sharedInstance] authorize:^(bool granted, NSError *error) {
    NSLog(@"camera returned %@ with error %@", @(granted), error);
    [self presentReenableVCForCore:[JLCameraPermission sharedInstance] granted:granted error:error];
    [self updateStatusLabels];
  }];
}

- (void)presentReenableVCForCore:(JLPermissionsCore *)core
                         granted:(BOOL)granted
                           error:(NSError *)error {
  if (!granted && error.code == JLPermissionSystemDenied) {
    UIViewController *vc = [core reenableViewController];
    if (vc) {
      [self presentViewController:vc animated:YES completion:nil];
    } else {
      [core displayReenableAlert];
    }
  }
}

@end
