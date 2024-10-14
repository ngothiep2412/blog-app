part of 'common_widgets_import.dart';

class OutlineButton extends StatelessWidget {
  const OutlineButton({
    required this.title,
    required this.onPressed,
    super.key,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        minimumSize: Size(MediaQuery.of(context).size.width, 44.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.r),
          side: const BorderSide(
            color: MyColors.white,
          ),
        ),
      ),
      onPressed: onPressed,
      child: title.text
          .size(16.sp)
          .fontWeight(FontWeight.w700)
          .color(Colors.white)
          .make(),
    );
  }
}
