import 'package:blog_app/core/constants/my_strings.dart';
import 'package:blog_app/core/themes/app_themes.dart';
import 'package:blog_app/presentation/blocs/language/language_bloc.dart';
import 'package:blog_app/presentation/router/router_imports.dart';
import 'package:blog_app/presentation/screens/general/profile/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:velocity_bloc/cubit/velocity_cubit/velocity_cubit.dart';

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
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => VelocityBloc<ProfileModel>(
                  ProfileModel(),
                ),
              ),
              BlocProvider(
                create: (context) => LanguageBloc(),
              )
            ],
            child: BlocBuilder<LanguageBloc, LanguageState>(
                builder: (context, state) {
              return MaterialApp.router(
                locale: state.locale,
                debugShowCheckedModeBanner: false,
                title: MyStrings.appName,
                theme: AppThemes.light,
                darkTheme: AppThemes.dark,
                routerConfig: _appRouter.config(),
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en', 'US'),
                  Locale('vi', 'VN'),
                ],
              );
            }),
          ),
        );
      },
    );
  }
}
