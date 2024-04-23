import 'package:flutter/material.dart';
import 'package:sidequest/core/widgets/brand_card.dart';

class OtherLinks extends StatelessWidget {
  const OtherLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return BrandCard(
      title: 'Others',
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        ListTile(
          onTap: () {},
          title: Text(
            'Help Center',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          trailing: const Icon(Icons.chevron_right, size: 18),
        ),
        const Divider(height: 0, thickness: 0),
        ListTile(
          onTap: () {},
          title: Text(
            'About Us',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          trailing: const Icon(Icons.chevron_right, size: 18),
        ),
        const Divider(height: 0, thickness: 0),
        ListTile(
          onTap: () {},
          title: Text(
            'Privacy Policy',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          trailing: const Icon(Icons.chevron_right, size: 18),
        ),
        const Divider(height: 0, thickness: 0),
        ListTile(
          onTap: () {},
          title: Text(
            'Terms of Service',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          trailing: const Icon(Icons.chevron_right, size: 18),
        ),
        const Divider(height: 0, thickness: 0),
        ListTile(
          onTap: () {},
          title: Text(
            'Disclaimer',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          trailing: const Icon(Icons.chevron_right, size: 18),
        ),
      ]),
    );
  }
}
