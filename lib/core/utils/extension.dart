import './screen_kit.dart';

extension screenValue on num {
  double get px => ScreenKit.px * this;
  double get rpx => ScreenKit.rpx * this;
}
