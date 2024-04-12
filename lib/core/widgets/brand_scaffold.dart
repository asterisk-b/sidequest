import 'package:flutter/material.dart';

class BrandScaffold extends StatelessWidget {
  const BrandScaffold({
    super.key,
    required this.child,
    this.appBar,
    this.padding,
  });

  final Widget child;
  final AppBar? appBar;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: appBar,
        body: Container(padding: padding, child: child),
      ),
    );
  }
}
