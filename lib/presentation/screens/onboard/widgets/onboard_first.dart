part of 'widgets_import.dart';

class OnboardFirst extends StatelessWidget {
  const OnboardFirst({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          MyAssets.assetsImagesOnboard1,
          width: 333.w,
          height: 333.h,
        ),
        'Discover, engage and read the latest articles as well as share your own thoughts and ideas with the community'
            .i18n
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
