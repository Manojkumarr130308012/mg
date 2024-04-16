import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';
import 'package:mg/utils/color_resources.dart';

/// The app's themes.
/// This class is just there to connect readable names
/// to integer theme IDs.
class AppThemes {
  static const int darkBlue = 0;
  static const int lightOrange = 1;

  ThemeCollection getThemeCollections() {
    final ThemeData base = ThemeData.light();
    final ButtonThemeData darkButtonTheme =
        base.buttonTheme.copyWith(buttonColor: ColorResource.primaryColor);
    final FloatingActionButtonThemeData darkFABTheme =
        base.floatingActionButtonTheme;
    return ThemeCollection(themes: {
      AppThemes.darkBlue: ThemeData(
          primarySwatch: const MaterialColor(
            0xff020E36,
            <int, Color>{
              50: Color(0xff020E36),
              100: Color(0xff020E36),
              200: Color(0xff020E36),
              300: Color(0xff020E36),
              400: Color(0xff020E36),
              500: Color(0xff020E36),
              600: Color(0xff020E36),
              700: Color(0xff020E36),
              800: Color(0xff020E36),
              900: Color(0xff020E36),
            },
          ),
          backgroundColor: ColorResource.darkBlue,
          buttonTheme: darkButtonTheme,
          primaryColor: ColorResource.red,
          textTheme: AppThemes().basicTextTheme(base.textTheme),
          floatingActionButtonTheme: darkFABTheme.copyWith(
              backgroundColor: ColorResource.primaryColor)),
      AppThemes.lightOrange: ThemeData(
          primarySwatch: const MaterialColor(
            0xffFDF3E6,
            <int, Color>{
              50: Color(0xffFDF3E6),
              100: Color(0xffFDF3E6),
              200: Color(0xffFDF3E6),
              300: Color(0xffFDF3E6),
              400: Color(0xffFDF3E6),
              500: Color(0xffFDF3E6),
              600: Color(0xffFDF3E6),
              700: Color(0xffFDF3E6),
              800: Color(0xffFDF3E6),
              900: Color(0xffFDF3E6),
            },
          ),
          buttonTheme: darkButtonTheme,
          textTheme: AppThemes().basicTextTheme(base.textTheme),
          floatingActionButtonTheme:
              darkFABTheme.copyWith(backgroundColor: Colors.white)),
    });
  }

  static String toStr(int themeId) {
    switch (themeId) {
      case darkBlue:
        return 'Dark Blue';
      case lightOrange:
        return 'Light Orange';

      default:
        return 'Unknown';
    }
  }

  TextTheme basicTextTheme(TextTheme base) {
    return base.copyWith(
      //Used for font size of 6
      caption: base.caption!.copyWith(
          fontFamily: 'Poppins-Regular',
          fontSize: 6.0,
          color: Colors.white,
          fontWeight: FontWeight.w400),

      //Used for font size of 12//subTitle
      subtitle1: base.subtitle1!.copyWith(
          fontFamily: 'Poppins-Regular',
          fontSize: 14,
          color: ColorResource.lightGrey,
          fontWeight: FontWeight.w700),

      subtitle2: base.subtitle2!.copyWith(
          fontFamily: 'Poppins-Regular',
          fontSize: 13.0,
          color: ColorResource.lightGrey,
          fontWeight: FontWeight.w300),

      //Used for font size of 14,16//labelText
      bodyText2: base.bodyText2!.copyWith(
        fontFamily: 'Poppins-Regular',
        fontSize: 14.0,
        color: ColorResource.lightGrey,
      ),

      //Used for emphasizing text and font size of 18,20,22//hintText
      bodyText1: base.bodyText1!.copyWith(
          fontFamily: 'Poppins-Regular',
          fontSize: 14.0,
          color: ColorResource.lightGrey),

      //Used for large text in dialogs and font size of 24
      headline1: base.headline1!.copyWith(
          fontFamily: 'Poppins-Medium',
          fontSize: 22.0,
          color: ColorResource.grey,
          fontWeight: FontWeight.bold),

      //Used for the primary text in app bars and font size of 26,28 and greater
      headline2: base.headline2!.copyWith(
          fontFamily: 'Poppins-Medium',
          fontSize: 18.0,
          color: ColorResource.grey,
          fontWeight: FontWeight.w700),

      //used for button  //Title
      headline3: base.headline3!.copyWith(
        fontFamily: 'Poppins-Medium',
        fontSize: 16.0,
        color: ColorResource.grey,
        fontWeight: FontWeight.w600,
      ),

      button: base.button!.copyWith(
        fontFamily: 'Poppins-Regular',
        fontSize: 16.0,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
