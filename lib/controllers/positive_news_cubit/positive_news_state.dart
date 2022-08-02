part of 'positive_news_cubit.dart';

@immutable
abstract class PositiveNewsState {}

class PositiveNewsInitial extends PositiveNewsState {}
class PositiveNewsLoading extends PositiveNewsState {}
class PositiveNewsLoaded extends PositiveNewsState {}
