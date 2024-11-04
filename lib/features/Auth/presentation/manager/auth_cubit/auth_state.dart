part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthAgreeState extends AuthState {}

class ChangeGenderState extends AuthState {}

class ChangeNationState extends AuthState {}

class AuthLoginLoading extends AuthState {}

class AuthLoginFailure extends AuthState {
  final String errMessage;

  AuthLoginFailure(this.errMessage);
}

class AuthLoginSuccess extends AuthState {
  final String phone;
  final String message;

  AuthLoginSuccess(
    this.phone,
    this.message,
  );
}

class AuthRegisterLoading extends AuthState {}

class AuthRegisterFailure extends AuthState {
  final String errMessage;

  AuthRegisterFailure(this.errMessage);
}

class AuthRegisterSuccess extends AuthState {
  final String phone;

  AuthRegisterSuccess(this.phone);
}

class AuthOtpLoading extends AuthState {}

class AuthOtpFailure extends AuthState {
  final String errMessage;

  AuthOtpFailure(this.errMessage);
}

class AuthOtpSuccess extends AuthState {
  final UserModel userModel;

  AuthOtpSuccess(this.userModel);
}

class AuthResendOtpLoading extends AuthState {}

class AuthResendOtpFailure extends AuthState {
  final String errMessage;

  AuthResendOtpFailure(this.errMessage);
}

class AuthResendOtpSuccess extends AuthState {}
