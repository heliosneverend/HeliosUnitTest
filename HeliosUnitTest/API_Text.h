//
//  API_Text.h
//  HeliosUnitTest
//
//  Created by beyo-zhaoyf on 2017/7/25.
//  Copyright © 2017年 beyo-zhaoyf. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface API_Text : NSObject
typedef enum
{
    FTJson     = 0,
    FTXml      = 1,
    FTPlist    = 2,
    FTImage    = 3,
    FTData     = 4
}FTFormat;

@property (readonly, nonatomic, unsafe_unretained) FTFormat format;
+ (void)requestWithMethod:(NSString *)method
                 withPath:(NSString *)path
                 complate:(void(^)(id respone,NSError *error))complete;
@end
