import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/theory.dart';
import 'preferences.dart';
import 'theory_list_state_mixin.dart';

class TheoriesNotifier extends StateNotifier<List<Theory>> with TheoryList {
  TheoriesNotifier() : super([]) {
    init(Preference.kTheoriesKey);
  }
}

final theoriesNotifier = StateNotifierProvider<TheoriesNotifier, List<Theory>>(
  (_) => TheoriesNotifier(),
);
