//
//  UITextField+CLUViewRecordableAdditions.m
//  Clue
//
//  Created by Ahmed Sulaiman on 5/30/16.
//  Copyright © 2016 Ahmed Sulaiman. All rights reserved.
//

#import "UITextField+CLUViewRecordableAdditions.h"
#import "UIView+CLUViewRecordableAdditions.h"

@implementation UITextField (CLUViewRecordableAdditions)

- (NSMutableDictionary *)clue_viewPropertiesDictionary {
    if (!self) {
        return nil;
    }
    NSMutableDictionary *rootDictionary = [super clue_viewPropertiesDictionary];
    NSDictionary *propertiesDictionary = [rootDictionary valueForKey:@"properties"];
    
    [rootDictionary setValue:NSStringFromClass([self class]) forKey:@"class"];
    
    NSDictionary *attributedTextDictionary = [self clue_attributedTextPropertyDictionaryForAttributedString:[self attributedText]];
    NSDictionary *attributedPlaceholderDictionary = [self clue_attributedTextPropertyDictionaryForAttributedString:[self attributedPlaceholder]];
    NSDictionary *fontDictionary = [self clue_fontPropertyDictionaryForFont:self.font];
    NSDictionary *textColorDicitonary = [self clue_colorPropertyDictionaryForColor:[self textColor]];
    
    [propertiesDictionary setValue:[self text] forKey:@"text"];
    [propertiesDictionary setValue:attributedTextDictionary forKey:@"attributedText"];
    [propertiesDictionary setValue:[self placeholder] forKey:@"placeholder"];
    [propertiesDictionary setValue:attributedPlaceholderDictionary forKey:@"attributedPlaceholder"];
    [propertiesDictionary setValue:fontDictionary forKey:@"font"];
    [propertiesDictionary setValue:textColorDicitonary forKey:@"textColor"];
    [propertiesDictionary setValue:[NSNumber numberWithFloat:[self minimumFontSize]] forKey:@"minimumFontSize"];
    [propertiesDictionary setValue:[NSNumber numberWithBool:[self isEditing]] forKey:@"editing"];
    [propertiesDictionary setValue:[NSNumber numberWithInt:[self borderStyle]] forKey:@"borderStyle"];
    // TODO: Save image in a different way
//    [propertiesDictionary setValue:[self background] forKey:@"background"];
//    [propertiesDictionary setValue:[self disabledBackground] forKey:@"disabledBackground"];
    
    [rootDictionary setValue:propertiesDictionary forKey:@"properties"];
    
    return rootDictionary;
}

@end