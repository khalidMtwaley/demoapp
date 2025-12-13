import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'core/theme/cubit/app_theme_cubit.dart';
import 'core/theme/theme_enum.dart';
import 'package:easy_localization/easy_localization.dart';
import 'app.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  await Hive.initFlutter();
  await ScreenUtil.ensureScreenSize();
  Hive.registerAdapter(ThemeEnumAdapter());
  await Hive.openBox('app');

  timeago.setLocaleMessages('en', timeago.EnMessages());
  timeago.setLocaleMessages('en_short', timeago.EnShortMessages());
  timeago.setLocaleMessages('ar', timeago.ArMessages());
  timeago.setLocaleMessages('ar_short', timeago.ArShortMessages());
  
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      path: 'i18n',
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('ar'),
      saveLocale: true,
      child: BlocProvider(
        create: (context) => AppThemeCubit()..initial(),
        child: const Demoapp(),
      ),
    ),
  );
}
