import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mg/base/base_state.dart';
import 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, BaseState> {
  HomeBloc() : super(InitialState());

  @override
  Stream<BaseState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeInitialEvent) {
      yield LoadingState();
      yield SuccessState(successResponse: 'success');
    }
  }
}
