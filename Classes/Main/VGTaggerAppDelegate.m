//
//  VGTaggerAppDelegate.m
//  VGTagger
//
//  Created by Bilal Syed Hussain on 05/07/2011.
//  Copyright 2011  All rights reserved.
//

#import "VGTaggerAppDelegate.h"
#import "MainController.h"

#import "GeneralPreferencesViewController.h"
#import "AdvancedPreferencesViewController.h"
#import "CoverViewController.h"

#import "DDLog.h"
#import "DDASLLogger.h"
#import "DDTTYLogger.h"
#import "PSDDFormatter.h"
#import "MASPreferencesWindowController.h"

#import <MacRuby/MacRuby.h>


@implementation VGTaggerAppDelegate
@synthesize window, mainController, preferencesWindowController;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{	 
	NSString *path = [[NSBundle mainBundle] pathForResource:@"Vgmdb" ofType:@"rb"];
	[[MacRuby sharedRuntime] evaluateFileAtPath:path];
	[[DDTTYLogger sharedInstance ] setLogFormatter:	[[[PSDDFormatter alloc ] init ] autorelease]];
	[DDLog addLogger:[DDASLLogger sharedInstance]];
	[DDLog addLogger:[DDTTYLogger sharedInstance]];
	
}


// Handle a file dropped on the dock icon
- (BOOL)application:(NSApplication *)sender openFile:(NSString *)path
{
	NSString *dirPath = ([[path pathExtension ] isEqualToString:@""]) 
	? path 
	: [path stringByDeletingLastPathComponent];
	
	[self.mainController showWindow:self];
	[self.mainController goToDirectory:[[NSURL alloc] initFileURLWithPath:dirPath]];
	
	return YES;
}

#pragma mark - Preferences

- (NSWindowController *)preferencesWindowController
{
    if (_preferencesWindowController == nil)
    {
        NSViewController *generalViewController  = [[GeneralPreferencesViewController alloc] initWithMainController:mainController];
        NSViewController *advancedViewController = [[AdvancedPreferencesViewController alloc] init];
		NSViewController *coverViewController    = [[CoverViewController alloc] init];
		
        NSArray *controllers = [[NSArray alloc] initWithObjects:
								generalViewController, coverViewController, advancedViewController,
								nil];
        [generalViewController release];
        [advancedViewController release];
        [coverViewController release];
		
        NSString *title = NSLocalizedString(@"Preferences", @"Common title for Preferences window");
        _preferencesWindowController = [[MASPreferencesWindowController alloc] initWithViewControllers:controllers title:title];
        [controllers release];
    }
    return _preferencesWindowController;
}

- (IBAction)openPreferences:(id)sender
{
    [self.preferencesWindowController showWindow:nil];
}

#pragma mark - Quicklook
- (IBAction)togglePreviewPanel:(id)previewPanel
{
    if ([QLPreviewPanel sharedPreviewPanelExists] && [[QLPreviewPanel sharedPreviewPanel] isVisible]) {
        [[QLPreviewPanel sharedPreviewPanel] orderOut:nil];
    } else {
        [[QLPreviewPanel sharedPreviewPanel] makeKeyAndOrderFront:nil];
    }
}

@end