import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Future<void> showPageModal(
  BuildContext context, {
  required WidgetBuilder builder,
}) async {
  await showBarModalBottomSheet(
    context: context,
    builder: builder,
  );
}
