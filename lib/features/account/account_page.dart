import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sidequest/core/_router/router.dart';
import 'package:sidequest/core/widgets/brand_card.dart';
import 'package:sidequest/features/account/widgets/appbar.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            shape: const RoundedRectangleBorder(),
            pinned: true,
            floating: true,
            expandedHeight: 250,
            flexibleSpace: const FlexibleSpaceBar(
              background: AccountPageAppBar(),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  context.push('$accountPath/$editProfilePath');
                },
                icon: const Icon(Icons.edit, size: 18),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BrandCard(
                    title: 'Contact Information',
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () {},
                          title: Text(
                            'Delivery Address',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          trailing: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('bis diin'),
                              SizedBox(width: 8),
                              Icon(Icons.chevron_right, size: 18),
                            ],
                          ),
                        ),
                        const Divider(height: 0, thickness: 0),
                        ListTile(
                          onTap: () {},
                          title: Text(
                            'Contact Number',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          trailing: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('sam**********'),
                              SizedBox(width: 8),
                              Icon(Icons.chevron_right, size: 18),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  BrandCard(
                    title: 'Identity Verification',
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () {},
                          title: Text(
                            'Name',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          trailing: Text(
                            'View',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        const Divider(height: 0, thickness: 0),
                        ListTile(
                          onTap: () {},
                          title: Text(
                            'Address',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          trailing: Text(
                            'View',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        const Divider(height: 0, thickness: 0),
                        ListTile(
                          title: Text(
                            'ID Number',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          trailing: const Text('************23'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  BrandCard(
                    title: 'Security',
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () {},
                          title: Text(
                            'Email Address',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          trailing: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('sam**********'),
                              SizedBox(width: 8),
                              Icon(Icons.chevron_right, size: 18),
                            ],
                          ),
                        ),
                        const Divider(height: 0, thickness: 0),
                        ListTile(
                          onTap: () {},
                          title: Text(
                            'Phone Number',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          trailing: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('*********76'),
                              SizedBox(width: 8),
                              Icon(Icons.chevron_right, size: 18),
                            ],
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          title: Text(
                            'Two Factor Verification',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          trailing: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Enabled'),
                              SizedBox(width: 8),
                              Icon(Icons.chevron_right, size: 18),
                            ],
                          ),
                        ),
                        const Divider(height: 0, thickness: 0),
                        ListTile(
                          onTap: () {},
                          title: Text(
                            'Password',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          trailing: const Icon(Icons.chevron_right, size: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
