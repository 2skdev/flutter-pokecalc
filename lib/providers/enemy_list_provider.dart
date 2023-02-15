import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../misc/preferences.dart';
import '../models/theory_model.dart';
import 'theory_list_provider_mixin.dart';

class EnemyListProvider extends StateNotifier<List<Theory>>
    with TheoryListProviderMixin {
  @override
  final String key = Preference.kEnemiesKey;

  EnemyListProvider() : super([]);
}

final enemyListProvider =
    StateNotifierProvider<EnemyListProvider, List<Theory>>(
  (_) => EnemyListProvider(),
);
