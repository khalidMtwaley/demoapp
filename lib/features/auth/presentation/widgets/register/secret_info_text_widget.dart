import 'package:demoapp/core/images/app_images.dart';
import 'package:demoapp/core/theme/app_colors.dart';
import 'package:demoapp/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SecretInformationTextWidget extends StatelessWidget {
  const SecretInformationTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppImages.assetsImagesAuthShield),
        14.horizontalSpace,
        Text(
          'جميع معلوماتك سرية',
          style: AppTextStyle.font12Regular(
            color: AppColor.blackColor(context),
          ),
        ),
      ],
    );
  }
}
