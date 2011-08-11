//
//  FileSystemCollection.h
//  VGTagger
//
//  Created by Bilal Syed Hussain on 30/07/2011.
//  Copyright 2011  All rights reserved.
//

#import <Foundation/Foundation.h>

/// This provides a wrapper around a array of filesystem nodes
/// It allows the tags to every node in the collection at the same time
/// to allow muti-row editing.
@interface FileSystemNodeCollection : NSObject {
@private
	NSArray *tagsArray;
	BOOL hasBasicMetadata;
	BOOL hasExtenedMetadata;
	
	NSString *albumArtist;
	NSString *composer;
	NSString *grouping;
	NSNumber *bpm; 
	NSNumber *totalTracks;
	NSNumber *disc;
	NSNumber *totalDiscs;
	NSNumber *compilation;
	
	NSString *url;
	NSImage *cover;
	
	NSString *title; 
	NSString *album; 
	NSString *artist;
	NSString *comment;
	NSString *genre;
	NSNumber *year;
	NSNumber *track; 
	NSNumber *length;
	
	BOOL writeToAll;
	BOOL  empty;
}

/// @name General

/// Array of FileSystemNodes.
@property (assign) NSArray *tagsArray;


/** Renames each selected node with the specifed format 
 
 @param formatStrings An Array of strings 
 @return NSError with the error data.
 */
-(NSError*) renameWithFormatArray:(NSArray*)formatStrings;

/// @name Finding General metadata.

// YES if empty
@property (assign) BOOL  empty;

/// YES if all the files has basic metadata info.
@property (readonly) BOOL  hasBasicMetadata;
/// YES if all the files has extend metadata info.
@property (readonly) BOOL  hasExtenedMetadata;

@property (readonly) NSArray *urls;

/// The title of the file
@property (assign) NSString *title; 
/// The album of the file
@property (assign) NSString *album; 
/// The artist of the file
@property (assign) NSString *artist; 
/// The comment of the file
@property (assign) NSString *comment;
/// The genre of the file
@property (assign) NSString *genre;
/// The year of the file
@property (assign) NSNumber *year;
/// The track# of the file
@property (assign) NSNumber *track; 
/// The length of the file in seconds
@property (assign,readonly) NSNumber *length; 

/// @name Finding Extra Metadata 

/// The album artist of the file
@property (assign) NSString *albumArtist;
/// The composer of the file
@property (assign) NSString *composer;
/// The grouping of the file
@property (assign) NSString *grouping;
/// The grouping of the file
@property (assign) NSNumber *bpm;
/// The total number of tracks in the album
@property (assign) NSNumber *totalTracks;
/// The disc# of the file
@property (assign) NSNumber *disc;
/// The total number of discs in the album
@property (assign) NSNumber *totalDiscs;
/// YES if the track is part of a compilation.
@property (assign) NSNumber *compilation;

// The url associated with the file
@property (assign) NSString *url;
// The album cover of the file
@property (assign) NSImage *cover;

@end