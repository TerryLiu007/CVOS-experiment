//
//  ViewController.m
//  OpenCV-iOS-v3
//
//  Created by TerryLiu on 6/2/18.
//  Copyright © 2018 TerryLiu. All rights reserved.
//

#import "ViewController.h"
using namespace cv;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.videoCamera = [[CvVideoCamera alloc] initWithParentView:imageView];
    self.videoCamera.delegate = self;
    
    self.videoCamera.defaultAVCaptureDevicePosition = AVCaptureDevicePositionBack;
    self.videoCamera.defaultAVCaptureSessionPreset = AVCaptureSessionPreset1280x720;
    self.videoCamera.defaultAVCaptureVideoOrientation = AVCaptureVideoOrientationPortrait;
    self.videoCamera.defaultFPS = 30;
    self.videoCamera.grayscaleMode = false;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Start:(id)sender {
    [self.videoCamera start];
}

- (IBAction)Stop:(id)sender {
    [self.videoCamera stop];
}

- (void)processImage:(Mat &)image { 

    Mat gray;
    cvtColor(image, gray, COLOR_BGR2GRAY);
    
    //Canny(gray, gray, 100, 200);
    
    RNG rng(12345);
    int maxCorners = 25;
    std::vector<Point2f> corners;
    double qualityLevel = 0.01;
    double minDistance = 10;
    int blockSize = 3, gradiantSize = 3;
    bool useHarrisDetector = false;
    double k = 0.04;
    goodFeaturesToTrack(gray,
                        corners,
                        maxCorners,
                        qualityLevel,
                        minDistance,
                        Mat(),
                        blockSize,
                        gradiantSize,
                        useHarrisDetector,
                        k );
    int r = 4;
    for( size_t i = 0; i < corners.size(); i++ )
    { circle(image, corners[i], r, Scalar(rng.uniform(0,255), rng.uniform(0,255), rng.uniform(0,255)), -1, 8, 0 ); }
    
    //cvtColor(gray, image, COLOR_GRAY2BGR);
}
@end
