//
//  WHImageProcess.m
//  易书
//
//  Created by 张成敏 on 2021/4/6.
//

#import "WHImageProcess.h"

#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>

@implementation WHImageProcess

using namespace cv;

+ (UIImage *)imageToGrayImage:(UIImage *)image
{
    Mat mat_image;
    UIImageToMat(image, mat_image);
    Mat mat_image_dst;
    cvtColor(mat_image, mat_image_dst, COLOR_BGRA2GRAY);
    cvtColor(mat_image_dst, mat_image, COLOR_GRAY2BGR);
    return MatToUIImage(mat_image);
}

@end
