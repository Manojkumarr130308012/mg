import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mg/screens/profile/profile_bloc.dart';
import 'package:mg/screens/profile/profile_event.dart';
import '../../base/base_state.dart';
import '../../utils/preference_helpher.dart';
import '../../utils/singleton.dart';
import 'model/get_model.dart';

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
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Color(0xff090a5f1),
                  title: const Center(
                    child: Text(
                      "Profile",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                backgroundColor: Color(0xff090a5f1),
                body: ListView(
                  children: [
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color(0xff051609b),
                                Color(0xff051609b).withOpacity(0.5)
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              stops: [0.5, 0.9])),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                backgroundColor: Color(0xff090a5f1),
                                minRadius: 35,
                                child: Icon(
                                  Icons.call,
                                  size: 30,
                                ),
                              ),
                              CircleAvatar(
                                backgroundColor: Color(0xff090a5f1),
                                minRadius: 60,
                                child: CircleAvatar(
                                  child: Text(
                                    "N",
                                    style: TextStyle(fontSize: 50),
                                  ),
                                  radius: 50,
                                ),
                              ),
                              CircleAvatar(
                                backgroundColor: Color(0xff090a5f1),
                                minRadius: 35,
                                child: Icon(
                                  Icons.message,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Nemo",
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "mobile developer",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                "Email",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                "Mac@mail.com",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Divider(),
                            ListTile(
                              title: Text(
                                "GitHub",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                "Mac@github.com",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Divider(),
                            ListTile(
                              title: Text(
                                "Phone",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                "9876543212",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Divider(),
                            ListTile(
                              title: Text(
                                "Gender",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                "Male",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Divider(),
                            ListTile(
                              title: Text(
                                "City",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                "Coimbatore",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Divider(),
                            ListTile(
                              title: Text(
                                "State",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                "Tamil Nadu",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
