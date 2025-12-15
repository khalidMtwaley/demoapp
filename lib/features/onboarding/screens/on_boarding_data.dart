import 'package:demoapp/core/theme/app_colors.dart';
import 'package:demoapp/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String description;
  
  final bool showExtraImage; 
  final String? extraImage;  
    final double svgHeight;


  OnBoardingModel({
    required this.image,
    required this.title,
    required this.description,
        this.showExtraImage = false,
    this.extraImage,
        this.svgHeight = 260,

  });
}
class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({required this.item, required this.index});

  final OnBoardingModel item;
  final int index;
  double _getImageOffsetY(int index) {
    switch (index) {
      case 2 :
        return 70.h;
      case 3:
        return 48.h;
      case 4:
        return 43.h;
      case 5:
        return 58.h;
      case 6:
        return 67.h;
      case 7:
        return 85.h;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final offsetY = _getImageOffsetY(index);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              if (item.showExtraImage && item.extraImage != null)
                SvgPicture.asset(item.extraImage!),

              Transform.translate(
                offset: Offset(0, offsetY),
                child: SvgPicture.asset(item.image),
              ),
            ],
          ),

          41.verticalSpace,

          Text(
            item.title,
            textAlign: TextAlign.center,
            style: AppTextStyle.font23Bold(color: AppColor.blackColor(context)),
          ),
          15.verticalSpace,
          Text(
            item.description,
            textAlign: TextAlign.center,
            style: AppTextStyle.font15Medium(
              color: AppColor.greyTextColor(context),
            ),
          ),
        ],
      ),
    );
  }
}
