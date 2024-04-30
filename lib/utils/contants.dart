import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ApiRequestMethod { get, put, delete, post, patch }

class Constants {
  static const String getTrack = 'getTrack';
  static const bool success = true;
  static const String propertiesSuccess = 'success';
  static const String basePath =
      'https://brhfiles.s3.ap-south-1.amazonaws.com/';
}

class SharedPrefKeys {
  static const String bearerToken = 'bearerToken';
  static const String isLogin = 'isLogin';
  static const String userName = 'username';
  static const String Id = 'Id';
}

double height = 825.h;
double width = 375.w;
