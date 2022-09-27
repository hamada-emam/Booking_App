part of 'map_cubit.dart';

@immutable
abstract class MapState {}

class MapInitial extends MapState {}
class MapCreatedState extends MapState {}
class MarkerPressedState extends MapState {}


