part of 'onboard_imports.dart';

@RoutePage()
class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  OnboardViewModel viewModel = OnboardViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  MyAssets.assetsImagesLogo,
                  color: MyColors.primaryColor,
                  width: 139.w,
                  height: 42.h,
                ),
              ),
              63.h.heightBox,
              PageView(
                controller: viewModel.pageController,
                children: const [
                  OnboardFirst(),
                  OnboardSecond(),
                  OnboardThird(),
                ],
              ).expand(),
              61.h.heightBox,
              PrimaryButton(
                onPressed: () => AutoRouter.of(context).push(const AuthRoute()),
                title: "Get started",
              ),
              61.h.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Skip".text.size(16.sp).fontWeight(FontWeight.w700).make(),
                  SmoothPageIndicator(
                    controller: viewModel.pageController,
                    count: 3,
                    effect: const WormEffect(
                      activeDotColor: MyColors.primaryColor,
                      dotWidth: 8,
                      dotHeight: 8,
                    ),
                    onDotClicked: (index) {},
                  ),
                  "Next".text.size(16.sp).fontWeight(FontWeight.w700).make(),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
