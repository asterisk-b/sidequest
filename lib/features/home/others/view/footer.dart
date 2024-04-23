import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sidequest/core/bloc/authentication/authentication_bloc.dart';
import 'package:sidequest/utils/show_confirm_dialog.dart';

class OthersPageFooter extends StatelessWidget {
  const OthersPageFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
          onPressed: () {
            showConfirmDialog(
              context,
              message: 'Are you sure you want logout?',
              onConfirm: () {
                context
                    .read<AuthenticationBloc>()
                    .add(AuthenticationLogoutRequested());
              },
            );
          },
          style: TextButton.styleFrom(
            visualDensity: VisualDensity.compact,
            splashFactory: NoSplash.splashFactory,
          ),
          child: const Text('Sign Out'),
        ),
        const Text(
          'SideQuest 3.2.0 (4110004)',
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
