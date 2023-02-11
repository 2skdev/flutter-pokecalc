import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/theory.dart';
import 'preferences.dart';
import 'theory_list_state_mixin.dart';

class EnemiesNotifier extends StateNotifier<List<Theory>> with TheoryList {
  EnemiesNotifier() : super([]) {
    init(Preference.kEnemiesKey);
  }
}

final enemiesNotifier = StateNotifierProvider<EnemiesNotifier, List<Theory>>(
  (_) => EnemiesNotifier(),
);
