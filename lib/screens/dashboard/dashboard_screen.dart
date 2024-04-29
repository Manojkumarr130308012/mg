import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/base/base_state.dart';
import 'package:mg/screens/bookings/bookings_bloc.dart';
import 'package:mg/screens/bookings/bookings_event.dart';
import 'package:mg/screens/bookings/bookings_screen.dart';
import 'package:mg/screens/chat/chat_bloc.dart';
import 'package:mg/screens/chat/chat_event.dart';
import 'package:mg/screens/chat/chat_screen.dart';
import 'package:mg/screens/dashboard/dashboard_bloc.dart';
import 'package:mg/screens/favorites/favorites_bloc.dart';
import 'package:mg/screens/favorites/favorites_event.dart';
import 'package:mg/screens/favorites/favorites_screen.dart';
import 'package:mg/screens/home/home_bloc.dart';
import 'package:mg/screens/home/home_event.dart';
import 'package:mg/screens/profile/profile_bloc.dart';
import 'package:mg/screens/profile/profile_event.dart';
import 'package:mg/screens/profile/profile_screen.dart';
import 'package:mg/utils/color_resources.dart';

import '../home/home_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  late DashboardBloc bloc;

  int pageIndex = 0;

  static final List<Widget> pages = <Widget>[
    BlocProvider(
        create: (BuildContext context) => HomeBloc()
          ..add(HomeInitialEvent(
            context: context,
          )),
        child: const HomeScreen()),
    BlocProvider(
        create: (BuildContext context) => FavoritesBloc()
          ..add(FavoritesInitialEvent(
            context: context,
          )),
        child: const FavoritesScreen()),
    BlocProvider(
        create: (BuildContext context) => BookingsBloc()
          ..add(BookingsInitialEvent(
            context: context,
          )),
        child: const BookingScreen()),
    BlocProvider(
        create: (BuildContext context) => ChatBloc()
          ..add(ChatInitialEvent(
            context: context,
          )),
        child: const ChatScreen()),
    BlocProvider(
        create: (BuildContext context) => ProfileBloc()
          ..add(ProfileInitialEvent(
            context: context,
          )),
        child: const ProfileScreen()),
  ];

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<DashboardBloc>(context);
  }

  void _onItemTapped(int index) {
    setState(() {
      pageIndex = index;
    });
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
                          child: pages.elementAt(pageIndex),
                        ),
                        bottomNavigationBar: BottomNavigationBar(
                            items: const <BottomNavigationBarItem>[
                              BottomNavigationBarItem(
                                  icon: Icon(Icons.home),
                                  label: 'Home',
                                  backgroundColor: Colors.white),
                              BottomNavigationBarItem(
                                  icon: Icon(Icons.favorite),
                                  label: 'Favorites',
                                  backgroundColor: Colors.white),
                              BottomNavigationBarItem(
                                icon: Icon(Icons.calendar_month),
                                label: 'Bookings',
                                backgroundColor: Colors.white,
                              ),
                              BottomNavigationBarItem(
                                icon: Icon(Icons.message_outlined),
                                label: 'Chat',
                                backgroundColor: Colors.white,
                              ),
                              BottomNavigationBarItem(
                                icon: Icon(Icons.account_circle_outlined),
                                label: 'Profile',
                                backgroundColor: Colors.white,
                              ),
                            ],
                            type: BottomNavigationBarType.fixed,
                            currentIndex: pageIndex,
                            selectedItemColor: ColorResource.primaryColor,
                            unselectedItemColor: ColorResource.lightGrey,
                            iconSize: 24,
                            onTap: _onItemTapped,
                            elevation: 5),
                      ));
                    });
              }),
        ));
  }
}
