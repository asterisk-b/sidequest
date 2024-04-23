import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sidequest/utils/floating_dialog_wrapper.dart';
import 'package:sidequest/utils/show_snackbar.dart';

Future<void> showSelectDialog<T>(
  BuildContext context, {
  required List<DropdownMenuItem<T>> items,
  required ValueChanged<T> onSelect,
  bool? hideLeadingIcon,
  T? value,
  String? title,
  VoidCallback? onCancel,
}) async {
  await showCustomModalBottomSheet(
    context: context,
    useRootNavigator: true,
    enableDrag: false,
    expand: false,
    duration: const Duration(milliseconds: 250),
    builder: (context) => _content<T>(
      context,
      title: title,
      value: value,
      items: items,
      onSelect: onSelect,
      onCancel: onCancel,
      hideLeadingIcon: hideLeadingIcon ?? false,
    ),
    containerWidget: (_, __, child) {
      return FloatingDialogWrapper(child: child);
    },
  );
}

Widget _content<T>(
  BuildContext context, {
  required List<DropdownMenuItem<T>> items,
  required ValueChanged<T> onSelect,
  required bool hideLeadingIcon,
  T? value,
  String? title,
  VoidCallback? onCancel,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      title != null
          ? Padding(
              padding: const EdgeInsets.only(bottom: 8, top: 15),
              child: Text(title, style: Theme.of(context).textTheme.titleSmall),
            )
          : const SizedBox.shrink(),
      ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final isActive = value == item.value;

          return ListTile(
            onTap: () {
              final selectedValue = item.value;

              if (selectedValue == null) {
                showSnackbar(context, message: 'Invalid selected value');
              } else {
                onSelect(selectedValue);
              }

              Navigator.of(context).pop();
            },
            selected: isActive,
            leading: hideLeadingIcon
                ? null
                : isActive
                    ? const Icon(Icons.radio_button_checked, size: 18)
                    : const Icon(Icons.radio_button_unchecked, size: 18),
            title: item.child,
            titleTextStyle: Theme.of(context).textTheme.bodyMedium,
          );
        },
      ),
      const SizedBox(height: 10),
      TextButton(
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
    ],
  );
}
