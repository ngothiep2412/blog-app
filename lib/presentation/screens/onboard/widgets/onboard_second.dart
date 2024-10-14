part of 'widgets_import.dart';

class OnboardSecond extends StatelessWidget {
  const OnboardSecond({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          MyAssets.assetsImagesOnboard2,
          width: 333.w,
          height: 333.h,
        ),
        'Customize your reading experience and join the conversation by creating an account.'
            .text
            .size(15.sp)
            .align(TextAlign.center)
            .color(Colors.black)
            .fontWeight(FontWeight.w500)
            .make(),
      ],
    );
  }
}
