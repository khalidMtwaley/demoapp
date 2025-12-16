import 'package:demoapp/core/extension/widget_extensions.dart';
import 'package:demoapp/core/images/app_images.dart';
import 'package:demoapp/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSelectGenderWidget extends StatefulWidget {
  const CustomSelectGenderWidget({super.key});

  @override
  State<CustomSelectGenderWidget> createState() =>
      _CustomSelectGenderWidgetState();
}

class _CustomSelectGenderWidgetState extends State<CustomSelectGenderWidget> {
  final ValueNotifier<int> selectedIndexNotifier = ValueNotifier<int>(0);

  final List<String> images = [
    AppImages.assetsImagesAuthGirlGenderSelect,

    AppImages.assetsImagesAuthBoyGenderSelect,
  ];

  @override
  void dispose() {
    selectedIndexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: selectedIndexNotifier,
      builder: (context, selectedIndex, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(images.length, (index) {
            final isSelected = selectedIndex == index;

            return GestureDetector(
              onTap: () {
                selectedIndexNotifier.value = index;
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 12.w),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 110.w,
                      height: 110.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected
                              ? AppColor.greenColor(context)
                              : Colors.transparent,
                          width: 3,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.asset(images[index], fit: BoxFit.cover),
                      ),
                    ),

                    if (isSelected)
                      Positioned(
                        top: -14.h,
                        left: 0,
                        right: 0,
                        child: Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColor.greenColor(context),
                              width: 2,
                            ),
                            color: AppColor.whiteColor(context),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.check,
                            color: AppColor.greenColor(context),
                            size: 16,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }),
        ).paddingHorizontal(26.w);
      },
    );
  }
}
