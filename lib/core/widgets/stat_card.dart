import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  final Widget icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 17,
          child: icon,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title),
            Text(value),
          ],
        )
      ],
    );
  }
}
