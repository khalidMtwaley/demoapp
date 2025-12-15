import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_style.dart';

class CustomAppBar extends PreferredSize {
  final double height;
  final double radius;
  final double elevation;

  /// Leading
  final bool hideLeading;
  final Widget? leading;
  final double? leadingWidth;
  final void Function()? leadingOnTap;

  /// Content
  final Widget? title;
  final List<Widget>? actions;

  /// Style
  final Color? appBarColor;
  final Color? shadowColor;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;
  final BorderRadiusGeometry? borderRadius;

  /// Bottom line
  final bool showBottomDivider;
  final Color? dividerColor;
  final double dividerHeight;

  final BuildContext context;

  CustomAppBar(
    this.context, {
    super.key,
    this.height = kToolbarHeight,
    this.radius = 0,
    this.elevation = 0,

    /// Leading
    this.hideLeading = false,
    this.leading,
    this.leadingWidth = 48,
    this.leadingOnTap,

    /// Content
    this.title,
    this.actions,

    /// Style
    this.appBarColor,
    this.shadowColor,
    this.centerTitle = true,
    this.bottom,
    this.borderRadius,

    /// Divider
    this.showBottomDivider = true,
    this.dividerColor,
    this.dividerHeight = 4,
  }) : super(
         preferredSize: Size.fromHeight(
           height + (showBottomDivider ? dividerHeight : 0),
         ),
         child: AppBar(
           elevation: elevation,
           backgroundColor: appBarColor ?? AppColor.whiteColor(context),
           toolbarHeight: height,
           shadowColor: shadowColor,
           centerTitle: centerTitle,
           title: title,
           actions: actions,
           titleTextStyle: AppTextStyle.font16SemiBold(
             color: AppColor.blackColor(context),
           ),

           leading: hideLeading
               ? null
               : InkWell(
                   onTap: leadingOnTap ?? () => Navigator.pop(context),
                   child: Padding(
                     padding:  EdgeInsets.all(12.0.w),
                     child:
                         leading ??
                         Icon(
                           Icons.arrow_back,
                           size: 30,
                           color: AppColor.blackColor(context),
                         ),
                   ),
                 ),

           leadingWidth: hideLeading ? 0 : leadingWidth,

           shape: RoundedRectangleBorder(
             borderRadius:
                 borderRadius ??
                 BorderRadius.vertical(bottom: Radius.circular(radius)),
           ),

           bottom: showBottomDivider
               ? PreferredSize(
                   preferredSize: Size.fromHeight(dividerHeight),
                   child: Container(
                     height: dividerHeight,
                     color: dividerColor ?? AppColor.dividerColor(context),
                   ),
                 )
               : bottom,
         ),
       );
}
