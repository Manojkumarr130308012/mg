import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mg/authentication/bloc/authentication_bloc.dart';
import 'package:mg/screens/login_page/login_bloc.dart';
import 'package:mg/screens/login_page/login_event.dart';
import 'package:mg/screens/login_page/login_screen.dart';
import 'package:mg/screens/page_inprogress.dart';
import 'package:mg/screens/profile_settings/profile_bloc.dart';
import 'package:mg/screens/profile_settings/profile_event.dart';
import 'package:mg/screens/profile_settings/profile_screen.dart';
import 'package:mg/screens/signup_screen/signup_bloc.dart';
import 'package:mg/screens/signup_screen/signup_event.dart';
import 'package:mg/screens/signup_screen/signup_screen.dart';

class AppRoutes {
  static const String splashScreen = 'splash_screen';
  static const String loginScreen = 'login_screen';
  static const String profilePage = 'profile_page';
  static const String signUpScreen = 'signup_screen';
  static const String signUpSuccessScreen = 'signup_success_screen';
}

Route<dynamic> getRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginScreen:
      return _buildSignUpScreen();
    case AppRoutes.profilePage:
      return _buildProfilePage();
  }
  return _buildInProgressScreen();
}

Route<dynamic> _buildLoginScreen() {
  return MaterialPageRoute(
    builder: (BuildContext context) =>
        addAuthBloc(context, PageBuilder.buildLoginScreen()),
  );
}

Route<dynamic> _buildInProgressScreen() {
  return MaterialPageRoute(
    builder: (BuildContext context) =>
        addAuthBloc(context, PageBuilder.buildInProgressScreen()),
  );
}

Route<dynamic> _buildProfilePage() {
  return MaterialPageRoute(
    builder: (BuildContext context) => PageBuilder.buildProfilePage(),
  );
}

Route<dynamic> _buildSignUpScreen() {
  return MaterialPageRoute(
    builder: (BuildContext context) => PageBuilder.buildSignUpScreen(),
  );
}

Route<dynamic> _buildSignUpSuccessScreen() {
  return MaterialPageRoute(
    builder: (BuildContext context) => PageBuilder.buildSignUpSuccessScreen(),
  );
}

class PageBuilder {
  static Widget buildInProgressScreen() {
    return BlocProvider(
      create: (BuildContext context) =>
          BlocProvider.of<AuthenticationBloc>(context),
      child: const InProgressScreen(),
    );
  }

  static Widget buildLoginScreen() {
    return BlocProvider(
      create: (BuildContext context) =>
          LoginBloc()..add(LoginInitialEvent(context: context)),
      child: const LoginScreen(),
    );
  }

  static Widget buildProfilePage() {
    return BlocProvider(
      create: (BuildContext context) =>
          ProfileBloc()..add(ProfileInitialEvent(context: context)),
      child: const ProfileScreen(),
    );
  }

  static Widget buildSignUpScreen() {
    return BlocProvider(
      create: (BuildContext context) =>
          SignUpBloc()..add(SignUpInitialEvent(context: context)),
      child: const SignUpScreen(),
    );
  }

  static Widget buildSignUpSuccessScreen() {
    return BlocProvider(
      create: (BuildContext context) =>
          SignUpBloc()..add(SignUpInitialEvent(context: context)),
      child: const SignUpScreen(),
    );
  }
}

Widget addAuthBloc(BuildContext context, Widget widget) {
  print('========= add Auth data=======');
  return BlocListener(
    bloc: BlocProvider.of<AuthenticationBloc>(context),
    listener: (BuildContext context, Object? state) async {
      if (state is AuthenticationUnAuthenticated) {
        while (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
        await Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
      }

      if (state is AuthenticationAuthenticated) {
        while (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
        await Navigator.pushReplacementNamed(context, AppRoutes.profilePage);
      }

      // if (state is AuthenticationAuthenticated) {
      //   while (Navigator.canPop(context)) {
      //     Navigator.pop(context);
      //   }
      // }
    },
    child: BlocBuilder(
      bloc: BlocProvider.of<AuthenticationBloc>(context),
      builder: (BuildContext context, Object? state) {
        return widget;
      },
    ),
  );
}
