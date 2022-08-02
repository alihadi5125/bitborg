part of 'add_to_fav_cubit.dart';

@immutable
abstract class AddToFavState {}

class AddToFavInitial extends AddToFavState {}
class AddToFavLoading extends AddToFavState {}
class AddToFavLoaded extends AddToFavState {}
