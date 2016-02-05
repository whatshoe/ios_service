//
//  Member.h
//  whatshoe
//
//  Created by comso on 2015. 12. 28..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Member : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, strong) NSString *lv;
@property (nonatomic, strong) NSString *shoeSize;
@property (nonatomic, strong) NSString *phone;

-(NSString *)genderFormatCoding:(NSString*)gender;
-(NSString *)genderFormatCoding2:(NSString*)gender;
-(NSString *)dateFormatCoding:(NSString*)date;
-(NSString *)dateFormatCoding2:(NSString*)date;

@end

