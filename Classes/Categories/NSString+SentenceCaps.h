//
//  NSString+SentenceCaps.h
//  Tagger
//
//  Created by Enrique G. Paredes on 31/07/2013
//
//  Original source from  http://stackoverflow.com/a/5586781
//
//  Copyright 2011  All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (NSString_SentenceCaps)

- (NSString *)sentenceCapitalizedString; // sentence == entire string
- (NSString *)realSentenceCapitalizedString; // sentence == real sentences

@end