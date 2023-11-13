import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:extended_image/extended_image.dart';

import '../constants/app_colors.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage(
      {super.key,
      required this.url,
      this.borderRadius,
      this.maxByte,
      required this.height,
      required this.width});
  final String url;
  final int? maxByte;
  final BorderRadius? borderRadius;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(0),
        child: ExtendedImage.network(
          url,
          height: height,
          width: width,
          fit: BoxFit.cover,
          cache: true,
          maxBytes: maxByte ?? 100000,
          loadStateChanged: (state) {
            switch (state.extendedImageLoadState) {
              case LoadState.loading:
                return Shimmer.fromColors(
                    baseColor: AppColors.greyAccent,
                    highlightColor: AppColors.white,
                    child: Container(
                      color: AppColors.white,
                    ));
              case LoadState.failed:
                return const Icon(Icons.report_gmailerrorred);
              default:
                return null;
            }
          },
        ),
      ),
    );
  }
}
