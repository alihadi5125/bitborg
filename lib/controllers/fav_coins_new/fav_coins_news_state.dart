part of 'fav_coins_news_cubit.dart';

@immutable
abstract class FavCoinsNewsState {}

class FavCoinsNewsInitial extends FavCoinsNewsState {}
class FavCoinsNewsLoading extends FavCoinsNewsState {}
class FavCoinsNewsLoaded extends FavCoinsNewsState {}
