part of 'future_signal_cubit.dart';

@immutable
abstract class FutureSignalState {}

class FutureSignalInitial extends FutureSignalState {}
class FutureSignalLoading extends FutureSignalState {}
class FutureSignalLoaded extends FutureSignalState {}
