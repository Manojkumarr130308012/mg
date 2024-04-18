import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mg/screens/login_page/model/LoginResponseModel.dart';
import 'package:mg/utils/singleton.dart';
import 'package:mg/base/base_state.dart';
import 'package:mg/screens/home/home_bloc.dart';
import '../../router.dart';
import '../../utils/base_equatable.dart';
import '../../utils/contants.dart';
import '../../utils/preference_helpher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/utils/image_resource.dart';
import 'package:flutter/gestures.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<HomeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop();
          return false;
        },
        child: BlocListener(
          bloc: bloc,
          listener: (BuildContext context, BaseState state) async {},
          child: BlocBuilder(
              bloc: bloc,
              builder: (BuildContext context, BaseState state) {
                if (state is InitialState) {
                  return const Center(
                    child: Text(''),
                  );
                } else if (state is SuccessState) {}
                return ScreenUtilInit(
                    designSize: const Size(393, 852),
                    minTextAdapt: true,
                    splitScreenMode: true,
                    builder: (_, child) {
                      return SafeArea(
                        child: Scaffold(
                          body: Center(
                            child: Text("Home Screen"),
                          ),
                        ),
                      );
                    });
              }),
        ));
  }
}
