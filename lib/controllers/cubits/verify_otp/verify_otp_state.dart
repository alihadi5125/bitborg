part of 'verify_otp_cubit.dart';

@immutable
abstract class VerifyOtpState {}

class VerifyOtpInitial extends VerifyOtpState {}
class VerifyOtpLoading extends VerifyOtpState {}
class VerifyOtpLoaded extends VerifyOtpState {}
