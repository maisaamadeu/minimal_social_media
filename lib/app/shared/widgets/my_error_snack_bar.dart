import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> myErrorSnackBar(
    BuildContext context, String result) {
  ColorScheme colorScheme = Theme.of(context).colorScheme;
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        result,
        style: TextStyle(
          color: colorScheme.primary,
        ),
      ),
      backgroundColor: colorScheme.inversePrimary,
    ),
  );
}
