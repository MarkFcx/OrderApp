import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'configs/colors.dart';
import 'configs/configs.dart';
import 'generated/l10n.dart';
import 'routes.dart';
import 'package:oktoast/oktoast.dart';
import 'package:get/get.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:sqflite/sqflite.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const GapSenseApplication());
}

class GapSenseApplication extends StatefulWidget {
  const GapSenseApplication({Key? key}) : super(key: key);

  @override
  State<GapSenseApplication> createState() => _GapSenseApplicationState();
}

class _GapSenseApplicationState extends State<GapSenseApplication> {
  late StreamSubscription<double> _subscription;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    Routes.initRouter();

    return ScreenUtilInit(
      // 设计稿中的尺寸，原型是以iPad Air为模板设计的，逻辑像素为 1180 * 820
      designSize: const Size(1180, 820),
      // 不支持分屏
      splitScreenMode: false,
      // 根据宽度/高度中的最小值适配文字
      minTextAdapt: true,
      builder: (context, child) {
        return OKToast(
          child: GetMaterialApp(
            title: '江南麓苑',
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            theme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.grey,
              appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle.light,
                backgroundColor: GapSenseColors.primaryBackground,
                elevation: 0,
              ),
              scaffoldBackgroundColor: GapSenseColors.primaryBackground,
              focusColor: GapSenseColors.focusColor,
              inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyle(
                  color: GapSenseColors.inputTextColor,
                  fontFamily: 'PingFangSC',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                ),
                filled: true,
                fillColor: GapSenseColors.inputBackground,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(
                      color: GapSenseColors.inputBackground, width: 3.w),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(
                      color: GapSenseColors.inputBackground, width: 3.w),
                ),
              ),
              visualDensity: VisualDensity.standard,
            ),
            onGenerateRoute: Routes.router?.generator,
          ),
        );
      },
    );
  }
}
