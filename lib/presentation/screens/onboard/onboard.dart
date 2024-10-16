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
  void dispose() {
    viewModel.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Image.asset(
            MyAssets.assetsImagesLogo,
            color: MyColors.primaryColor,
            width: 139.w,
            height: 42.h,
          ),
          actions: [
            IconButton(
              onPressed: () {
                AutoRouter.of(context).push(const LanguageRoute());
              },
              icon: const Icon(
                FeatherIcons.globe,
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Center(
                  //   child: Image.asset(
                  //     MyAssets.assetsImagesLogo,
                  //     color: MyColors.primaryColor,
                  //     width: 139.w,
                  //     height: 42.h,
                  //   ),
                  // ),
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
                    onPressed: () async {
                      // final SharedPreferences preferences =
                      //     await SharedPreferences.getInstance();
                      // String token = preferences.getString("token") ?? "";
                      // Vx.log(token);
                      AutoRouter.of(context).push(const AuthRoute());
                    },
                    title: "Get started".i18n,
                  ),
                  61.h.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "Skip"
                          .i18n
                          .text
                          .size(16.sp)
                          .fontWeight(FontWeight.w700)
                          .make(),
                      SmoothPageIndicator(
                        controller: viewModel.pageController,
                        count: 3,
                        effect: WormEffect(
                          activeDotColor: MyColors.primaryColor,
                          dotWidth: 8,
                          dotHeight: 8,
                        ),
                        onDotClicked: (index) {},
                      ),
                      "Next"
                          .i18n
                          .text
                          .size(16.sp)
                          .fontWeight(FontWeight.w700)
                          .make(),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
