//
//  ViewController.m
//  HeliosUnitTest
//
//  Created by beyo-zhaoyf on 2017/7/25.
//  Copyright © 2017年 beyo-zhaoyf. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
#define WeakSelf(type)  __weak typeof(type) weak##type = type;
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self makeUI];
    [self login:@"13111111111" andCode:@"111111"];
   
}
- (void)login:(NSString *)phone andCode:(NSString *)code {
    [API_Text requestWithMethod:@"login" withPath:@"HeliosPath" complate:^(id respone, NSError *error) {
        switch ([respone integerValue]) {
            case 0:
            {
                NSLog(@"登录成功了");
            }
                break;
                
            default:
                break;
        }
    }];
}
- (void)makeUI {
    UIImageView *imageView = [[UIImageView alloc]init];
    self.view.backgroundColor = [UIColor blackColor];
    imageView.frame = CGRectMake(100, 200, 100, 100);
    [self.view addSubview:imageView];
    [self setAnimation:imageView];
}
- (void)setAnimation:(UIImageView *)imageView {
    WeakSelf(imageView);
    [imageView sd_setImageWithURL:[NSURL URLWithString:@"http://yetestpic2.beyo.com.cn//default/20170712/14998394230423a685d7d02cf3.jpg"]
                 placeholderImage:[self createImageWithColor:[UIColor blackColor]]
                   completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                       if (image && cacheType == SDImageCacheTypeNone) {
                           CATransition *transition = [CATransition animation];
                           transition.type = kCATransitionFade;
                           transition.duration = 1;
                           transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
                           [weakimageView.layer addAnimation:transition forKey:nil];
                       }
                   }];
}
- (UIImage *)createImageWithColor:(UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
- (NSInteger )testAdd:(NSInteger)a and:(NSInteger )b{
    return a+b;
}

- (NSInteger)getNum {
    return 10;
}
- (void)getNumber {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
