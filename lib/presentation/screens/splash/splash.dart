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
    await Future.delayed(const Duration(seconds: 4), () {
      AutoRouter.of(context).push(
        const OnboardRoute(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: Center(
        child: FadedScaleAnimation(
          child: Image.asset(
            'assets/images/logo.png',
            width: 139,
            height: 42,
          ),
        ),
      ),
    );
  }
}
