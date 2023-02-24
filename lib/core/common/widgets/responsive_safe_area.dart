import 'package:flutter/material.dart';

typedef ResponsiveBuilder = Widget Function(
  BuildContext context,
  Size size,
);

class ResponsiveSafeArea extends StatelessWidget {
  const ResponsiveSafeArea({super.key, required this.builder});

  final ResponsiveBuilder builder;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, cs) => builder(context, cs.biggest),
      ),
    );
  }
}
