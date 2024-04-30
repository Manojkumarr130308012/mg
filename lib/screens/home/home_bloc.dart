import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mg/base/base_state.dart';
import 'home_event.dart';
import '../../http/httpurls.dart';
import '../../utils/contants.dart';
import 'package:mg/router.dart';
import 'package:mg/http/api_repository.dart';
import 'package:mg/screens/home/model/PropertiesList.dart';
import 'package:mg/screens/home/model/AmenitiesList.dart';

class HomeBloc extends Bloc<HomeEvent, BaseState> {
  HomeBloc() : super(InitialState());

  @override
  Stream<BaseState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeInitialEvent) {
      yield LoadingState();
      yield SuccessState(successResponse: 'success');
    } else if (event is PropertyListEvent) {
      dynamic response;
      yield LoadingState();
      final dynamic returnableValues = await APIRepository().dynamicRequest(
          HttpUrl.property_list,
          userArguments: jsonEncode(event.arguments),
          method: ApiRequestMethod.post,
          isBearerTokenNeed: true,
          context: event.context);
      response = PropertiesList.fromJson(returnableValues);
      yield SuccessState(successResponse: response);
    } else if (event is AmenitiesListEvent) {
      dynamic response;
      yield LoadingState();
      final dynamic returnableValues = await APIRepository().dynamicRequest(
          HttpUrl.amenities_list,
          method: ApiRequestMethod.get,
          isBearerTokenNeed: true,
          context: event.context);
      response = AmenitiesList.fromJson(returnableValues);
      yield SuccessState(successResponse: response);
    }
  }
}
