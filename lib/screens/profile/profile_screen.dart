import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/screens/profile/profile_bloc.dart';

import '../../base/base_state.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<ProfileBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light));
    return BlocListener(
      bloc: bloc,
      listener: (BuildContext context, BaseState state) async {
        if (state is SuccessState) {
          // if (state.successResponse is Profiledata) {
          //   final Profiledata response = state.successResponse;
          //   print('******** SUCCESS **********');
          //   print(response);
          // }
        }
      },
      child: BlocBuilder(
          bloc: bloc,
          builder: (BuildContext context, BaseState state) {
            if (state is LoadingState) {
              return CircularProgressIndicator();
            } else if (state is FailureState) {
              return Text('Failure');
            }
            return ScreenUtilInit(
                designSize: const Size(393, 852),
                minTextAdapt: true,
                splitScreenMode: true,
                builder: (_, child) {
                  return SafeArea(
                    child: Scaffold(
                      body: Center(
                        child: Text("Profile Screen"),
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
