import 'package:demoapp/core/images/app_images.dart';
import 'package:demoapp/core/theme/app_colors.dart';
import 'package:demoapp/core/theme/app_text_style.dart';
import 'package:demoapp/features/onboarding/screens/on_boarding_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  final List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
      image: AppImages.assetsSvgOnBoardingOnboarding2,
      title: 'عنوان عنوان',
      description: 'وصف بسيط للشاشة الأولى',
    ),
    OnBoardingModel(
      image: AppImages.assetsSvgOnBoardingOnboarding3,
      title: 'عنوان عنوان',
      description: 'وصف بسيط للشاشة الثانية',
    ),
    OnBoardingModel(
      image: AppImages.assetsSvgOnBoardingOnboarding4,
      title: 'عنوان عنوان',
      description: 'وصف بسيط للشاشة الثالثة',
    ),
    OnBoardingModel(
      image: AppImages.assetsSvgOnBoardingOnboarding5,
      title: 'عنوان عنوان',
      description: 'وصف بسيط للشاشة الرابعة',
      showExtraImage: true,
      extraImage: AppImages.assetsSvgOnBoardingBaseOnBoarding,
    ),
    OnBoardingModel(
      image: AppImages.assetsSvgOnBoardingOnboarding6,
      title: 'عنوان عنوان',
      description: 'وصف بسيط للشاشة الخامسة',
      showExtraImage: true,
      extraImage: AppImages.assetsSvgOnBoardingBaseOnBoarding,
    ),
    OnBoardingModel(
      image: AppImages.assetsSvgOnBoardingOnboarding7,
      title: 'عنوان عنوان',
      description: 'وصف بسيط للشاشة السادسة',
      showExtraImage: true,
      extraImage: AppImages.assetsSvgOnBoardingBaseOnBoarding,
    ),
    OnBoardingModel(
      image: AppImages.assetsSvgOnBoardingOnboarding8,
      title: 'عنوان عنوان',
      description: 'وصف بسيط للشاشة السابعة',
      showExtraImage: true,
      extraImage: AppImages.assetsSvgOnBoardingBaseOnBoarding,
    ),
    OnBoardingModel(
      image: AppImages.assetsSvgOnBoardingOnboarding9,
      title: 'عنوان عنوان',
      description: 'وصف بسيط للشاشة الأخيرة',
      showExtraImage: true,
      extraImage: AppImages.assetsSvgOnBoardingBaseOnBoarding,
    ),
  ];

  void goToLogin() {
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (_) => const LoginScreen()),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            40.verticalSpace,
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onBoardingList.length,
                onPageChanged: (index) {
                  setState(() => currentIndex = index);
                },
                itemBuilder: (context, index) {
                  final item = onBoardingList[index];
                  return OnBoardingItem(item: item, index: index);
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30.h),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: goToLogin,
                    child: Text(
                      'التخطي',
                      style: AppTextStyle.font14SemiBold(
                        color: AppColor.greyTextColor(context),
                      ),
                    ),
                  ),

                  const Spacer(),

                  InkWell(
                    onTap: () {
                      if (currentIndex == onBoardingList.length - 1) {
                        goToLogin();
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Container(
                      width: 68.w,
                      height: 68.h,
                      padding: EdgeInsets.all(2.w),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColor.borderColor(context),
                        ),
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.lightBlack1(context),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
