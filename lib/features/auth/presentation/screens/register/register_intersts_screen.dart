import 'package:demoapp/core/custom_widgets/buttons/custom_button.dart';
import 'package:demoapp/core/custom_widgets/custom_app_bar/custom_app_bar.dart';
import 'package:demoapp/core/extension/widget_extensions.dart';
import 'package:demoapp/core/theme/app_colors.dart';
import 'package:demoapp/core/theme/app_text_style.dart';
import 'package:demoapp/features/auth/presentation/widgets/register/custom_select_intersts_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterInterestsScreen extends StatefulWidget {
  const RegisterInterestsScreen({super.key});

  @override
  State<RegisterInterestsScreen> createState() =>
      _RegisterInterestsScreenState();
}

class _RegisterInterestsScreenState extends State<RegisterInterestsScreen> {
  Set<int> selectedInterests = {};

  bool get isValid => selectedInterests.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: const Text('تسجيل حساب جديد'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.verticalSpace,

                  Text(
                    'الاهتمامات',
                    style: AppTextStyle.font20SemiBold(
                      color: AppColor.blackColor(context),
                    ),
                  ),
                  6.verticalSpace,
                  Text(
                    'تساعدنا على تقديم أفضل خدمة',
                    style: AppTextStyle.font14Regular(
                      color: AppColor.greyTextColor(context),
                    ),
                  ),

                  24.verticalSpace,

                  CustomSelectInterestsWidget(
                    onChanged: (indexes) {
                      selectedInterests = indexes;
                    },
                  ),
                ],
              ).paddingHorizontal(16.w),
            ),
          ),

          CustomButton(
            text: 'المتابعة',
            isGrey: !isValid,
            onPressed: isValid ? () {
              /// selectedInterests contains indexes
            } : null,
          ).paddingHorizontal(16.w),

          40.verticalSpace,
        ],
      ),
    );
  }
}
