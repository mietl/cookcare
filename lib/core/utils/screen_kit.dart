import 'dart:ui';

import 'package:flutter/material.dart';


class ScreenKit{
  static late final screenWidth;
  static late final screenHeight;
  static late final devicePixelRatio;

  static late final physicalWidth;
  static late final physicalHeight;

  static late final statusHeight;

  static late final rpx;
  static late final px;

  static void init(BuildContext context,{ double referSize=750 }){
    // 获取逻辑分辨率
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight =  MediaQuery.of(context).size.height;

   devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    // 获取物理分辨率
    physicalWidth = screenWidth * devicePixelRatio;
    physicalHeight = screenHeight * devicePixelRatio;


    statusHeight = MediaQuery.of(context).padding.top;

    // 一份占多少
    //  计算 rpx 的大小
    rpx = screenWidth / referSize;
    px =  screenWidth / referSize * 2;
  }

  static double setRpx(double size){
    return size * rpx;
  }

  // 如果设计稿是 px，自动算 rpx;
  static double setPx(double size){
    return size * px;
  }
}