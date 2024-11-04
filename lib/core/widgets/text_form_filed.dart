import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/core/utils/app_colors.dart';
import 'package:test/core/utils/helper.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.keyboardType,
    this.hint,
    this.onSave,
    this.maxLines = 1,
    this.suffix,
    this.suffixPressed,
    this.maxLength,
    this.onSubmit,
    this.onChange,
    this.onTap,
    this.minLines,
    this.validation,
    this.suffixIcon,
    this.isPassword = false,
    this.readOnly = false,
    this.prefix,
    this.prefixIcon,
    this.textInputAction = TextInputAction.next,
    this.focusNode,
    this.inputFormatters,
  });

  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? hint;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;
  final String? Function(String?)? validation;
  final String? Function(String?)? onSave;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final bool isPassword;
  final bool readOnly;
  final FocusNode? focusNode;
  final VoidCallback? suffixPressed;
  final ValueChanged<String>? onSubmit;
  final ValueChanged<String>? onChange;
  final GestureTapCallback? onTap;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      autofocus: false,
      focusNode: widget.focusNode,
      cursorColor: AppColors.titleLightColor,
      validator: widget.validation,
      obscureText: widget.isPassword ? obscureText : false,
      readOnly: widget.readOnly,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      maxLength: widget.maxLength,
      minLines: widget.minLines,
      onTap: widget.onTap,
      onSaved: widget.onSave,
      onFieldSubmitted: widget.onSubmit,
      onChanged: widget.onChange,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: widget.textInputAction,
      inputFormatters: widget.inputFormatters,
      autofillHints: const [
        AutofillHints.email,
        AutofillHints.telephoneNumber,
        AutofillHints.password,
        AutofillHints.name,
        AutofillHints.addressCity,
      ],
      //style: Theme.of(context).textTheme.labelSmall,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      style: context.bodyMedium().copyWith(
            color: AppColors.titleLightColor,
          ),
      decoration: InputDecoration(
        hintText: widget.hint,
        prefix: widget.prefix,
        prefixIcon: widget.prefixIcon,
        suffix: widget.suffix,
        suffixIcon: widget.isPassword
            ? InkWell(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: Icon(
                  obscureText
                      ? Icons.remove_red_eye_outlined
                      : Icons.visibility_off_outlined,
                  color: AppColors.primaryColor,
                  size: 18,
                ),
              )
            : widget.suffixIcon,
        counter: const Offstage(),
      ),
    );
  }
}
