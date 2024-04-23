import 'package:flutter/material.dart';
import 'package:sidequest/core/widgets/brand_card.dart';

class SecurityStatusCard extends StatelessWidget {
  const SecurityStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BrandCard(
      title: 'Security',
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        ListTile(
          onTap: () {},
          title: Text(
            '2-Step Verification',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          trailing: const Text('Off'),
        ),
        ListTile(
          onTap: () {},
          title: Text(
            'Email Verification',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          trailing: const Text('Verified'),
        ),
        ListTile(
          onTap: () {},
          title: Text(
            'Password',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          trailing: const Text('Last changed Jun 27, 2023'),
        ),
        ListTile(
          onTap: () {},
          title: Text(
            'Recovery Phone',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          trailing: const Text('09123456789'),
        ),
      ]),
    );
  }
}
