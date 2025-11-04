


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors/app_colors.dart';

class CustomTextField extends StatefulWidget {
  static void _defaultOnTap() {}

  const CustomTextField({
    this.textEditingController,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.cursorColor = Colors.black,
    this.inputTextStyle,
    this.textAlignVertical = TextAlignVertical.center,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.validator,
    this.hintText,
    this.hintTextColor,
    this.fillColor = AppColors.fillColor,
    this.suffixIcon,
    this.onChanged,
    this.suffixIconColor,
    this.borderRadius = 8,
    this.fieldBorderColor = AppColors.white,
    this.isPassword = false,
    this.readOnly = false,
    super.key,
    this.onTapClick = _defaultOnTap,
    this.isPrefixIcon = false,
    this.focusBorderColor = AppColors.white,
    this.height = 48,
    this.maxLength,
    this.labelText = '',
    this.onFieldSubmitted,
  });

  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Color cursorColor;
  final TextStyle? inputTextStyle;
  final TextAlignVertical? textAlignVertical;
  final TextAlign textAlign;
  final int? maxLines;
  final int? maxLength;
  final FormFieldValidator? validator;
  final String? hintText;
  final Color? hintTextColor;
  final String labelText;
  final Color? fillColor;
  final Color? suffixIconColor;
  final Widget? suffixIcon;
  final double borderRadius;
  final Color fieldBorderColor;
  final Color focusBorderColor;
  final void Function(String)? onChanged;
  final bool isPassword;
  final bool isPrefixIcon;
  final VoidCallback onTapClick;
  final bool readOnly;
  final double height;
  final void Function(String)? onFieldSubmitted;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.zero,
        child: TextFormField(
          onFieldSubmitted: widget.onFieldSubmitted,
          onTap: widget.onTapClick,
          onChanged: widget.onChanged,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          readOnly: widget.readOnly,
          controller: widget.textEditingController,
          focusNode: widget.focusNode,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          cursorColor: widget.cursorColor,
          style:
              widget.inputTextStyle ??
              TextStyle(fontSize: 14.sp, color: Colors.black).merge(widget.inputTextStyle),
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          buildCounter:
              (_, {required currentLength, required isFocused, maxLength}) =>
                  null,
          // hides counter but enforces limit
          obscureText: widget.isPassword ? obscureText : false,
          validator: widget.validator,
          textAlignVertical: widget.textAlignVertical,
          textAlign: widget.textAlign,
          decoration: InputDecoration(
            isDense: true,
            errorMaxLines: 2,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: AppColors.black,
              fontSize: 14.sp,
            ),
            fillColor: widget.fillColor,
            filled: true,
            prefixIcon: widget.isPrefixIcon
                ? Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 8.h,
                    ),
                    child: Icon(
                      Icons.search,
                      color: AppColors.white,
                      size: 24.sp,
                    ),
                  )
                : null,
            suffixIcon: widget.isPassword
                ? GestureDetector(
                    onTap: toggle,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Icon(
                        obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Color(0xff6B7280),
                        size: 20.sp,
                      ),
                    ),
                  )
                : widget.suffixIcon,
            suffixIconColor: widget.suffixIconColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius.r),
              borderSide: BorderSide(
                color: widget.fieldBorderColor,
                width: 1.5,
              ),
              gapPadding: 0,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius.r),
              borderSide: BorderSide(
                color: widget.fieldBorderColor,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius.r),
              borderSide: BorderSide(
                color: widget.focusBorderColor,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius.r),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius.r),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
          ),
        ),
      ),
    );
  }

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}

