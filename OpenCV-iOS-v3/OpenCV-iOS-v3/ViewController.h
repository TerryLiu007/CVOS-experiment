//
//  ViewController.h
//  OpenCV-iOS-v3
//
//  Created by TerryLiu on 6/2/18.
//  Copyright © 2018 TerryLiu. All rights reserved.
//

#ifdef __cplusplus
#import <opencv2/opencv.hpp>
#import <opencv2/videoio/cap_ios.h>
#endif

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<CvVideoCameraDelegate>
{
    IBOutlet UIImageView *imageView;
}
@property (nonatomic, retain) CvVideoCamera* videoCamera;

@end

