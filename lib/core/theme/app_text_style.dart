import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppTextStyle {
  static TextStyle appBarStyle(BuildContext context, {bool listen = true}) {
    return TextStyle(
      fontFamily: 'Alexandria',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColor.appBarTextColor(context, listen: listen),
    );
  }

  static TextStyle buttonStyle(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: 'Alexandria',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: color ?? AppColor.buttonTextColor(context, listen: listen),
    );
  }

  static TextStyle hintStyle(BuildContext context, {bool listen = true}) {
    return TextStyle(
      fontFamily: 'Alexandria',

      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColor.hintColor(context, listen: listen),
    );
  }

  static TextStyle textFormStyle(BuildContext context, {bool listen = true}) {
    return TextStyle(
      fontFamily: 'Alexandria',

      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColor.textFormColor(context, listen: listen),
    );
  }

  static TextStyle formTitleStyle(BuildContext context, {bool listen = true}) {
    return TextStyle(
      fontFamily: 'Alexandria',

      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColor.titleFormFiledColor(context, listen: listen),
    );
  }

  static TextStyle text20SSecond(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: 'Alexandria',

      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: color ?? AppColor.secondAppColor(context, listen: listen),
    );
  }

  static TextStyle text16MSecond(
    BuildContext context, {
    bool listen = true,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: 'Alexandria',

      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: color ?? AppColor.secondAppColor(context, listen: listen),
    );
  }

  // ================== NEW GLOBAL FONT SYSTEM ==================

  // Helper (internal)
  static TextStyle _font(double size, FontWeight weight, Color color) {
    return TextStyle(
      fontFamily: 'Alexandria',
      fontSize: size.sp,
      fontWeight: weight,
      color: color,
    );
  }

  // ---------- 8 → 25 ----------
  static TextStyle font8Regular({required Color color}) =>
      _font(8, FontWeight.w400, color);
  static TextStyle font8Medium({required Color color}) =>
      _font(8, FontWeight.w500, color);
  static TextStyle font8SemiBold({required Color color}) =>
      _font(8, FontWeight.w600, color);
  static TextStyle font8Bold({required Color color}) =>
      _font(8, FontWeight.w700, color);

  static TextStyle font9Regular({required Color color}) =>
      _font(9, FontWeight.w400, color);
  static TextStyle font9Medium({required Color color}) =>
      _font(9, FontWeight.w500, color);
  static TextStyle font9SemiBold({required Color color}) =>
      _font(9, FontWeight.w600, color);
  static TextStyle font9Bold({required Color color}) =>
      _font(9, FontWeight.w700, color);

  static TextStyle font10Regular({required Color color}) =>
      _font(10, FontWeight.w400, color);
  static TextStyle font10Medium({required Color color}) =>
      _font(10, FontWeight.w500, color);
  static TextStyle font10SemiBold({required Color color}) =>
      _font(10, FontWeight.w600, color);
  static TextStyle font10Bold({required Color color}) =>
      _font(10, FontWeight.w700, color);

  static TextStyle font11Regular({required Color color}) =>
      _font(11, FontWeight.w400, color);
  static TextStyle font11Medium({required Color color}) =>
      _font(11, FontWeight.w500, color);
  static TextStyle font11SemiBold({required Color color}) =>
      _font(11, FontWeight.w600, color);
  static TextStyle font11Bold({required Color color}) =>
      _font(11, FontWeight.w700, color);

  static TextStyle font12Regular({required Color color}) =>
      _font(12, FontWeight.w400, color);
  static TextStyle font12Medium({required Color color}) =>
      _font(12, FontWeight.w500, color);
  static TextStyle font12SemiBold({required Color color}) =>
      _font(12, FontWeight.w600, color);
  static TextStyle font12Bold({required Color color}) =>
      _font(12, FontWeight.w700, color);

  static TextStyle font13Regular({required Color color}) =>
      _font(13, FontWeight.w400, color);
  static TextStyle font13Medium({required Color color}) =>
      _font(13, FontWeight.w500, color);
  static TextStyle font13SemiBold({required Color color}) =>
      _font(13, FontWeight.w600, color);
  static TextStyle font13Bold({required Color color}) =>
      _font(13, FontWeight.w700, color);

  static TextStyle font14Regular({required Color color}) =>
      _font(14, FontWeight.w400, color);
  static TextStyle font14Medium({required Color color}) =>
      _font(14, FontWeight.w500, color);
  static TextStyle font14SemiBold({required Color color}) =>
      _font(14, FontWeight.w600, color);
  static TextStyle font14Bold({required Color color}) =>
      _font(14, FontWeight.w700, color);

  static TextStyle font15Regular({required Color color}) =>
      _font(15, FontWeight.w400, color);
  static TextStyle font15Medium({required Color color}) =>
      _font(15, FontWeight.w500, color);
  static TextStyle font15SemiBold({required Color color}) =>
      _font(15, FontWeight.w600, color);
  static TextStyle font15Bold({required Color color}) =>
      _font(15, FontWeight.w700, color);

  static TextStyle font16Regular({required Color color}) =>
      _font(16, FontWeight.w400, color);
  static TextStyle font16Medium({required Color color}) =>
      _font(16, FontWeight.w500, color);
  static TextStyle font16SemiBold({required Color color}) =>
      _font(16, FontWeight.w600, color);
  static TextStyle font16Bold({required Color color}) =>
      _font(16, FontWeight.w700, color);

  static TextStyle font18Regular({required Color color}) =>
      _font(18, FontWeight.w400, color);
  static TextStyle font18Medium({required Color color}) =>
      _font(18, FontWeight.w500, color);
  static TextStyle font18SemiBold({required Color color}) =>
      _font(18, FontWeight.w600, color);
  static TextStyle font18Bold({required Color color}) =>
      _font(18, FontWeight.w700, color);

  static TextStyle font20Regular({required Color color}) =>
      _font(20, FontWeight.w400, color);
  static TextStyle font20Medium({required Color color}) =>
      _font(20, FontWeight.w500, color);
  static TextStyle font20SemiBold({required Color color}) =>
      _font(20, FontWeight.w600, color);
  static TextStyle font20Bold({required Color color}) =>
      _font(20, FontWeight.w700, color);

  static TextStyle font22Regular({required Color color}) =>
      _font(22, FontWeight.w400, color);
  static TextStyle font22Medium({required Color color}) =>
      _font(22, FontWeight.w500, color);
  static TextStyle font22SemiBold({required Color color}) =>
      _font(22, FontWeight.w600, color);
  static TextStyle font22Bold({required Color color}) =>
      _font(22, FontWeight.w700, color);

  static TextStyle font24Regular({required Color color}) =>
      _font(24, FontWeight.w400, color);
  static TextStyle font24Medium({required Color color}) =>
      _font(24, FontWeight.w500, color);
  static TextStyle font24SemiBold({required Color color}) =>
      _font(24, FontWeight.w600, color);
  static TextStyle font24Bold({required Color color}) =>
      _font(24, FontWeight.w700, color);

  static TextStyle font25Regular({required Color color}) =>
      _font(25, FontWeight.w400, color);
  static TextStyle font25Medium({required Color color}) =>
      _font(25, FontWeight.w500, color);
  static TextStyle font25SemiBold({required Color color}) =>
      _font(25, FontWeight.w600, color);
  static TextStyle font25Bold({required Color color}) =>
      _font(25, FontWeight.w700, color);
}
