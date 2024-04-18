import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mg/base/base_state.dart';
import 'favorites_event.dart';

class FavoritesBloc extends Bloc<FavoriteEvent, BaseState> {
  FavoritesBloc() : super(InitialState());

  @override
  Stream<BaseState> mapEventToState(
    FavoriteEvent event,
  ) async* {
    if (event is FavoritesInitialEvent) {
      yield LoadingState();
      yield SuccessState(successResponse: 'success');
    }
  }
}
