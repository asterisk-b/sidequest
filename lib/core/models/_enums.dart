import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:line_icons/line_icons.dart';

enum UIStatus { idle, loading, failure, success }

enum QuestStatus implements Comparable<QuestStatus> {
  @JsonValue('idle')
  idle(label: 'Idle', description: ''),
  @JsonValue('ongoing')
  ongoing(label: 'Ongoing', description: ''),
  @JsonValue('done')
  done(label: 'Done', description: ''),
  @JsonValue('terminated')
  terminated(label: 'Terminated', description: ''),
  @JsonValue('cancelled')
  cancelled(label: '', description: '');

  const QuestStatus({required this.label, required this.description});

  final String label;
  final String description;

  @override
  int compareTo(QuestStatus other) => label.compareTo(other.label);
}

enum QuestTypes implements Comparable<QuestTypes> {
  @JsonValue('solo')
  solo(label: 'Solo', official: true),

  @JsonValue('any')
  any(label: 'All', official: false),

  @JsonValue('squad')
  squad(label: 'Squad', official: true);

  const QuestTypes({required this.label, this.official = false});

  final String label;
  final bool official;

  @override
  int compareTo(QuestTypes other) => label.compareTo(other.label);
}

enum WalletCurrency implements Comparable<WalletCurrency> {
  @JsonValue('gold')
  gold(label: 'Gold', color: Colors.orange, icon: LineIcons.coins),

  @JsonValue('gem')
  gem(label: 'Gem', color: Colors.red, icon: LineIcons.gem);

  const WalletCurrency({
    required this.label,
    required this.color,
    required this.icon,
  });

  final String label;
  final Color color;
  final IconData icon;

  @override
  int compareTo(WalletCurrency other) => label.compareTo(other.label);
}

enum QuestDifficulty implements Comparable<QuestDifficulty> {
  @JsonValue('sss')
  sss(label: 'SSS', baseExp: 500, growthFactor: 1.2),
  @JsonValue('ss')
  ss(label: 'SS', baseExp: 400, growthFactor: 1.175),
  @JsonValue('s')
  s(label: 'S', baseExp: 300, growthFactor: 1.15),
  @JsonValue('a')
  a(label: 'A', baseExp: 200, growthFactor: 1.125),
  @JsonValue('b')
  b(label: 'B', baseExp: 180, growthFactor: 1.1),
  @JsonValue('c')
  c(label: 'C', baseExp: 170, growthFactor: 1.075),
  @JsonValue('d')
  d(label: 'D', baseExp: 160, growthFactor: 1.05),
  @JsonValue('e')
  e(label: 'E', baseExp: 140, growthFactor: 1.025),
  @JsonValue('f')
  f(label: 'F', baseExp: 120, growthFactor: 1.01);

  const QuestDifficulty({
    required this.label,
    required this.growthFactor,
    required this.baseExp,
  });

  final String label;
  final double growthFactor;
  final double baseExp;

  @override
  int compareTo(QuestDifficulty other) => label.compareTo(other.label);
}
