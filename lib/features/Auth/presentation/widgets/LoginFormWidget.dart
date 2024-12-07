import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test/core/utils/helper.dart';
import '../../../../config/routes/app_rout.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/app_values.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/function/ArabicToEnglishNumberFormatter.dart';
import '../../../../core/utils/function/error_snack_bar.dart';
import '../../../../core/utils/function/successful_snack_bar.dart';
import '../../../../core/widgets/buildLoadingDialog.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/text_form_filed.dart';
import '../manager/auth_cubit/auth_cubit.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({
    super.key,
  });

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoginLoading) {
          buildLoadingDialog(context);
        }
        if (state is AuthLoginFailure) {
          if (state.errMessage.contains('422')) {
            context.pop();
            errorSnackBar(context, state.errMessage);
            context.push(
              AppRouts.signUpScreen,
              extra: phoneController.text,
            );
          } else {
            context.pop();
            errorSnackBar(context, state.errMessage);
          }
        }
        if (state is AuthLoginSuccess) {
          context.pop();
          if (state.phone == '563452612') {
            successfulSnackBar(
              context,
              'For testing purpose, this is your OTP code 5555',
              duration: 6,
            );
          }
          context.push(AppRouts.otbScreen, extra: state.phone);
        }
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.textTr(AppStrings.enterMobile),
                style: context.bodyLarge().copyWith(
                      color: AppColors.blackColor,
                    ),
              ),
              AppSize.s8.height,
              Directionality(
                textDirection: TextDirection.ltr,
                child: CustomTextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                  maxLength: 9,
                  hint: '5xxxxxxxxx',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      '+966',
                      style: context.bodyMedium(),
                    ),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('^(5)([0-9]*)\$')),
                    ArabicToEnglishNumberFormatter(),
                  ],
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return context.textTr(AppStrings.fieldRequired);
                    }
                    if (value.length < 9) {
                      return context.textTr(AppStrings.invalidNum);
                    }
                    return null;
                  },
                  onSubmit: (value) {
                    if (formKey.currentState!.validate()) {
                      cubit.login(phone: phoneController.text);
                    }
                  },
                ),
              ),
              AppSize.s30.height,
              CustomButton(
                text: context.textTr(AppStrings.login),
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    cubit.login(phone: phoneController.text);
                  }
                },
              ),
              AppSize.s30.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.textTr(AppStrings.notHaveAccount),
                    style: context.bodyLarge(),
                  ),
                  5.width,
                  GestureDetector(
                    onTap: () {
                      if (Constants.guest == true) {
                        context.push(
                          AppRouts.signUpScreen,
                          extra: '',
                        );
                      } else {
                        context.push(
                          AppRouts.signUpScreen,
                          extra: '',
                        );
                      }
                    },
                    child: Text(
                      context.textTr(AppStrings.signUp),
                      style: context.bodyLarge().copyWith(
                            color: AppColors.secondaryColor4,
                            fontWeight: AppFontWeight.bold,
                            decorationColor: AppColors.secondaryColor4,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ),
                ],
              ),
              AppSize.s30.height,
              Center(
                child: GestureDetector(
                  onTap: () {
                    Constants.guest = true;
                    context.push(AppRouts.layoutScreen);
                  },
                  child: Text(
                    context.textTr(AppStrings.guest),
                    style: context.bodyLarge().copyWith(
                          fontWeight: AppFontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
