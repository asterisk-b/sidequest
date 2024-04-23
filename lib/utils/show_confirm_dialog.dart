import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sidequest/utils/floating_dialog_wrapper.dart';

Future<void> showConfirmDialog(
  BuildContext context, {
  required String message,
  required VoidCallback onConfirm,
  VoidCallback? onCancel,
}) async {
  final result = await showCustomModalBottomSheet(
    context: context,
    useRootNavigator: true,
    enableDrag: false,
    expand: false,
    duration: const Duration(milliseconds: 250),
    builder: (context) => _content(
      context,
      message: message,
      onConfirm: onConfirm,
      onCancel: onCancel,
    ),
    containerWidget: (context, animation, child) {
      return FloatingDialogWrapper(child: child);
    },
  );

  return result;
}

Widget _content(
  BuildContext context, {
  required String message,
  required VoidCallback onConfirm,
  VoidCallback? onCancel,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Padding(
        padding: const EdgeInsets.all(20),
        child: Align(alignment: Alignment.topLeft, child: Text(message)),
      ),
      Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                if (onCancel != null) onCancel();
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minimumSize: const Size(double.maxFinite, 60),
                shape: const RoundedRectangleBorder(),
              ),
              child: Text(
                'Cancel',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                onConfirm();
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minimumSize: const Size(double.maxFinite, 60),
                shape: const RoundedRectangleBorder(),
              ),
              child: const Text('Confirm'),
            ),
          ),
        ],
      ),
    ],
  );
}
