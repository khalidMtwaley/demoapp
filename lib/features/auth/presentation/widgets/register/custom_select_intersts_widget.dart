import 'package:demoapp/core/theme/app_colors.dart';
import 'package:demoapp/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class InterestItem {
  final String image;
  final String title;

  InterestItem({
    required this.image,
    required this.title,
  });
}

class CustomSelectInterestsWidget extends StatefulWidget {
  final void Function(Set<int> selectedIndexes)? onChanged;

  const CustomSelectInterestsWidget({
    super.key,
    this.onChanged,
  });

  @override
  State<CustomSelectInterestsWidget> createState() =>
      _CustomSelectInterestsWidgetState();
}

class _CustomSelectInterestsWidgetState
    extends State<CustomSelectInterestsWidget> {
  /// multi select
  final ValueNotifier<Set<int>> selectedIndexes =
      ValueNotifier<Set<int>>({});

  /// dummy interests (غيّر الصور والعناوين)
  final List<InterestItem> interests = [
    InterestItem(image: 'assets/images/interests/i1.png', title: 'السفر'),
    InterestItem(image: 'assets/images/interests/i2.png', title: 'التصوير'),
    InterestItem(image: 'assets/images/interests/i3.png', title: 'الرياضة'),
    InterestItem(image: 'assets/images/interests/i4.png', title: 'الموسيقى'),
    InterestItem(image: 'assets/images/interests/i5.png', title: 'القراءة'),
    InterestItem(image: 'assets/images/interests/i6.png', title: 'الطهي'),
    InterestItem(image: 'assets/images/interests/i7.png', title: 'التقنية'),
    InterestItem(image: 'assets/images/interests/i8.png', title: 'الأفلام'),
    InterestItem(image: 'assets/images/interests/i9.png', title: 'الرسم'),
  ];

  @override
  void dispose() {
    selectedIndexes.dispose();
    super.dispose();
  }

  void _toggle(int index) {
    final current = {...selectedIndexes.value};

    if (current.contains(index)) {
      current.remove(index);
    } else {
      current.add(index);
    }

    selectedIndexes.value = current;
    widget.onChanged?.call(current);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Set<int>>(
      valueListenable: selectedIndexes,
      builder: (context, selected, _) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: interests.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 12.h,
          ),
          itemBuilder: (context, index) {
            final isSelected = selected.contains(index);

            return GestureDetector(
              onTap: () => _toggle(index),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: isSelected
                            ? AppColor.greenColor(context)
                            : AppColor.textFormBorderColor(context),
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          interests[index].image,
                          width: 42.w,
                          height: 42.w,
                          fit: BoxFit.contain,
                        ),
                        10.verticalSpace,
                        Text(
                          interests[index].title,
                          style: AppTextStyle.font14Medium(
                            color: AppColor.blackColor(context),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// check
                  if (isSelected)
                    Positioned(
                      top: -6,
                      left: 0,
                      right: 0,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            color: AppColor.greenColor(context),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.check,
                            size: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
