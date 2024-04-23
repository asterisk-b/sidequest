import 'dart:math';

import 'package:sidequest/core/models/level.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SystemManager {
  late final LevelModel level;

  bool _initialized = false;
  SystemManager._();
  static final SystemManager _instance = SystemManager._();

  static SystemManager get instance {
    assert(_instance._initialized, 'System manager not initialized');
    return _instance;
  }

  static Future<void> initialize({
    required String levelConfigurationVersionId,
  }) async {
    assert(!_instance._initialized, 'This instance is already initialized');

    final levelData = await Supabase.instance.client
        .schema('levels')
        .from('configurations')
        .select()
        .eq('id', levelConfigurationVersionId)
        .limit(1)
        .single();

    _instance._init(levelData);
  }

  void _init(Map<String, dynamic> json) {
    level = LevelModel.fromJson(json);

    _initialized = true;
  }

  double getExperienceFromLevel({required int level}) {
    final total =
        this.level.baseExpGain * (pow(level, this.level.expGrowthFactor));

    return total;
  }
}
