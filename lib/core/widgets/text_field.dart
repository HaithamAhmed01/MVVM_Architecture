import 'package:flutter/material.dart';
import 'package:test/core/utils/app_colors.dart';
import 'package:test/core/utils/helper.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.keyboardType,
    this.hint,
    this.maxLines = 1,
    this.suffix,
    this.suffixPressed,
    this.maxLength,
    this.onChange,
    this.onTap,
    this.minLines,
    this.suffixIcon,
    this.isPassword = false,
    this.readOnly = false,
    this.prefix,
    this.prefixIcon,
    this.textInputAction = TextInputAction.next,
    this.focusNode,
  });

  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? hint;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final bool isPassword;
  final bool readOnly;
  final FocusNode? focusNode;
  final VoidCallback? suffixPressed;
  final ValueChanged<String>? onChange;
  final GestureTapCallback? onTap;
  final TextInputAction? textInputAction;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      autofocus: false,
      focusNode: widget.focusNode,
      cursorColor: AppColors.titleLightColor,
      obscureText: widget.isPassword ? obscureText : false,
      readOnly: widget.readOnly,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      maxLength: widget.maxLength,
      minLines: widget.minLines,
      onTap: widget.onTap,
      onChanged: widget.onChange,
      textInputAction: widget.textInputAction,
      autofillHints: const [
        AutofillHints.email,
        AutofillHints.telephoneNumber,
        AutofillHints.password,
        AutofillHints.name,
        AutofillHints.addressCity,
      ],
      //style: Theme.of(context).textTheme.labelSmall,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      style: context.titleLarge(),
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
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.whiteColor),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.whiteColor),
        ),
      ),
    );
  }
}
