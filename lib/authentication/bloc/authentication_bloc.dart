import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:mg/http/api_repository.dart';
import 'package:mg/http/httpurls.dart';
import 'package:mg/utils/base_equatable.dart';
import 'package:mg/utils/contants.dart';
import 'package:mg/utils/preference_helpher.dart';
import 'package:mg/utils/singleton.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationUnInitialized());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStarted) {
      // dynamic returnableValues = await APIRepository().dynamicRequest(
      //     HttpUrl.errorJson,
      //     method: ApiRequestMethod.get,
      //     context: event.context);
      // AidivaFlashSingleton.instance.errorMapValues =
      //     returnableValues as Map<String, dynamic>?;
      int userId = await PreferenceHelper.getId();

      FlashSingleton.instance.id = userId;
      bool mpinStatus = await PreferenceHelper.getLoginStatus();
      if (mpinStatus) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnAuthenticated();
      }
    }

    if (event is LoggedOut) {
      yield AuthenticationAuthenticated();
    }
  }
}
