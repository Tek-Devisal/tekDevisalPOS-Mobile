import 'package:flutter/material.dart';
import 'package:tekDevisalPOS/core/extensions/dimension_extensions.dart';

import '../../utils/constants.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
    this.size,
    this.imageHeight,
    this.fontSize,
    this.top,
    this.alignment = Alignment.center,
  });

  const Logo.custom({
    super.key,
    required this.size,
    required this.imageHeight,
    required this.fontSize,
    required this.top,
    required this.alignment,
  });

  final Size? size;
  final double? imageHeight;
  final double? fontSize;
  final double? top;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    final cs = MediaQuery.of(context).size;
    return Align(
      alignment: alignment,
      child: SizedBox(
        width: size?.width.adapt(cs.width) ?? 137.adapt(cs.width),
        height: size?.height.adapt(cs.height) ?? 60.adapt(cs.height),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Positioned(
              right: 0,
              top: top?.adapt(cs.height) ?? 18.adapt(cs.height),
              child: Text(
                'POS',
                style: TextStyle(
                  fontFamily: "Quicksand_bold",
                  fontSize: fontSize?.adapt(cs.height) ?? 32.adapt(cs.height),
                  fontWeight: FontWeight.w700,
                  letterSpacing: .01,
                ),
              ),
            ),
            Positioned(
              left: 0,
              child: Image.asset(
                '$kImageRoot/logo.png',
                height: imageHeight ?? 60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
