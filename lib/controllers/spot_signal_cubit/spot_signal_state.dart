part of 'spot_signal_cubit.dart';

@immutable
abstract class SpotSignalState {}

class SpotSignalInitial extends SpotSignalState {}
class SpotSignalLoading extends SpotSignalState {}
class SpotSignalLoaded extends SpotSignalState {}
