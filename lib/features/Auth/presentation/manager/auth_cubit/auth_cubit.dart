import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:test/features/Auth/data/models/user_model/user_model.dart';
import 'package:test/features/Auth/data/repo/auth_repo.dart';

import '../../../../../core/utils/constants.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  AuthRepo authRepo;

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);

  bool agree = false;

  void agreeBox() {
    agree = !agree;
    emit(AuthAgreeState());
  }

  int? gender;

  void changeGenderType(int index) {
    gender = index;
    emit(ChangeGenderState());
  }

  Future<void> login({required String phone}) async {
    emit(AuthLoginLoading());
    var result = await authRepo.login(phone: phone);
    result.fold(
      (failure) {
        emit(AuthLoginFailure(failure.message));
      },
      (s) {
        emit(AuthLoginSuccess(phone, s));
      },
    );
  }

  Future<void> register({
    required String phone,
    required String email,
    required String name,
  }) async {
    emit(AuthRegisterLoading());
    var result = await authRepo.register(
      phone: phone,
      email: email,
      name: name,
    );
    result.fold(
      (failure) {
        emit(AuthRegisterFailure(failure.message));
      },
      (s) {
        emit(AuthRegisterSuccess(phone));
      },
    );
  }

  Future<void> otp({
    required String otp,
    required String phone,
  }) async {
    emit(AuthOtpLoading());
    FirebaseMessaging.instance.getToken().then((value) async {
      Constants.tokenFirBase = value;
      log('TokenFirBase is :  ${Constants.tokenFirBase}');
    });
    var result = await authRepo.otp(
      otp: otp,
      phone: phone,
    );
    result.fold(
      (failure) {
        emit(AuthOtpFailure(failure.message));
      },
      (user) {
        emit(AuthOtpSuccess(user));
      },
    );
  }

  Future<void> resendOtp({required String phone}) async {
    emit(AuthResendOtpLoading());
    var result = await authRepo.resendOtp(phone: phone);
    result.fold(
      (failure) {
        emit(AuthResendOtpFailure(failure.message));
      },
      (s) {
        emit(AuthResendOtpSuccess());
      },
    );
  }
}
