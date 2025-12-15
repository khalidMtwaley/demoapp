import 'dart:ui' as ui;

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../extension/context_extension.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_style.dart';

enum FormFieldBorder { underLine, outLine, none }

class CustomFormField extends StatefulWidget {
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool isPassword;
  final String? hintText;
  final int? maxLines;
  final void Function()? onTap;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double radius;
  final Color? fillColor;
  final Color? focusColor;
  final Color? unFocusColor;
  final Color? passwordColor;
  final String? title;
  final String? otherSideTitle;
  final ui.TextDirection? textDirection;
  final Country? country;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(Country)? onCountrySelect;
  final FormFieldBorder formFieldBorder;
  final TextStyle? titleStyle;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final int? maxLength;
  final double? width;
  final AutovalidateMode? autovalidateMode;

  /// ✅ الجديد
  final bool isFillGrey;

  const CustomFormField({
    super.key,
    this.controller,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.isPassword = false,
    this.hintText,
    this.maxLines = 1,
    this.onTap,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.radius = 14,
    this.fillColor,
    this.focusColor,
    this.unFocusColor,
    this.title,
    this.textDirection,
    this.otherSideTitle,
    this.country,
    this.passwordColor,
    this.formFieldBorder = FormFieldBorder.outLine,
    this.inputFormatters,
    this.onCountrySelect,
    this.titleStyle,
    this.textStyle,
    this.hintStyle,
    this.maxLength,
    this.autovalidateMode,
    this.width,
    this.isFillGrey = false,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (widget.title != null)
                Expanded(
                  child: Text(
                    widget.title!,
                    style:
                        widget.titleStyle ??
                        AppTextStyle.font15Regular(
                          color: AppColor.blackColor(context),
                        ),
                  ),
                ),
              if (widget.otherSideTitle != null)
                Text(
                  widget.otherSideTitle!,
                  style:
                      widget.titleStyle ?? AppTextStyle.formTitleStyle(context),
                ),
            ],
          ),

          if (widget.title != null || widget.otherSideTitle != null) Gap(11.h),

          Directionality(
            textDirection:
                widget.textDirection ??
                (context.isRTL() ? ui.TextDirection.rtl : ui.TextDirection.ltr),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(widget.radius),
              child: TextFormField(
                onTapOutside: (_) =>
                    FocusManager.instance.primaryFocus?.unfocus(),
                controller: widget.controller,
                onChanged: widget.onChanged,
                validator: widget.validator,
                onTap: widget.onTap,
                readOnly: widget.readOnly,
                keyboardType: widget.keyboardType,
                obscureText: widget.isPassword ? _obscureText : false,
                style: widget.textStyle ?? AppTextStyle.textFormStyle(context),
                autovalidateMode:
                    widget.autovalidateMode ??
                    AutovalidateMode.onUserInteraction,
                maxLines: widget.maxLines,
                cursorColor:
                    widget.focusColor ?? AppColor.mainAppColor(context),
                inputFormatters: widget.inputFormatters,
                maxLength: widget.maxLength,
                decoration: _decoration(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// ---------- Decoration ----------
  InputDecoration _decoration(BuildContext context) {
    return InputDecoration(
      hintMaxLines: 2,
      errorMaxLines: 2,
      hintText: widget.hintText,
      hintStyle: widget.hintStyle ?? AppTextStyle.hintStyle(context),

      filled: true,
      fillColor: widget.isFillGrey
          ? AppColor.fillColorGrey(context)
          : widget.fillColor ??
                (widget.formFieldBorder == FormFieldBorder.underLine
                    ? Colors.transparent
                    : AppColor.textFormFillColor(context)),

      border: widget.isFillGrey
          ? InputBorder.none
          : _border(
              color:
                  widget.unFocusColor ?? AppColor.textFormBorderColor(context),
            ),
      enabledBorder: widget.isFillGrey
          ? InputBorder.none
          : _border(
              color:
                  widget.unFocusColor ?? AppColor.textFormBorderColor(context),
            ),
      focusedBorder: widget.isFillGrey
          ? InputBorder.none
          : _border(color: widget.focusColor ?? AppColor.mainAppColor(context)),
      disabledBorder: widget.isFillGrey
          ? InputBorder.none
          : _border(
              color:
                  widget.unFocusColor ?? AppColor.textFormBorderColor(context),
            ),

      contentPadding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 10.w),

      prefixIcon: _buildPrefix(context),
      suffixIcon: _buildSuffix(context),
    );
  }

  /// ---------- Prefix ----------
  Widget? _buildPrefix(BuildContext context) {
    if (widget.country != null && context.locale == const Locale('en')) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.prefixIcon ?? const SizedBox(),
          Text(
            '${widget.country!.flagEmoji} +${widget.country!.phoneCode}',
            style: widget.textStyle ?? AppTextStyle.textFormStyle(context),
            textDirection: ui.TextDirection.ltr,
          ),
          const Gap(6),
        ],
      );
    }
    return widget.prefixIcon;
  }

  /// ---------- Suffix ----------
  Widget? _buildSuffix(BuildContext context) {
    if (widget.country != null && context.locale == const Locale('ar')) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${widget.country!.flagEmoji} +${widget.country!.phoneCode}',
            style: widget.textStyle ?? AppTextStyle.textFormStyle(context),
            textDirection: ui.TextDirection.ltr,
          ),
          const Gap(6),
          widget.suffixIcon ?? const SizedBox(),
        ],
      );
    }

    if (widget.isPassword) {
      return InkWell(
        onTap: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
        child: Icon(
          _obscureText
              ? Icons.visibility_off_rounded
              : Icons.visibility_rounded,
          size: 20,
          color: widget.passwordColor ?? AppColor.hintColor(context),
        ),
      );
    }

    return widget.suffixIcon;
  }

  /// ---------- Border ----------
  InputBorder _border({required Color color}) {
    switch (widget.formFieldBorder) {
      case FormFieldBorder.outLine:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: BorderSide(color: color),
        );
      case FormFieldBorder.underLine:
        return UnderlineInputBorder(borderSide: BorderSide(color: color));
      case FormFieldBorder.none:
        return InputBorder.none;
    }
  }
}
