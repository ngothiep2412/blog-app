part of 'splash_imports.dart';

@RoutePage()
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    moveToOnboard();
    super.initState();
  }

  void moveToOnboard() async {
    await Future.delayed(const Duration(seconds: 2), () {
      Utils.manipulateLogin(context);
      // AutoRouter.of(context).push(
      //   const OnboardRoute(),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: Center(
        child: FadedScaleAnimation(
          child: Image.asset(
            MyAssets.assetsImagesLogo,
            width: 139.w,
            height: 42.h,
          ),
        ),
      ),
    );
  }
}
