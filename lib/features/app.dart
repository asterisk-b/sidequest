import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sidequest/core/_router/router.dart';
import 'package:sidequest/core/bloc/app_settings/app_settings_cubit.dart';
import 'package:sidequest/core/bloc/authentication/authentication_bloc.dart';
import 'package:sidequest/core/bloc/user/user_cubit.dart';
import 'package:sidequest/core/theme/theme.dart';
import 'package:sidequest/injection.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AppSettingsCubit()),
        BlocProvider(create: (_) => gt<AuthenticationBloc>()),
        BlocProvider(create: (_) => gt<UserCubit>()),
      ],
      child: const _AppView(),
    );
  }
}

class _AppView extends StatefulWidget {
  const _AppView();

  @override
  State<_AppView> createState() => _AppViewState();
}

class _AppViewState extends State<_AppView> {
  final AppTheme _appTheme = AppTheme();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BlocBuilder<AppSettingsCubit, AppSettingsState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: BrandNavigation.router,
            title: 'Sidequest',
            debugShowCheckedModeBanner: false,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            locale: context.locale,
            themeMode: state.mode,
            theme: _appTheme.light,
            darkTheme: _appTheme.dark,
          );
        },
      ),
    );
  }
}
