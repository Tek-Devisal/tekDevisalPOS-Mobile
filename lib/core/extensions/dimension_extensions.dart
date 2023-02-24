// coverage:ignore-file

import 'package:kamran/core/utils/constants.dart';

extension AdaptiveDimension<T extends num> on T {
  /// takes either the current screen width or the height and the actual
  /// dimension you need to use and returns you the equivalent of the
  /// actualDimension for your current viewport
  ///
  /// e.g
  ///
  /// LayoutBuilder(
  ///       builder: (context, constraints) {
  ///         return Scaffold(
  ///           body: Container(
  ///             padding: EdgeInsets.symmetric(
  ///               vertical: Dimensions.call(
  ///                   height: constraints.maxHeight,
  ///                   actualDimension: 20,
  ///               ),
  ///               horizontal: Dimensions.call(
  ///                 width: constraints.maxWidth,
  ///                 actualDimension: 20,
  ///               ),
  ///             ),
  ///           ),
  ///         );
  ///       },
  ///     );
  ///
  /// the [width] is usually given when the dimension you are trying to set
  /// is a horizontal one, like a padding to the left or right, or a container
  /// width, or a radius.
  ///
  /// whereas the [height] is usually given when the dimension you are trying
  /// to set is a vertical one, like a padding to the top or bottom, or a
  /// container height, or a text fontSize.

  double adapt([double? width, double? height]) {
    assert(
      width != null || height != null,
      'Must give either the screen height or width',
    );
    assert(
      width == null || height == null,
      'Cannot give both the screen width and height, remove one of them and '
      'read the documentation for this method',
    );

    final operand = width ?? height!;
    if (operand == double.infinity) {
      throw IncorrectUseOfAdaptMethod(
        "Don't use adapt in a ListView or anything that asks for unbounded "
        'space',
      );
    }
    final factor = operand / this;
    return operand / factor;
  }

  /// Returns the percentage of the screen Height depending on the height used
  ///
  /// by the designer
  ///
  /// e.g if the designer used 50 as the height, this will divide 50 by the
  ///
  /// height of the screen model used by the designer and return the percentage
  ///
  /// of the screen height that is equivalent to 50
  double get adaptPercentHeight => this / designHeight;

  /// Returns the percentage of the screen width to be used depending on the
  ///
  /// width used by the designer
  ///
  /// e.g if the designer used 50 as the width, this will divide 50 by the
  ///
  /// width of the screen model used by the designer and return the percentage
  ///
  /// of the screen width that is equivalent to 50
  double get adaptPercentWidth => this / designWidth;

  /// Gets the [adaptPercentHeight] using provided [height]
  double adaptCustomPercentHeight(double height) => this / height;

  /// Gets the [adaptPercentHeight] using provided [width]
  double adaptCustomPercentWidth(double width) => this / width;
}

class IncorrectUseOfAdaptMethod implements Exception {
  IncorrectUseOfAdaptMethod(this.message);

  final String message;

  @override
  String toString() {
    return 'IncorrectUseOfAdaptMethod: $message';
  }
}
