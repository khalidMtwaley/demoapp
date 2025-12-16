import 'dart:io';

import 'package:demoapp/core/custom_widgets/buttons/custom_button.dart';
import 'package:demoapp/core/custom_widgets/custom_app_bar/custom_app_bar.dart';
import 'package:demoapp/core/extension/widget_extensions.dart';
import 'package:demoapp/core/theme/app_colors.dart';
import 'package:demoapp/core/theme/app_text_style.dart';
import 'package:demoapp/features/auth/presentation/widgets/register/custom_select_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterSelectAvatarScreen extends StatefulWidget {
  const RegisterSelectAvatarScreen({super.key});

  @override
  State<RegisterSelectAvatarScreen> createState() =>
      _RegisterSelectAvatarScreenState();
}

class _RegisterSelectAvatarScreenState
    extends State<RegisterSelectAvatarScreen> {
  int? selectedAvatarIndex;
  File? selectedImageFile;

  // bool get isValid =>
  //     selectedAvatarIndex != null || selectedImageFile != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, title: const Text('تسجيل حساب جديد')),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.verticalSpace,

                  Text(
                    'الصورة التوضيحية',
                    style: AppTextStyle.font20SemiBold(
                      color: AppColor.blackColor(context),
                    ),
                  ),
                  6.verticalSpace,
                  Text(
                    'تظهر لباقي المستخدمين',
                    style: AppTextStyle.font14Regular(
                      color: AppColor.greyTextColor(context),
                    ),
                  ),
                  24.verticalSpace,
                  CustomSelectAvatarsWidget(
                    onChanged: (avatarIndex, imageFile) {
                      selectedAvatarIndex = avatarIndex;
                      selectedImageFile = imageFile;
                    },
                  ),
                ],
              ).paddingHorizontal(16.w),
            ),
          ),

          CustomButton(
            text: 'المتابعة',
            isGrey: true,
            onPressed: () {},
          ).paddingHorizontal(16.w),
          40.verticalSpace,
        ],
      ),
    );
  }
}
