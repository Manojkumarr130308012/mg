part of 'map_bloc.dart';

@immutable
abstract class MapEvent extends BaseEquatable {}

class MapInitialEvent extends MapEvent {
  BuildContext? context;
  dynamic arguments;

  MapInitialEvent({this.context});
}
