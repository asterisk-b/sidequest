import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sidequest/core/bloc/app_settings/app_settings_cubit.dart';
import 'package:sidequest/core/widgets/brand_card.dart';
import 'package:sidequest/core/widgets/brand_scaffold.dart';
import 'package:sidequest/features/home/account/bloc/account_cubit.dart';
import 'package:sidequest/injection.dart';
import 'package:sidequest/repositories/auth_repository.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountCubit>(
      create: (context) => AccountCubit(gt<AuthRepository>()),
      child: BrandScaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              // onPressed: () => context.go('/auth/register'),
              style: TextButton.styleFrom(
                minimumSize: const Size(
                  double.minPositive,
                  double.minPositive,
                ),
              ),
              child: const Text('Sign Up'),
            ),
          ),
        ),
        child: SingleChildScrollView(
          primary: true,
          child: Column(
            children: [
              BrandCard(
                child: Column(
                  children: [
                    const Text("aw"),
                    const Text("aw"),
                    const Text("aw"),
                    const Text("aw"),
                    const Text("aw"),
                    const Text("aw"),
                    const Text("aw"),
                  ],
                ),
              ),
              const Text("aw"),
              const Text("aw"),
              const Text("aw"),
              const Text("aw"),
              const Text("aw"),
              const Text("aw"),
              const Text("aw"),
              const Text("aw"),
              const Text("aw"),
              const Text("aw"),
              const Text("aw"),
              const Text("aw"),
              const Text("aw"),
              const Text("aw"),
              const Text("aw"),
              const Text("aw"),
              const Text("END"),
              const _AccountView(),
              const _AccountView(),
            ],
          ),
        ),
      ),
    );
  }
}

class _AccountView extends StatelessWidget {
  const _AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              context.read<AppSettingsCubit>().switchTheme(ThemeMode.dark);
            },
            child: const Text('Dark')),
        ElevatedButton(
            onPressed: () {
              context.read<AppSettingsCubit>().switchTheme(ThemeMode.light);
            },
            child: const Text('Light')),
        ElevatedButton(
            onPressed: () {
              context.read<AppSettingsCubit>().switchTheme(ThemeMode.system);
            },
            child: const Text('System')),
        TextButton(
            onPressed: () => context.read<AccountCubit>().logout(),
            child: const Text('Sign Out')),
      ],
    );
  }
}
