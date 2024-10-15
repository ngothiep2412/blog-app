import 'package:blog_app/core/constants/my_strings.dart';
import 'package:blog_app/core/themes/app_themes.dart';
import 'package:blog_app/presentation/router/router_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return FlavorBanner(
          color: FlavorConfig.instance.variables['primaryColor'],
          location: BannerLocation.bottomEnd,
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: MyStrings.appName,
            theme: AppThemes.light,
            darkTheme: AppThemes.dark,
            routerConfig: _appRouter.config(),
          ),
        );
      },
    );
  }
}
