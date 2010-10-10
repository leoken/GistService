//
//  GistServiceAppDelegate.m
//  GistService
//
//  Created by Andy Matuschak on 7/23/09.
//  Copyright 2009 Andy Matuschak. All rights reserved.
//

#import "GistServiceAppDelegate.h"

@implementation GistServiceAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	[NSApp setServicesProvider:self];
}


- (void)postGist:(NSPasteboard *)pboard userData:(NSString *)userData error:(NSString **)error
{
	NSString *toolPath = [[NSBundle mainBundle] pathForResource:@"gistpaste" ofType:@""];
	@try
	{
		if ([pboard canReadObjectForClasses:[NSArray arrayWithObject:[NSURL class]] options:[NSDictionary dictionary]])
		{
			NSArray *items = [pboard readObjectsForClasses:[NSArray arrayWithObject:[NSURL class]] options:[NSDictionary dictionary]];
			
			NSMutableArray *args = [NSMutableArray arrayWithObjects:@"-p", @"-o", nil];
			for (NSURL *item in items)
			{
				[args addObject:[item path]];
			}
			NSTask *task = [NSTask launchedTaskWithLaunchPath:toolPath arguments:args];
			[task waitUntilExit];		
		}
		else
		{
			NSArray *items = [pboard readObjectsForClasses:[NSArray arrayWithObject:[NSString class]] options:[NSDictionary dictionary]];
			
			NSString *contents = [items objectAtIndex:0];
			NSTask *task = [[[NSTask alloc] init] autorelease];
			[task setLaunchPath:toolPath];
			[task setArguments:[NSArray arrayWithObjects:@"-p", @"-o", nil]];
			NSPipe *pipe = [NSPipe pipe];
			[[pipe fileHandleForWriting] writeData:[contents dataUsingEncoding:NSUTF8StringEncoding]];
			[[pipe fileHandleForWriting] closeFile];
			[task setStandardInput:pipe];
			[task launch];
			[task waitUntilExit];		
		}
	}
	@finally
	{
		[NSApp terminate:self];
	}

}

@end
