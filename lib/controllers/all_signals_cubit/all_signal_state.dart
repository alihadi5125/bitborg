part of 'all_signal_cubit.dart';

@immutable
abstract class AllSignalState {}

class AllSignalInitial extends AllSignalState {}
class AllSignalLoading extends AllSignalState {}
class AllSignalLoaded extends AllSignalState {}
