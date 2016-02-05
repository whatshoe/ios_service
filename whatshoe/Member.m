//
//  Member.m
//  whatshoe
//
//  Created by comso on 2015. 12. 28..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import "Member.h"

@implementation Member

-(NSString *)genderFormatCoding:(NSString*)gender
{
    NSString* formatString = gender;
    if([formatString isEqualToString:@"male"])
    {
        formatString = @"남";
    }
    else if([formatString isEqualToString:@"female"])
    {
        formatString = @"여";
    }
    return formatString;
}
-(NSString *)genderFormatCoding2:(NSString*)gender
{
    NSString* formatString = gender;
    if([formatString isEqualToString:@"남"])
    {
        formatString = @"male";
    }
    else if([formatString isEqualToString:@"여"])
    {
        formatString = @"female";
    }
    else
    {
        formatString = @"";
    }
    return formatString;
}

-(NSString *)dateFormatCoding:(NSString*)date
{
    NSString* formatString = date;
    if([formatString isEqual:@"2015-10-01"])
    {
        formatString = @"null";
    }
    else if(formatString.length == 6)
    {
        NSString* tempString = [formatString substringWithRange:NSMakeRange(0, 2)];
        tempString = [tempString stringByAppendingString:@"."];
        tempString = [tempString stringByAppendingString:[formatString substringWithRange:NSMakeRange(2, 2)]];
        tempString = [tempString stringByAppendingString:@"."];
        tempString = [tempString stringByAppendingString:[formatString substringWithRange:NSMakeRange(4, 2)]];
        formatString = tempString;
    }
    else if(formatString.length == 8)
    {
        NSRange range = [formatString rangeOfString:@"-"];
        if (range.location == NSNotFound)
        {
            range = [formatString rangeOfString:@"/"]; //92/04/30
            if (range.location == NSNotFound)
            {
                NSString* tempString = [formatString substringWithRange:NSMakeRange(2, 2)];
                tempString = [tempString stringByAppendingString:@"."];
                tempString = [tempString stringByAppendingString:[formatString substringWithRange:NSMakeRange(4, 2)]];
                tempString = [tempString stringByAppendingString:@"."];
                tempString = [tempString stringByAppendingString:[formatString substringWithRange:NSMakeRange(6, 2)]];
                formatString = tempString;
            }
            else // /기호 잇음
            {
                NSString* tempString = [formatString substringWithRange:NSMakeRange(0, 2)];
                tempString = [tempString stringByAppendingString:@"."];
                tempString = [tempString stringByAppendingString:[formatString substringWithRange:NSMakeRange(3, 2)]];
                tempString = [tempString stringByAppendingString:@"."];
                tempString = [tempString stringByAppendingString:[formatString substringWithRange:NSMakeRange(6, 2)]];
                formatString = tempString;
            }
        }
        else // -기호 잇음
        {
            NSString* tempString = [formatString substringWithRange:NSMakeRange(0, 2)];
            tempString = [tempString stringByAppendingString:@"."];
            tempString = [tempString stringByAppendingString:[formatString substringWithRange:NSMakeRange(3, 2)]];
            tempString = [tempString stringByAppendingString:@"."];
            tempString = [tempString stringByAppendingString:[formatString substringWithRange:NSMakeRange(6, 2)]];
            formatString = tempString;
        }
    }
    else if(formatString.length == 10)
    {
        NSRange range = [formatString rangeOfString:@"-"];
        if (range.location == NSNotFound)
        {
            range = [formatString rangeOfString:@"/"];
            if (range.location == NSNotFound)
            {
                formatString = @"";
            }
            else // /기호 있음
            {
                if([[formatString substringWithRange:NSMakeRange(4, 1)] isEqualToString:@"/"]) //YYYY/MM/DD
                {
                    NSString* tempString = [formatString substringWithRange:NSMakeRange(2, 2)];
                    tempString = [tempString stringByAppendingString:@"."];
                    tempString = [tempString stringByAppendingString:[formatString substringWithRange:NSMakeRange(5, 2)]];
                    tempString = [tempString stringByAppendingString:@"."];
                    tempString = [tempString stringByAppendingString:[formatString substringWithRange:NSMakeRange(8, 2)]];
                    formatString = tempString;
                }
                else //MM/DD/YYYY
                {
                    NSString* tempString = [formatString substringWithRange:NSMakeRange(8, 2)];
                    tempString = [tempString stringByAppendingString:@"."];
                    tempString = [tempString stringByAppendingString:[formatString substringWithRange:NSMakeRange(0, 2)]];
                    tempString = [tempString stringByAppendingString:@"."];
                    tempString = [tempString stringByAppendingString:[formatString substringWithRange:NSMakeRange(3, 2)]];
                    formatString = tempString;
                }
            }
        }
        else // -기호 있음
        {
            NSString* tempString = [formatString substringWithRange:NSMakeRange(2, 2)];
            tempString = [tempString stringByAppendingString:@"."];
            tempString = [tempString stringByAppendingString:[formatString substringWithRange:NSMakeRange(5, 2)]];
            tempString = [tempString stringByAppendingString:@"."];
            tempString = [tempString stringByAppendingString:[formatString substringWithRange:NSMakeRange(8, 2)]];
            formatString = tempString;
        }
    }
    else
    {
        formatString = @"";
    }
    return formatString;
}
-(NSString *)dateFormatCoding2:(NSString*)date
{
    NSString* formatString = date;
    if(formatString.length == 8) //92.04.30
    {
        NSString* tempString = [formatString substringWithRange:NSMakeRange(3, 2)];
        tempString = [tempString stringByAppendingString:@"/"];
        tempString = [tempString stringByAppendingString:[formatString substringWithRange:NSMakeRange(6, 2)]];
        tempString = [tempString stringByAppendingString:@"/"];
        if([[formatString substringWithRange:NSMakeRange(0, 2)] intValue]<20)
        {
            tempString = [tempString stringByAppendingString:@"20"];
        }
        else
        {
            tempString = [tempString stringByAppendingString:@"19"];
        }
        tempString = [tempString stringByAppendingString:[formatString substringWithRange:NSMakeRange(0, 2)]];
        formatString = tempString;
    }
    else if(formatString.length == 6)
    {
        NSString* tempString = [formatString substringWithRange:NSMakeRange(2, 2)];
        tempString = [tempString stringByAppendingString:@"/"];
        tempString = [tempString stringByAppendingString:[formatString substringWithRange:NSMakeRange(4, 2)]];
        tempString = [tempString stringByAppendingString:@"/"];
        if([[formatString substringWithRange:NSMakeRange(0, 2)] intValue]<20)
        {
            tempString = [tempString stringByAppendingString:@"20"];
        }
        else
        {
            tempString = [tempString stringByAppendingString:@"19"];
        }
        tempString = [tempString stringByAppendingString:[formatString substringWithRange:NSMakeRange(0, 2)]];
        formatString = tempString;
    }
    else
    {
        formatString = @"";
    }
    return formatString;
}


@end
