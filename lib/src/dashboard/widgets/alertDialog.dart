import 'package:flutter/material.dart';

showAlertDialog(
    BuildContext context, String title, String message, final task) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text(
      "Cancel",
      style: TextStyle(
        fontFamily: "Quicksand_bold",
      ),
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
      child: Text(
        "OK",
        style: TextStyle(
          fontFamily: "Quicksand_bold",
        ),
      ),
      onPressed: task);

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      title,
      style: TextStyle(
        fontFamily: "Quicksand_bold",
      ),
    ),
    content: Text(
      message,
      style: TextStyle(
        fontFamily: "Quicksand_regular",
      ),
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showtheDialog(BuildContext context, String title, String message) {
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      title,
      style: TextStyle(
        fontFamily: "Quicksand_bold",
      ),
    ),
    content: Text(
      message,
      style: TextStyle(
        fontFamily: "Quicksand_regular",
      ),
    ),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
