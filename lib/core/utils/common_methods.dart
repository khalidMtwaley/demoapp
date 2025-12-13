import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import '../cache/hive/hive_methods.dart';
import '../custom_widgets/custom_toast/custom_toast.dart';
import '../extension/context_extension.dart';
import '../routes/app_routers_import.dart';
import '../theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import '../locale/app_locale_key.dart';
import '../services/injection_container.dart';

class CommonMethods {
  static void showAlertDialog({String? title, required String message}) {
    showCupertinoDialog(
      context: AppRouters.navigatorKey.currentContext!,
      builder: (context) => CupertinoAlertDialog(
        title: title != null
            ? Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontFamily: context.fontFamily(),
                ),
              )
            : null,
        content: Text(
          message,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            fontFamily: context.fontFamily(),
          ),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(
              AppLocaleKey.ok.tr(),
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontFamily: context.fontFamily(),
              ),
            ),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    );
  }

  // static void showChooseDialog(
  //   BuildContext context, {
  //   String? title,
  //   required String message,
  //   required VoidCallback onPressed,
  // }) {
  //   showCupertinoDialog(
  //     context: context,
  //     builder: (context) => CupertinoAlertDialog(
  //       title: title != null
  //           ? Text(
  //               title,
  //               style: TextStyle(
  //                 color: Colors.black,
  //                 fontSize: 16,
  //                 fontWeight: FontWeight.w700,
  //                 fontFamily: context.fontFamily(),
  //               ),
  //             )
  //           : null,
  //       content: Text(
  //         message,
  //         style: TextStyle(
  //           color: Colors.black,
  //           fontSize: 15,
  //           fontWeight: FontWeight.w500,
  //           fontFamily: context.fontFamily(),
  //         ),
  //       ),
  //       actions: [
  //         CupertinoDialogAction(
  //           child: Text(
  //             AppLocaleKey.no.tr(),
  //             style: TextStyle(
  //               color: AppColor.textColor(context),
  //               fontSize: 16,
  //               fontWeight: FontWeight.w700,
  //               fontFamily: context.fontFamily(),
  //             ),
  //           ),
  //           onPressed: () => Navigator.of(context).pop(),
  //         ),
  //         CupertinoDialogAction(
  //           onPressed: onPressed,
  //           child: Text(
  //             AppLocaleKey.yes.tr(),
  //             style: TextStyle(
  //               color: AppColor.textColor(context),
  //               fontSize: 16,
  //               fontWeight: FontWeight.w700,
  //               fontFamily: context.fontFamily(),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  static void showToast({
    required String message,
    String? title,
    //  String? icon,
    ToastType type = ToastType.success,
    Color? backgroundColor,
    Color? textColor,
    int seconds = 3,
  }) {
    BotToast.showCustomText(
      duration: Duration(seconds: seconds),
      toastBuilder: (cancelFunc) => CustomToast(
        type: type,
        title: title,
        message: message,
        backgroundColor: backgroundColor,
        //icon: icon,
        textColor: textColor,
      ),
    );
  }

  static void showError({
    required String message,
    String? title,
    String? icon,
    Color? backgroundColor,
    Color? textColor,
    int seconds = 3,
  }) {
    //  BotToast.showText(text: message,backgroundColor: backgroundColor );

    BotToast.showCustomText(
      duration: Duration(seconds: seconds),
      toastBuilder: (context) => CustomToast(
        title: title,
        message: message,
        backgroundColor: Color(0xffff3333),
        //icon: icon,
        textColor: textColor,
      ),
    );
  }

  // static Future<bool> hasConnection() async {
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult.contains(ConnectivityResult.mobile)) {
  //     return true;
  //   } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }



  // static void changeLanguage(
  //   BuildContext context, {
  //   required VoidCallback onTap,
  // }) {
  //   showCupertinoModalPopup(
  //     context: context,
  //     builder: (BuildContext context) => CupertinoActionSheet(
  //       title: Text(
  //         AppLocaleKey.language.tr(),
  //         style: TextStyle(
  //           color: Colors.black,
  //           fontSize: 16,
  //           fontWeight: FontWeight.w700,
  //           fontFamily: context.fontFamily(),
  //         ),
  //       ),
  //       actions: [
  //         CupertinoActionSheetAction(
  //           isDefaultAction: true,
  //           onPressed: () {
  //             HiveMethods.updateLang(const Locale('ar'));
  //             context.setLocale(const Locale('ar'));
  //             onTap.call();
  //             // ElectronicEngineer.setMyAppState(context);
  //             Navigator.pop(context);
  //           },
  //           child: Text(
  //             'العربية',
  //             style: TextStyle(
  //               fontFamily: context.fontFamilyAr(),
  //               color: context.locale == const Locale('ar')
  //                   ? AppColor.primaryAppColor(context)
  //                   : AppColor.textColor(context),
  //             ),
  //           ),
  //         ),
  //         CupertinoActionSheetAction(
  //           isDefaultAction: true,
  //           onPressed: () {
  //             HiveMethods.updateLang(const Locale('en'));
  //             context.setLocale(const Locale('en'));
  //             onTap.call();
  //             // ElectronicEngineer.setMyAppState(context);
  //             Navigator.pop(context);
  //           },
  //           child: Text(
  //             'English',
  //             style: TextStyle(
  //               fontFamily: context.fontFamilyEn(),
  //               color: context.locale == const Locale('en')
  //                   ? AppColor.primaryAppColor(context)
  //                   : AppColor.textColor(context),
  //             ),
  //           ),
  //         ),
  //       ],
  //       cancelButton: CupertinoActionSheetAction(
  //         child: Text(
  //           AppLocaleKey.cancel.tr(),
  //           style: TextStyle(
  //             color: Colors.black,
  //             fontSize: 16,
  //             fontWeight: FontWeight.w700,
  //             fontFamily: context.fontFamily(),
  //           ),
  //         ),
  //         onPressed: () {
  //           Navigator.of(context).pop();
  //         },
  //       ),
  //     ),
  //   );
  // }

  static CancelFunc showCartToast({
    required String message,
    String? title,
    VoidCallback? onCartTap,
  }) {
    return BotToast.showCustomNotification(
      duration: const Duration(days: 1),
      crossPage: false,
      backButtonBehavior: BackButtonBehavior.none,

      enableSlideOff: false,
      toastBuilder: (cancelFunc) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: AbsorbPointer(
            absorbing: false, // ✅ كده التوست ما يمنعش لمس باقي الشاشة
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: 330,
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xff01A0E2),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.check_circle, color: Colors.white),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        message,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        cancelFunc();
                        if (onCartTap != null) onCartTap();
                      },
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 30),
                    GestureDetector(
                      onTap: cancelFunc,
                      child: const Icon(Icons.close, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // static CancelFunc showCartToast({
  //   required String message,
  //   String? title,
  //   VoidCallback? onCartTap,
  // }) {
  //   return BotToast.showCustomNotification(
  //     duration: const Duration(days: 1),
  //     crossPage: false,
  //     backButtonBehavior: BackButtonBehavior.none,
  //     toastBuilder: (cancelFunc) {
  //       return Align(
  //         alignment: Alignment.bottomCenter,
  //         child: Material(
  //           color: Colors.transparent,
  //           child: Container(
  //             width: 330,
  //             margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  //             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
  //             decoration: BoxDecoration(
  //               color: const Color(0xff01A0E2),
  //               borderRadius: BorderRadius.circular(12),
  //               boxShadow: [
  //                 BoxShadow(
  //                   color: Colors.black.withOpacity(0.2),
  //                   blurRadius: 6,
  //                   offset: const Offset(0, 3),
  //                 )
  //               ],
  //             ),
  //             child: Row(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 const Icon(Icons.check_circle, color: Colors.white),
  //                 const SizedBox(width: 10),
  //                 Expanded(
  //                   child: Text(
  //                     message,
  //                     style: const TextStyle(color: Colors.white, fontSize: 14),
  //                   ),
  //                 ),
  //                 const SizedBox(width: 10),
  //                 GestureDetector(
  //                   onTap: () {
  //                     cancelFunc();
  //                     if (onCartTap != null) onCartTap();
  //                   },
  //                   child: const Icon(Icons.shopping_cart, color: Colors.white),
  //                 ),
  //                 const SizedBox(width: 30),
  //                 GestureDetector(
  //                   onTap: cancelFunc,
  //                   child: const Icon(Icons.close, color: Colors.white),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // static CancelFunc showCartToast({
  //   required String message,
  //   String? title,
  //   VoidCallback? onCartTap,
  // }) {
  //   return BotToast.showCustomNotification(
  //       duration: const Duration(days: 1),
  //       crossPage: false,
  //       backButtonBehavior: BackButtonBehavior.none, // مايقفلش لما تدوس Back
  //       toastBuilder: (cancelFunc) {
  //         return IgnorePointer(
  //           ignoring: false, // نستقبل اللمس داخل التوست بس
  //           child: Align(
  //             alignment: Alignment.bottomCenter,
  //             child: Material(
  //               color: Colors.transparent,
  //               child: Container(
  //                 width: 330,
  //                 margin:
  //                     const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  //                 padding:
  //                     const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
  //                 decoration: BoxDecoration(
  //                   color: Color(0xff01A0E2),
  //                   borderRadius: BorderRadius.circular(12),
  //                   boxShadow: [
  //                     BoxShadow(
  //                       color: Colors.black.withOpacity(0.2),
  //                       blurRadius: 6,
  //                       offset: const Offset(0, 3),
  //                     )
  //                   ],
  //                 ),
  //                 child: Row(
  //                   mainAxisSize: MainAxisSize.min,
  //                   children: [
  //                     const Icon(Icons.check_circle, color: Colors.white),
  //                     const SizedBox(width: 10),
  //                     Expanded(
  //                       child: Text(
  //                         message,
  //                         style: const TextStyle(
  //                             color: Colors.white, fontSize: 14),
  //                       ),
  //                     ),
  //                     const SizedBox(width: 10),
  //                     GestureDetector(
  //                       onTap: () {
  //                         cancelFunc(); // زر الكارت
  //                         if (onCartTap != null) onCartTap();
  //                       },
  //                       child: const Icon(Icons.shopping_cart,
  //                           color: Colors.white),
  //                     ),
  //                     const SizedBox(width: 30),
  //                     GestureDetector(
  //                       onTap: cancelFunc, // زر X
  //                       child: const Icon(Icons.close, color: Colors.white),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //         );
  //       }

  //       // toastBuilder: (cancelFunc) {
  //       //   return Align(
  //       //     alignment: Alignment.bottomCenter,
  //       //     child: Container(
  //       //       width: 330,
  //       //       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  //       //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
  //       //       decoration: BoxDecoration(
  //       //         color: Colors.teal.shade600,
  //       //         borderRadius: BorderRadius.circular(12),
  //       //         boxShadow: [
  //       //           BoxShadow(
  //       //             color: Colors.black.withOpacity(0.2),
  //       //             blurRadius: 6,
  //       //             offset: const Offset(0, 3),
  //       //           )
  //       //         ],
  //       //       ),
  //       //       child: Row(
  //       //         mainAxisSize: MainAxisSize.min,
  //       //         children: [
  //       //           const Icon(Icons.check_circle, color: Colors.white),
  //       //           const SizedBox(width: 10),
  //       //           Expanded(
  //       //             child: Text(
  //       //               message,
  //       //               style: const TextStyle(color: Colors.white, fontSize: 14),
  //       //             ),
  //       //           ),
  //       //           const SizedBox(width: 10),
  //       //           GestureDetector(
  //       //             onTap: () {
  //       //               cancelFunc(); // يروح التوست
  //       //               if (onCartTap != null) onCartTap();
  //       //             },
  //       //             child: const Icon(Icons.shopping_cart, color: Colors.white),
  //       //           ),
  //       //           const SizedBox(width: 6),
  //       //           GestureDetector(
  //       //             onTap: cancelFunc, // ❌ الزر الوحيد اللي يقفل التوست
  //       //             child: const Icon(Icons.close, color: Colors.white),
  //       //           ),
  //       //         ],
  //       //       ),
  //       //     ),
  //       //   );
  //       // },
  //       );
  // }

  // static CancelFunc showCartToast({
  //   required String message,
  //   String? title,
  //   VoidCallback? onCartTap,
  // }) {
  //   return BotToast.showCustomNotification(
  //     duration: const Duration(days: 1),
  //     toastBuilder: (cancelFunc) {
  //       return Align(
  //         alignment: Alignment.bottomCenter,
  //         child: Container(
  //           width: 330, // أو MediaQuery.of(context).size.width * 0.9
  //           margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  //           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
  //           decoration: BoxDecoration(
  //             color: Color(0xff01A0E2),
  //             borderRadius: BorderRadius.circular(12),
  //             boxShadow: [
  //               BoxShadow(
  //                 color: Colors.black.withOpacity(0.2),
  //                 blurRadius: 6,
  //                 offset: const Offset(0, 3),
  //               )
  //             ],
  //           ),
  //           child: Row(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               const Icon(Icons.check_circle, color: Colors.white),
  //               const SizedBox(width: 10),
  //               Expanded(
  //                 child: Text(
  //                   message,
  //                   style: const TextStyle(color: Colors.white, fontSize: 14),
  //                 ),
  //               ),
  //               SizedBox(width: 10.w),
  //               GestureDetector(
  //                 onTap: () {
  //                   cancelFunc();
  //                   if (onCartTap != null) onCartTap();
  //                 },
  //                 child: const Icon(Icons.shopping_cart, color: Colors.white),
  //               ),
  //               const SizedBox(width: 30),
  //               GestureDetector(
  //                 onTap: cancelFunc,
  //                 child: const Icon(Icons.close, color: Colors.white),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //     onlyOne: true,
  //     crossPage: false,
  //     align: Alignment.bottomCenter,
  //   );
  // }

  static Future<bool> hasConnection() async {
    var isConnected = await sl<InternetConnection>().hasInternetAccess;
    if (isConnected) {
      return true;
    } else {
      return false;
    }
  }

  static bool endScroll(ScrollEndNotification t, VoidCallback onEnd) {
    if (t.metrics.pixels > 0 && t.metrics.atEdge) {
      onEnd.call();
    }
    return true;
  }
}
