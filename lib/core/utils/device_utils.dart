import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
class DeviceUtils {
  static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  static Future<String> getDeviceId() async {
    try {
      if (kIsWeb) {
        final webInfo = await _deviceInfo.webBrowserInfo;
        // Use userAgent or vendor as a fallback ID for web
        return webInfo.userAgent ?? 'web_user';
      }
      if (Platform.isAndroid) {
        final AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
        return androidInfo.id; 
      } else if (Platform.isIOS) {
        final IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
        return iosInfo.identifierForVendor ?? 'unknown_ios_id';
      }else if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
        return 'desktop_user_id';
      }
    } catch (e) {
      return 'unknown_device';
    }
    return 'unsupported_platform';
  }
}