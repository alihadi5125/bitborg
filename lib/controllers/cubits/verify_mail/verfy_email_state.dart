part of 'verfy_email_cubit.dart';

@immutable
abstract class VerfyEmailState {}

class VerfyEmailInitial extends VerfyEmailState {}
class VerfyEmailLoaded extends VerfyEmailState {}
class VerfyEmailLoading extends VerfyEmailState {}
class VerfyEmailError extends VerfyEmailState {}
