part of 'negative_news_cubit.dart';

@immutable
abstract class NegativeNewsState {}

class NegativeNewsInitial extends NegativeNewsState {}
class NegativeNewsLoading extends NegativeNewsState {}
class NegativeNewsLoaded extends NegativeNewsState {}
