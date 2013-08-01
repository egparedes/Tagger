//
//  NSString+SentenceCaps.m
//  Tagger
//
//  Created by Enrique G. Paredes on 31/07/2013
//
//  Original source from  http://stackoverflow.com/a/5586781
//
//  Copyright 2011  All rights reserved.
//

#import "NSString+SentenceCaps.h"


@implementation NSString (NSString_SentenceCaps)

- (NSString *)sentenceCapitalizedString {
    if (![self length]) {
        return [NSString string];
    }
    NSString *uppercase = [[self substringToIndex:1] uppercaseString];
    NSString *lowercase = [[self substringFromIndex:1] lowercaseString];
    return [uppercase stringByAppendingString:lowercase];
}

- (NSString *)realSentenceCapitalizedString {
    __block NSMutableString *mutableSelf = [NSMutableString stringWithString:self];
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationBySentences
                          usingBlock:^(NSString *sentence, NSRange sentenceRange, NSRange enclosingRange, BOOL *stop) {
        [mutableSelf replaceCharactersInRange:sentenceRange withString:[sentence sentenceCapitalizedString]];
    }];
    return [NSString stringWithString:mutableSelf]; // or just return mutableSelf.
}

@end

