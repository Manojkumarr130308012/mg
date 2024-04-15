import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mg/base/base_state.dart';
import '../../http/api_repository.dart';
import '../../http/httpurls.dart';
import '../../utils/contants.dart';
import 'model/LoginResponseModel.dart';
import 'login_event.dart';
import 'package:mg/router.dart';

class LoginBloc extends Bloc<LoginEvent, BaseState> {
  LoginBloc() : super(InitialState());

  @override
  Stream<BaseState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginInitialEvent) {
      yield LoadingState();
      yield SuccessState(successResponse: 'success');
    } else if (event is LoginUserEvent) {
      dynamic response;
      yield LoadingState();
      print(event.arguments);
      final dynamic returnableValues = await APIRepository().dynamicRequest(
          HttpUrl.login,
          userArguments: jsonEncode(event.arguments),
          method: ApiRequestMethod.post,
          isBearerTokenNeed: false,
          context: event.context);

      response = LoginResponse.fromJson(returnableValues);

      yield SuccessState(successResponse: response);
    }
  }
}
