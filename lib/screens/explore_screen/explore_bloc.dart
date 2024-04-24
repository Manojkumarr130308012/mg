import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mg/base/base_state.dart';
import 'explore_event.dart';

class ExploreBloc extends Bloc<ExploreEvent, BaseState> {
  ExploreBloc() : super(InitialState());

  @override
  Stream<BaseState> mapEventToState(
    ExploreEvent event,
  ) async* {
    if (event is ExploreInitialEvent) {
      yield LoadingState();
      yield SuccessState(successResponse: 'success');
    }
  }
}
