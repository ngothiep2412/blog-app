import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CachedImageWidget extends StatelessWidget {
  const CachedImageWidget({
    super.key,
    required this.imgUrl,
    this.imgHeight,
    this.imgWidth,
    this.boxFit,
  });

  final String imgUrl;
  final double? imgHeight;
  final double? imgWidth;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return CachedNetworkImage(
      imageUrl: imgUrl,
      height: imgHeight ?? size.height * 0.3,
      width: imgWidth ?? size.width * 0.2,
      fit: boxFit ?? BoxFit.cover,
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        color: Colors.red,
      ),
    );
  }
}
