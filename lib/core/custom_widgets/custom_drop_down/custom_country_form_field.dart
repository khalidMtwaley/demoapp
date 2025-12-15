import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_style.dart';
import '../../extension/context_extension.dart';

class CustomIntlPhoneField extends StatelessWidget {
  final String? title;
  final String? hintText;
  final Function(String)? onChanged;
  final Function(String)? onCountryChanged;
  final bool isFillGrey;
  final double radius;

  const CustomIntlPhoneField({
    super.key,
    this.title,
    this.hintText,
    this.onChanged,
    this.onCountryChanged,
    this.isFillGrey = false,
    this.radius = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title!,
            style: AppTextStyle.font15Regular(
              color: AppColor.blackColor(context),
            ),
          ),

        if (title != null) SizedBox(height: 11.h),

        Directionality(
          textDirection:
              context.isRTL() ? ui.TextDirection.rtl : ui.TextDirection.ltr,
          child: IntlPhoneField(
            initialCountryCode: 'SA', // 🇸🇦 السعودية
            dropdownIconPosition: IconPosition.trailing,
            flagsButtonPadding:
                EdgeInsets.symmetric(horizontal: 12.w), // بعد العلم
            disableLengthCheck: true,
            cursorColor: AppColor.mainAppColor(context),

            style: AppTextStyle.textFormStyle(context),

            decoration: InputDecoration(
              hintText: hintText ?? 'رقم الهاتف',
              hintStyle: AppTextStyle.hintStyle(context),

              filled: true,
              fillColor: isFillGrey
                  ? AppColor.fillColorGrey(context)
                  : AppColor.textFormFillColor(context),

              contentPadding:
                  EdgeInsets.symmetric(vertical: 25.h, horizontal: 10.w),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(
                  color: AppColor.textFormBorderColor(context),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(
                  color: AppColor.textFormBorderColor(context),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(
                  color: AppColor.mainAppColor(context),
                ),
              ),
            ),

            onChanged: (phone) {
              onChanged?.call(phone.completeNumber);
            },

            onCountryChanged: (country) {
              onCountryChanged?.call(country.code);
            },
          ),
        ),
      ],
    );
  }
}
