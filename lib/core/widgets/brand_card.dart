import 'package:flutter/material.dart';

class BrandCard extends StatelessWidget {
  final bool _isFlat;
  final BorderRadius _radius;

  final Widget child;
  final Widget? extra;
  final String? title;
  final EdgeInsets? padding;

  const BrandCard({
    super.key,
    required this.child,
    this.extra,
    this.title,
    this.padding,
  })  : _isFlat = false,
        _radius = const BorderRadius.all(Radius.circular(5));

  const BrandCard.flat({
    super.key,
    required this.child,
    this.extra,
    this.title,
    this.padding,
  })  : _isFlat = true,
        _radius = const BorderRadius.all(Radius.zero);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null
            ? Padding(
                padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
                child: Text(
                  title ?? '',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              )
            : const SizedBox.shrink(),
        Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          color: Theme.of(context).dividerColor.withAlpha(50),
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: _radius,
            side: _isFlat
                ? BorderSide.none
                : BorderSide(
                    width: 1,
                    strokeAlign: 0,
                    color: Theme.of(context).dividerColor),
          ),
          child: Container(
            width: double.maxFinite,
            padding: padding,
            child: child,
          ),
        ),
      ],
    );
  }
}
