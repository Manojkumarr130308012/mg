import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mg/base/base_state.dart';
import 'chat_event.dart';

class ChatBloc extends Bloc<ChatEvent, BaseState> {
  ChatBloc() : super(InitialState());

  @override
  Stream<BaseState> mapEventToState(
    ChatEvent event,
  ) async* {
    if (event is ChatInitialEvent) {
      yield LoadingState();
      yield SuccessState(successResponse: 'success');
    }
  }
}
