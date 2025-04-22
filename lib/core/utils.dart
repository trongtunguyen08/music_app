import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String contentText) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(content: Text(contentText, style: TextStyle(fontSize: 17.0))),
    );
}
