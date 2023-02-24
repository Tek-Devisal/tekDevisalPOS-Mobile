// coverage:ignore-file
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kamran/core/extensions/string_extensions.dart';
import 'package:kamran/core/utils/colors.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: TheColors.background),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
      ),
    );
}

Future<bool?> showConfirmationDialog(BuildContext context, String text) async {
  if (Theme.of(context).platform == TargetPlatform.iOS) {
    return showCupertinoDialog<bool>(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(text),
          content: Text('Are you sure you want to $text?'),
          actions: [
            CupertinoDialogAction(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            CupertinoDialogAction(
              child: Text(text.split(' ')[0].trim().titleCase),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );
  }
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(text),
        content: Text('Are you sure you want to $text?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Text(text.split(' ')[0].trim().titleCase),
          ),
        ],
      );
    },
  );
}

void showToast(FToast fToast, String message, {Widget? icon}) {
  final toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      color: TheColors.backColor,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon ?? const Icon(Icons.check),
        const SizedBox(
          width: 12,
        ),
        Text(message, style: const TextStyle(color: Colors.white)),
      ],
    ),
  ).animate().shimmer().shake();

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.TOP,
  );

  // Custom Toast Position
  // ..showToast(
  //   child: toast,
  //   positionedToastBuilder: (context, child) {
  //     return Positioned(
  //       top: 16,
  //       left: 16,
  //       child: child,
  //     );
  //   },
  // );
}

// void restriction(
//   BuildContext context,
//   TextEditingController controller,
//   String value,
// ) {
//   if (!value.isNumeric) {
//     controller.clear();
//     showSnackBar(
//       context,
//       'Please Enter only numbers',
//     );
//   }
// }
