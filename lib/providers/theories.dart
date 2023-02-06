import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../enums/enums.dart';
import '../models/theory.dart';
import 'theory_list_state_mixin.dart';

class TheoriesNotifier extends StateNotifier<List<Theory>> with TheoryList {
  TheoriesNotifier() : super([]) {
    add(const Theory());
    add(const Theory(pokemon: Pokedex.altaria));
  }
}

final theoriesNotifier = StateNotifierProvider<TheoriesNotifier, List<Theory>>(
  (_) => TheoriesNotifier(),
);
