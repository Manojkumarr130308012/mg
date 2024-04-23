import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mg/base/base_state.dart';
import 'search_event.dart';

class SearchBloc extends Bloc<SearchEvent, BaseState> {
  SearchBloc() : super(InitialState());

  @override
  Stream<BaseState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is SearchInitialEvent) {
      yield LoadingState();
      yield SuccessState(successResponse: 'success');
    }
  }
}
