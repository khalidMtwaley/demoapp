import 'package:country_picker/country_picker.dart';
import 'package:demoapp/core/custom_widgets/buttons/custom_button.dart';
import 'package:demoapp/core/custom_widgets/custom_app_bar/custom_app_bar.dart';
import 'package:demoapp/core/custom_widgets/custom_drop_down/custom_country_form_field.dart';
import 'package:demoapp/core/custom_widgets/custom_drop_down/custom_drop_down_over_lay.dart';
import 'package:demoapp/core/custom_widgets/custom_form_field/custom_form_field.dart';
import 'package:demoapp/core/extension/widget_extensions.dart';
import 'package:demoapp/core/images/app_images.dart';
import 'package:demoapp/core/routes/routes_name.dart';
import 'package:demoapp/core/theme/app_colors.dart';
import 'package:demoapp/core/theme/app_text_style.dart';
import 'package:demoapp/core/utils/navigator_methods.dart';
import 'package:demoapp/features/auth/presentation/widgets/register/countries_drop_down.dart';
import 'package:demoapp/features/auth/presentation/widgets/register/custom_select_gender_widget.dart';
import 'package:demoapp/features/auth/presentation/widgets/register/secret_info_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

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
final TextEditingController phoneController = TextEditingController();

class _RegisterScreenState extends State<RegisterScreen> {

  Country? selectedCountry;
  @override
  void initState() {
    selectedCountry = Country.parse('SA');

    super.initState();
    // selectedCountry = Country(
    //   phoneCode: '20',
    //   countryCode: 'EG',
    //   e164Sc: 0,
    //   geographic: true,
    //   level: 1,
    //   name: 'Egypt',
    //   example: '01234567890',
    //   displayName: 'Egypt (EG)',
    //   displayNameNoCountryCode: 'Egypt',
    //   e164Key: '20-0-EG-1',
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: Text('تسجيل حساب جديد'),

        leadingOnTap: () {
          Navigator.pop(context);
        },
      ),
      body: Form(
        key: registerFormKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.verticalSpace,
              Text(
                'البيانات الأساسية',
                style: AppTextStyle.font22SemiBold(
                  color: AppColor.blackColor(context),
                ),
              ),
              10.verticalSpace,
              Text(
                'اكتب بياناتك هنا',
                style: AppTextStyle.font15Regular(
                  color: AppColor.greyTextColor(context),
                ),
              ),
              25.verticalSpace,

              Row(
                children: [
                  Expanded(
                    child: CustomFormField(
                      title: 'الاسم الأول',
                      controller: firstNameController,
                    ),
                  ),
                  20.horizontalSpace,
                  Expanded(
                    child: CustomFormField(
                      title: 'الاسم الأخير',
                      controller: lastNameController,
                    ),
                  ),
                ],
              ),
              20.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: CustomFormField(
                      title: 'اسم المستخدم',
                      controller: userNameController,
                    ),
                  ),
                  20.horizontalSpace,
                  Expanded(
                    child: CustomDropdownOverlay(
                      title: 'الدولة',
                      hintText: 'اختر الدولة',
                      items: arabCountries,
                      onItemSelected: (value) {
                        setState(() {
                          selectedCountry = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              20.verticalSpace,
              CustomFormField(
                title: 'البريد الإلكتروني',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              20.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'رقم الهاتف',
                    style: AppTextStyle.font15Regular(
                      color: AppColor.blackColor(context),
                    ),
                  ),
                  11.verticalSpace,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            showPhoneCode: true,
                            onSelect: (country) {
                              setState(() {
                                selectedCountry = country;
                              });
                            },
                          );
                        },
                        child: Container(
                          height: 65.h,
                          padding: EdgeInsets.symmetric(horizontal: 23.w),
                          decoration: BoxDecoration(
                            color: AppColor.whiteColor(context),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: AppColor.textFormBorderColor(context),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                selectedCountry?.flagEmoji ?? '',
                                style: const TextStyle(fontSize: 18),
                              ),
                              // const Gap(6),
                              // Text(
                              //   '+${selectedCountry?.phoneCode ?? ''}',
                              //   style: AppTextStyle.textFormStyle(context),
                              // ),
                              // const Gap(4),
                              // const Icon(Icons.keyboard_arrow_down, size: 18),
                            ],
                          ),
                        ),
                      ),

                      15.horizontalSpace,

                      Expanded(
                        child: CustomFormField(
                          controller: phoneController,
                          hintText: 'رقم الهاتف',
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              24.verticalSpace,
              const CustomSelectGenderWidget(),
              14.verticalSpace,
              const SecretInformationTextWidget(),
              16.verticalSpace,
              CustomButton(
                isGrey: true,
                text: 'المتابعة',
                onPressed: () {
                  NavigatorMethods.pushNamed(
                    context,
                    RoutesName.registerSelectAvatarScreen,
                  );
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
