part of 'widgets_import.dart';

class OnboardThird extends StatelessWidget {
  const OnboardThird({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          MyAssets.assetsImagesOnboard3,
          width: 333.w,
          height: 333.h,
        ),
        'Explore a wide selection of categories, or use the search bar to find specific topics'
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
