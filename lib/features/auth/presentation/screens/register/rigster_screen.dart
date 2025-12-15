import 'package:demoapp/core/custom_widgets/buttons/custom_button.dart';
import 'package:demoapp/core/custom_widgets/custom_form_field/custom_form_field.dart';
import 'package:demoapp/core/extension/widget_extensions.dart';
import 'package:demoapp/core/theme/app_colors.dart';
import 'package:demoapp/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

final TextEditingController firstNameController = TextEditingController();
final TextEditingController lastNameController = TextEditingController();
final TextEditingController userNameController = TextEditingController();
final TextEditingController emailController = TextEditingController();

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'تسجيل حساب جديد',
          style: AppTextStyle.font18SemiBold(
            color: AppColor.blackColor(context),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Form(
        key: registerFormKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.verticalSpace,

              /// -------- Section title --------
              Text(
                'البيانات الأساسية',
                style: AppTextStyle.font18SemiBold(
                  color: AppColor.blackColor(context),
                ),
              ),
              5.verticalSpace,
              Text(
                'اكتب بياناتك هنا',
                style: AppTextStyle.font14Regular(
                  color: AppColor.greyColor(context),
                ),
              ),
              25.verticalSpace,

              /// -------- First + Last name --------
              Row(
                children: [
                  Expanded(
                    child: CustomFormField(
                      title: 'الاسم الأول',
                      isFillGrey: true,
                      controller: firstNameController,
                      hintText: '',
                    ),
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: CustomFormField(
                      title: 'الاسم الأخير',
                      isFillGrey: true,
                      controller: lastNameController,
                      hintText: '',
                    ),
                  ),
                ],
              ),

              18.verticalSpace,

              /// -------- Username --------
              CustomFormField(
                title: 'اسم المستخدم',
                isFillGrey: true,
                controller: userNameController,
                hintText: '',
             
              ),

           

              18.verticalSpace,

              /// -------- Country --------
              CustomFormField(
                title: 'الدولة',
                isFillGrey: true,
                readOnly: true,
                hintText: '',
                suffixIcon: const Icon(Icons.keyboard_arrow_down),
                onTap: () {
                  /// TODO: open country picker
                },
              ),

              18.verticalSpace,

              /// -------- Email --------
              CustomFormField(
                title: 'البريد الإلكتروني',
                isFillGrey: true,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
          
              ),

              30.verticalSpace,

              /// -------- Submit --------
              CustomButton(
                text: 'تسجيل',
                onPressed: () {
                  if (registerFormKey.currentState!.validate()) {
                    /// submit
                  }
                },
              ),

              30.verticalSpace,
            ],
          ).paddingHorizontal(15.w),
        ),
      ),
    );
  }
}
