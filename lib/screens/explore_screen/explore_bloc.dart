import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mg/base/base_state.dart';
import 'explore_event.dart';
import '../../http/httpurls.dart';
import '../../utils/contants.dart';
import 'package:mg/router.dart';
import 'package:mg/http/api_repository.dart';
import 'package:mg/screens/home/model/PropertiesList.dart';
import 'package:mg/screens/home/model/FavoriteList.dart';

class ExploreBloc extends Bloc<ExploreEvent, BaseState> {
  ExploreBloc() : super(InitialState());

  @override
  Stream<BaseState> mapEventToState(
    ExploreEvent event,
  ) async* {
    if (event is ExploreInitialEvent) {
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

      if (returnableValues['status'] == "success") {
        if (returnableValues is String) {
          response = returnableValues;
        } else {
          response = PropertiesList.fromJson(returnableValues);
        }
        yield SuccessState(successResponse: response);
      } else if (returnableValues?.data['status']! == "error") {
        yield FailureState(errorMessage: returnableValues.data['message']);
      }
    } else if (event is LikeEvent) {
      dynamic response;
      yield LoadingState();
      final dynamic returnableValues = await APIRepository().dynamicRequest(
          HttpUrl.wish_property,
          userArguments: jsonEncode(event.arguments),
          method: ApiRequestMethod.post,
          isBearerTokenNeed: true,
          context: event.context);
      response = Favourite.fromJson(returnableValues);
      yield SuccessState(successResponse: response);
    }
  }
}
