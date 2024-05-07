import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:mg/base/base_state.dart';

import '../../utils/base_equatable.dart';

part 'property_details_event.dart';

class PropertyDetailsBloc extends Bloc<PropertyDetailsEvent, BaseState> {
  PropertyDetailsBloc() : super(InitialState()) {
    on<PropertyDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
