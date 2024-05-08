import 'dart:convert';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:mg/base/base_state.dart';
import '../../utils/base_equatable.dart';
import '../../http/httpurls.dart';
import '../../utils/contants.dart';
import 'package:mg/router.dart';
import 'package:mg/http/api_repository.dart';
import 'package:mg/screens/property_details_screen/model/propertyDetailsInfo.dart';
import 'property_details_event.dart';

class PropertyDetailsBloc extends Bloc<PropertyDetailsEvent, BaseState> {
  PropertyDetailsBloc() : super(InitialState());

  @override
  Stream<BaseState> mapEventToState(
    PropertyDetailsEvent event,
  ) async* {
    if (event is PropertyDetailsInitialEvent) {
      yield LoadingState();
      yield SuccessState(successResponse: 'success');
    } else if (event is PropertyInfoEvent) {
      dynamic response;
      yield LoadingState();
      final dynamic returnableValues = await APIRepository().dynamicRequest(
          HttpUrl.meeting_property_info,
          userArguments: jsonEncode(event.arguments),
          method: ApiRequestMethod.post,
          isBearerTokenNeed: true,
          context: event.context);

      if (returnableValues['status'] == "success") {
        if (returnableValues is String) {
          response = returnableValues;
        } else {
          response = PropertyDetailsInfo.fromJson(returnableValues);
        }
        yield SuccessState(successResponse: response);
      } else if (returnableValues?.data['status']! == "error") {
        yield FailureState(errorMessage: returnableValues.data['message']);
      }
    }
  }
}
