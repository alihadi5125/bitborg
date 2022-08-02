part of 'neutral_news_cubit.dart';

@immutable
abstract class NeutralNewsState {}

class NeutralNewsInitial extends NeutralNewsState {}
class NeutralNewsLoading extends NeutralNewsState {}
class NeutralNewsLoaded extends NeutralNewsState {}
