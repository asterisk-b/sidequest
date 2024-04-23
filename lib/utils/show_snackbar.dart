import 'package:flutter/material.dart';

Future<void> showSnackbar(
  BuildContext context, {
  required String message,
}) async {
  SnackBar snackBar = SnackBar(
    content: Text(message),
    dismissDirection: DismissDirection.horizontal,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(
      bottom: MediaQuery.of(context).size.height - 120,
      left: 10,
      right: 10,
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
