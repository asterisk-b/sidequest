import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sidequest/bootstrap.dart';
import 'package:sidequest/core/_router/router.dart';
import 'package:sidequest/core/bloc/authentication/authentication_bloc.dart';
import 'package:sidequest/core/models/mngr_system.dart';
import 'package:sidequest/features/app.dart';
import 'package:sidequest/injection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  await EasyLocalization.ensureInitialized();

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON']!,
  );

  await SystemManager.initialize(
    levelConfigurationVersionId: 'f0ab6876-d9ad-45d5-9813-324e639d98ca',
  );

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  await bootstrap(() {
    injection();

    BrandNavigation.initialize(gt<AuthenticationBloc>());

    return EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('fil')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const App(),
    );
  });
}
