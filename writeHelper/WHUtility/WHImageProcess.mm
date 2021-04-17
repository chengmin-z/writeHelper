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

+ (UIImage *)reduceNoiseImage:(UIImage *)image
{
    Mat mat_image;
    UIImageToMat(image, mat_image);
    Mat mat_image_dst;
    medianBlur(mat_image, mat_image_dst, 3);
    return MatToUIImage(mat_image_dst);
}

+ (UIImage *)thresholdImage:(UIImage *)image
{
    Mat mat_image;
    UIImageToMat(image, mat_image);
    Mat mat_mid;
    cvtColor(mat_image, mat_mid, COLOR_BGRA2GRAY);
    Mat mat_image_dst;
    threshold(mat_mid, mat_image_dst, 0, 255, THRESH_OTSU);
    return MatToUIImage(mat_image_dst);
}

+ (UIImage *)makeTransparent:(UIImage *)image
{
    Mat mat_image;
    UIImageToMat(image, mat_image);
    Mat mat_final;
    cvtColor(mat_image, mat_final, COLOR_GRAY2BGRA);
    for(int y = 0; y < mat_final.rows; ++y) {
        for(int x =0; x < mat_final.cols; ++x) {
            Vec4b & pixel = mat_final.at<Vec4b>(y, x);
            if(pixel[0] == 255 && pixel[1] == 255 && pixel[2] == 255) {
                pixel[3] = 0;
            }
        }
    }
    return MatToUIImage(mat_final);
}

+ (UIImage *)makeTransparentImage:(UIImage *)image AndToR:(NSInteger)r G:(NSInteger)g B:(NSInteger)b
{
    Mat mat_image;
    UIImageToMat(image, mat_image);
    Mat mat_final;
    cvtColor(mat_image, mat_final, COLOR_GRAY2BGRA);
    for(int y = 0; y < mat_final.rows; ++y) {
        for(int x =0; x < mat_final.cols; ++x) {
            Vec4b & pixel = mat_final.at<Vec4b>(y, x);
            if(pixel[0] + pixel[1] + pixel[2] > 700) {
                pixel[3] = 0;
            } else {
                pixel[0] = r;
                pixel[1] = g;
                pixel[2] = b;
            }
        }
    }
    return MatToUIImage(mat_final);
}

@end
