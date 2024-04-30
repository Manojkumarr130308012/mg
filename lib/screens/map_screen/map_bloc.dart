import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:mg/base/base_state.dart';

import '../../utils/base_equatable.dart';

part 'map_event.dart';

class MapBloc extends Bloc<MapEvent, BaseState> {
  MapBloc() : super(InitialState()) {
    on<MapEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
