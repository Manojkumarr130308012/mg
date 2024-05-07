part of 'property_details_bloc.dart';

@immutable
abstract class PropertyDetailsEvent extends BaseEquatable {}

class ProperttDetailsInitialEvent extends PropertyDetailsEvent {
  BuildContext? context;
  dynamic arguments;

  ProperttDetailsInitialEvent({this.context});
}
