import 'package:demoapp/core/images/app_images.dart';
import 'package:demoapp/features/onboarding/screens/on_boarding_data.dart';
import 'package:flutter/material.dart';
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
      title: 'مرحبا بك',
      description: 'وصف بسيط للشاشة الأولى',
    ),
    OnBoardingModel(
      image: AppImages.assetsSvgOnBoardingOnboarding3,
      title: 'سهولة الاستخدام',
      description: 'وصف بسيط للشاشة الثانية',
    ),
    OnBoardingModel(
      image: AppImages.assetsSvgOnBoardingOnboarding4,
      title: 'تجربة سريعة',
      description: 'وصف بسيط للشاشة الثالثة',
    ),
    OnBoardingModel(
      image: AppImages.assetsSvgOnBoardingOnboarding5,
      title: 'تواصل أسهل',
      description: 'وصف بسيط للشاشة الرابعة',
    ),
    OnBoardingModel(
      image: AppImages.assetsSvgOnBoardingOnboarding6,
      title: 'أمان تام',
      description: 'وصف بسيط للشاشة الخامسة',
    ),
    OnBoardingModel(
      image: AppImages.assetsSvgOnBoardingOnboarding7,
      title: 'تنظيم أفضل',
      description: 'وصف بسيط للشاشة السادسة',
    ),
    OnBoardingModel(
      image: AppImages.assetsSvgOnBoardingOnboarding8,
      title: 'متابعة مستمرة',
      description: 'وصف بسيط للشاشة السابعة',
    ),
    OnBoardingModel(
      image: AppImages.assetsSvgOnBoardingOnboarding9,
      title: 'ابدأ الآن',
      description: 'وصف بسيط للشاشة الأخيرة',
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
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onBoardingList.length,
                onPageChanged: (index) {
                  setState(() => currentIndex = index);
                },
                itemBuilder: (context, index) {
                  final item = onBoardingList[index];
                  return _OnBoardingItem(
                    imagePath: item.image,
                    title: item.title,
                    description: item.description,
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
              child: Row(
                children: [
                  /// Skip
                  GestureDetector(
                    onTap: goToLogin,
                    child: const Text(
                      'تخطي',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ),

                  const Spacer(),

                  InkWell(
                    onTap: () {
                      if (currentIndex ==
                          onBoardingList.length - 1) {
                        goToLogin();
                      } else {
                        _pageController.nextPage(
                          duration:
                              const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 18,
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

class _OnBoardingItem extends StatelessWidget {
  const _OnBoardingItem({
    required this.imagePath,
    required this.title,
    required this.description,
  });

  final String imagePath;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            imagePath,
            // height: 240,
          ),
          const SizedBox(height: 40),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
