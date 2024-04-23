import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sidequest/core/_router/router.dart';
import 'package:sidequest/core/bloc/user/user_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OthersPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OthersPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return AppBar(
          title: Row(mainAxisSize: MainAxisSize.min, children: [
            Skeletonizer(enabled: state.isLoading, child: const CircleAvatar()),
            const SizedBox(width: 10),
            Text(
              '@${state.user.userName}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ]),
          actions: [
            IconButton(
                onPressed: () => context.push(accountPath),
                icon: const Icon(Icons.chevron_right))
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
