import 'package:flutter/material.dart';
import 'package:test/core/utils/app_colors.dart';
import 'package:test/core/utils/helper.dart';

import '../utils/app_values.dart';

class CustomButton extends StatefulWidget {
  final Color? color;
  final Color? colorText;
  final String text;
  final double? borderRadius;
  final double? width;
  final double? height;
  final double? height2;
  final double? width2;

  final double? fontSize;
  final VoidCallback onTap;
  final Widget? icon;
  final bool iconLeft;

  const CustomButton({
    super.key,
    required this.text,
    this.color,
    this.colorText,
    required this.onTap,
    this.borderRadius,
    this.width,
    this.width2,
    this.fontSize,
    this.icon,
    this.iconLeft = false,
    this.height,
    this.height2,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? context.width,
      height: widget.height ?? context.height * .07,
      child: Column(
        children: [
          GestureDetector(
            onTap: widget.onTap,
            onTapDown: (_) {
              setState(() {
                _isPressed = true;
              });
            },
            onTapUp: (_) {
              setState(() {
                _isPressed = false;
              });
            },
            onTapCancel: () {
              setState(() {
                _isPressed = false;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeIn,
              decoration: widget.color != null
                  ? ShapeDecoration(
                      color: widget.color,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius ?? 8),
                      ),
                    )
                  : ShapeDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment(-1.00, -0.02),
                        end: Alignment(1, 0.02),
                        colors: [
                          AppColors.primaryColor,
                          AppColors.secondaryColor,
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius ?? 8),
                      ),
                    ),
              width: _isPressed
                  ? widget.width2 ?? context.width * .8
                  : widget.width ?? context.width,
              height: _isPressed
                  ? widget.height2 ?? context.height * .05
                  : widget.height ?? context.height * .06,
              // height: _isPressed ? context.height * .06 : context.height * .07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.icon == null
                    ? [
                        Text(
                          widget.text,
                          style: context.button().copyWith(
                                fontSize: widget.fontSize,
                                color: widget.colorText ?? AppColors.whiteColor,
                              ),
                        ),
                      ]
                    : widget.iconLeft == false
                        ? [
                            widget.icon!,
                            AppSize.s8.width,
                            Text(
                              widget.text,
                              style: context.button().copyWith(
                                    fontSize: widget.fontSize,
                                    color: widget.colorText ??
                                        AppColors.whiteColor,
                                  ),
                            ),
                          ]
                        : [
                            Text(
                              widget.text,
                              style: context.button().copyWith(
                                    fontSize: widget.fontSize,
                                    color: widget.colorText ??
                                        AppColors.whiteColor,
                                  ),
                            ),
                            AppSize.s8.width,
                            widget.icon!,
                          ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
