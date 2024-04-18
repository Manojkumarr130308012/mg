import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mg/base/base_state.dart';
import 'bookings_event.dart';

class BookingsBloc extends Bloc<BookingEvent, BaseState> {
  BookingsBloc() : super(InitialState());

  @override
  Stream<BaseState> mapEventToState(
    BookingEvent event,
  ) async* {
    if (event is BookingsInitialEvent) {
      yield LoadingState();
      yield SuccessState(successResponse: 'success');
    }
  }
}
