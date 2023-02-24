import 'package:flutter/material.dart';
import 'package:kamran/core/common/widgets/spinning_loader.dart';

class ILoader extends StatelessWidget {
  const ILoader({
    super.key,
    required this.child,
    required this.loading,
    this.loadingText = 'Loading...',
    this.successText = 'Success!',
    this.success = false,
  });

  final Widget child;
  final bool loading;
  final String loadingText;
  final String successText;
  final bool success;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (loading)
          // coverage:ignore-start
          SpinningLoader(
            loadingText: loadingText,
            success: success,
            successText: successText,
            // coverage:ignore-end
          ),
      ],
    );
  }
}
