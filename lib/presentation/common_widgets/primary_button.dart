part of 'common_widgets_import.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.title,
    required this.onPressed,
    this.isLoading,
    super.key,
  });

  final String title;
  final VoidCallback onPressed;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.primaryColor,
        minimumSize: Size(MediaQuery.of(context).size.width, 44.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.r),
        ),
      ),
      onPressed: onPressed,
      child: isLoading == true
          ? const CircularProgressIndicator.adaptive()
          : title.text
              .size(16.sp)
              .fontWeight(FontWeight.w700)
              .color(Colors.white)
              .make(),
    );
  }
}
