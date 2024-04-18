import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:mg/screens/profile/profile_event.dart';
import '../../base/base_state.dart';

import '../../http/api_repository.dart';
import '../../http/httpurls.dart';
import '../../utils/contants.dart';
import 'model/get_model.dart';

class ProfileBloc extends Bloc<ProfileEvent, BaseState> {
  ProfileBloc() : super(InitialState());

  Profiledata getUserModel = Profiledata();

  @override
  Stream<BaseState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is ProfileInitialEvent) {
      yield LoadingState();
      yield SuccessState(successResponse: 'success');
    }
    // else if (event is GetProfileEvent) {
    //   dynamic response;
    //   print(event.arguments);
    //   final dynamic returnableValues = await APIRepository().dynamicRequest(
    //       "${HttpUrl.getUserProfile}${event.arguments}",
    //       method: ApiRequestMethod.get,
    //       isBearerTokenNeed: true,
    //       context: event.context);
    //
    //   debugPrint('state response $returnableValues');
    //
    //   if (returnableValues is String) {
    //     response = returnableValues;
    //   } else {
    //     debugPrint('state response $returnableValues');
    //     response = Profiledata.fromJson(returnableValues);
    //     getUserModel = response;
    //   }
    //   yield SuccessState(successResponse: getUserModel);
    // }
  }
}
