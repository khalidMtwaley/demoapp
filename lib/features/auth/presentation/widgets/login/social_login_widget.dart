import 'package:demoapp/core/theme/app_colors.dart';
import 'package:demoapp/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLoginWidget extends StatelessWidget {
  const SocialLoginWidget({
    super.key,
    required this.title,
    required this.onTap,
    required this.imagePath,
  });
  final String title;
  final VoidCallback onTap;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: AppColor.borderColor(context)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(imagePath),
          10.horizontalSpace,
          Text(
            title,
            style: AppTextStyle.font16Medium(
              color: AppColor.blackColor(context),
            ),
          ),
        ],
      ),
    );
  }
}
