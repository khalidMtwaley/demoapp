import 'dart:io';

import 'package:demoapp/core/custom_widgets/buttons/custom_button.dart';
import 'package:demoapp/core/extension/widget_extensions.dart';
import 'package:demoapp/core/images/image_methods.dart';
import 'package:demoapp/core/theme/app_colors.dart';
import 'package:demoapp/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSelectAvatarsWidget extends StatefulWidget {
  final void Function(int? avatarIndex, File? imageFile)? onChanged;

  const CustomSelectAvatarsWidget({super.key, this.onChanged});

  @override
  State<CustomSelectAvatarsWidget> createState() =>
      _CustomSelectAvatarsWidgetState();
}

class _CustomSelectAvatarsWidgetState extends State<CustomSelectAvatarsWidget> {
  final ValueNotifier<int?> selectedAvatarIndex = ValueNotifier<int?>(null);

  final ValueNotifier<File?> selectedImageFile = ValueNotifier<File?>(null);

  final List<String> avatarImages = List.generate(
    16,
    (index) => 'assets/images/avatar/avatar${index + 1}.png',
  );

  @override
  void dispose() {
    selectedAvatarIndex.dispose();
    selectedImageFile.dispose();
    super.dispose();
  }

  void _notifyParent() {
    widget.onChanged?.call(selectedAvatarIndex.value, selectedImageFile.value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder<int?>(
          valueListenable: selectedAvatarIndex,
          builder: (context, selectedIndex, _) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: avatarImages.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
              ),
              itemBuilder: (context, index) {
                final isSelected = selectedIndex == index;

                return GestureDetector(
                  onTap: () {
                    selectedAvatarIndex.value = index;
                    selectedImageFile.value = null;
                    _notifyParent();
                  },
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
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
                          child: Image.asset(
                            avatarImages[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

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
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
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
        ),

        24.verticalSpace,

        Row(
          children: [
            Expanded(child: Divider(thickness: 1, color: Colors.grey.shade300)),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text(
                "او",
                style: AppTextStyle.font16Medium(
                  color: AppColor.blackColor(context),
                ),
              ),
            ),

            Expanded(child: Divider(thickness: 1, color: Colors.grey.shade300)),
          ],
        ),

        32.verticalSpace,

        CustomButton(
          color: AppColor.lightGreenColor(context),
          style: AppTextStyle.font16SemiBold(
            color: AppColor.greenColor(context),
          ),
          text: 'اختر صورة من الجهاز',
          onPressed: () {
            ImageMethods.pickImageBottomSheet(
              context,
              onSuccessCamera: (file) {
                selectedImageFile.value = file;
                selectedAvatarIndex.value = null;
                _notifyParent();
              },
              onSuccessGallery: (files) {
                if (files.isNotEmpty) {
                  selectedImageFile.value = files.first;
                  selectedAvatarIndex.value = null;
                  _notifyParent();
                }
              },
            );
          },
        ).paddingHorizontal(7.w),

        ValueListenableBuilder<File?>(
          valueListenable: selectedImageFile,
          builder: (context, file, _) {
            if (file == null) return const SizedBox();

            return Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColor.greenColor(context),
                        width: 3,
                      ),
                    ),
                    child: ClipOval(child: Image.file(file, fit: BoxFit.cover)),
                  ),
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
        ),
      ],
    );
  }
}
