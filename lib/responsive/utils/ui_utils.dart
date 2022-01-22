import 'package:flutter/widgets.dart';
import 'package:onlineShopUIKit/responsive/enums/device_screen_type.dart';

DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
  double deviceWidth = mediaQuery.size.shortestSide;

  if (deviceWidth > 950) {
    return DeviceScreenType.Desktop;
  }

  if (deviceWidth > 500) {
    return DeviceScreenType.Tablet;
  }

  return DeviceScreenType.Mobile;
}
