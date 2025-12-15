import 'package:demoapp/core/custom_widgets/buttons/custom_button.dart';
import 'package:demoapp/core/custom_widgets/custom_form_field/custom_form_field.dart';
import 'package:demoapp/core/extension/widget_extensions.dart';
import 'package:demoapp/core/images/app_images.dart';
import 'package:demoapp/core/routes/routes_name.dart';
import 'package:demoapp/core/theme/app_colors.dart';
import 'package:demoapp/core/theme/app_text_style.dart';
import 'package:demoapp/features/auth/presentation/widgets/login/social_login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: loginFormKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              90.verticalSpace,
              Image.asset(AppImages.assetsImagesAuthLogoBackGround),
              50.verticalSpace,
              CustomFormField(
                isFillGrey: true,
                controller: emailController,
                hintText: 'اسم المستخدم او البريد الالكتروني',
                keyboardType: TextInputType.emailAddress,
              ),
              17.verticalSpace,
              CustomFormField(
                isPassword: true,
                isFillGrey: true,
                controller: passwordController,
                hintText: 'كلمة المرور',
              ),
              30.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'نسيت كلمة المرور؟',
                    style: AppTextStyle.font15Medium(
                      color: AppColor.blueColor(context),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.registerScreen);
                    },
                    child: Text(
                      'حساب جديد',
                      style: AppTextStyle.font15Medium(
                        color: AppColor.blueColor(context),
                      ),
                    ),
                  ),
                ],
              ),
              35.verticalSpace,
              CustomButton(text: 'تسجيل الدخول', onPressed: () {}),
              34.verticalSpace,
              Text(
                "او",
                style: AppTextStyle.font16Medium(
                  color: AppColor.blackColor(context),
                ),
              ),
              20.verticalSpace,
              SocialLoginWidget(
                title: 'تسجيل الدخول باستخدام جوجل',
                onTap: () {},
                imagePath: AppImages.assetsSvgArrowDown,
              ),
              15.verticalSpace,
              SocialLoginWidget(
                title: 'تسجيل الدخول باستخدام فيسبوك',
                onTap: () {},
                imagePath: AppImages.assetsSvgArrowDown,
              ),
            ],
          ).paddingHorizontal(15.w),
        ),
      ),
    );
  }
}
