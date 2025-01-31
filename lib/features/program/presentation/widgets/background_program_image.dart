import 'package:flutter/material.dart';
import 'package:uniqcast/core/constants/app_sizes.dart';

class BackgroundProgramImage extends StatelessWidget {
  const BackgroundProgramImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ShaderMask(
        shaderCallback: (rect) {
          return LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [Colors.black, Colors.transparent],
          ).createShader(Rect.fromLTRB(
            0,
            0,
            rect.width,
            rect.height,
          ));
        },
        blendMode: BlendMode.dstIn,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(AppSizes.defaultBorderRadius),
            bottomRight: Radius.circular(AppSizes.defaultBorderRadius),
          ),
          child: Image.network(
            'https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg',
            height: 90,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
