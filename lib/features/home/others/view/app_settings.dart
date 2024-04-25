import 'package:easy_localization/easy_localization.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sidequest/core/bloc/app_settings/app_settings_cubit.dart';
import 'package:sidequest/core/models/_enums.dart';
import 'package:sidequest/core/widgets/brand_card.dart';
import 'package:sidequest/core/widgets/separated_column.dart';
import 'package:sidequest/utils/show_confirm_dialog.dart';
import 'package:sidequest/utils/show_select_dialog.dart';

class AppSettingsCard extends StatelessWidget {
  const AppSettingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BrandCard(
      title: 'app_settings.title'.tr(),
      child: SeparatedColumn(
        mainAxisSize: MainAxisSize.min,
        separatorBuilder: (_, index) => const Divider(height: 0, thickness: 0),
        children: [
          BlocBuilder<AppSettingsCubit, AppSettingsState>(
            buildWhen: (p, c) => p.mode != c.mode,
            builder: (context, state) {
              return ListTile(
                onTap: () {
                  showSelectDialog(
                    context,
                    title: 'app_settings.theme.select_title'.tr(),
                    value: state.mode,
                    items:
                        ThemeMode.values.map<DropdownMenuItem<ThemeMode>>((e) {
                      return DropdownMenuItem<ThemeMode>(
                        value: e,
                        child: Text(e.name.capitalize),
                      );
                    }).toList(),
                    onSelect: (theme) {
                      context.read<AppSettingsCubit>().switchTheme(theme);
                    },
                  );
                },
                title: Text(
                  'app_settings.theme.label'.tr(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(state.mode.name.capitalize),
                    const SizedBox(width: 8),
                    const Icon(Icons.expand_more, size: 18),
                  ],
                ),
              );
            },
          ),
          ListTile(
            onTap: () {
              showSelectDialog(
                context,
                title: 'app_settings.language.select_title'.tr(),
                value: context.locale,
                items: context.supportedLocales.map((e) {
                  return DropdownMenuItem<Locale>(
                    value: e,
                    child: Text(e.languageCode),
                  );
                }).toList(),
                onSelect: (locale) => context.setLocale(locale),
              );
            },
            title: Text(
              'app_settings.language.label'.tr(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('app_settings.language.language'.tr()),
                const SizedBox(width: 8),
                const Icon(Icons.expand_more, size: 18),
              ],
            ),
          ),
          BlocBuilder<AppSettingsCubit, AppSettingsState>(
            buildWhen: (p, c) => p.startScreen != c.startScreen,
            builder: (context, state) {
              return ListTile(
                onTap: () {
                  showSelectDialog(
                    context,
                    title: 'app_settings.start_screen.select_title'.tr(),
                    value: state.startScreen,
                    items: StartScreens.values.map((e) {
                      return DropdownMenuItem<StartScreens>(
                        value: e,
                        child: Text(e.label),
                      );
                    }).toList(),
                    onSelect: (screen) {
                      context
                          .read<AppSettingsCubit>()
                          .switchStartScreen(screen);
                    },
                  );
                },
                title: Text(
                  'app_settings.start_screen.label'.tr(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(state.startScreen.label),
                    const SizedBox(width: 8),
                    const Icon(Icons.expand_more, size: 18),
                  ],
                ),
              );
            },
          ),
          ListTile(
            onTap: () {
              showConfirmDialog(
                context,
                message: 'Are you sure you want to reset settings to default?',
                onConfirm: () {
                  context.read<AppSettingsCubit>().resetSettings();
                },
              );
            },
            title: Text(
              'app_settings.reset.label'.tr(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
