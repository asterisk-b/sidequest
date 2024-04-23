import 'package:flutter/material.dart';

class FloatingDialogWrapper extends StatelessWidget {
  const FloatingDialogWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Material(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8),
        child: child,
      ),
    );
  }
}
