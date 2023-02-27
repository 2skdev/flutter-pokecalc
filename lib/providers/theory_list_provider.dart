import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../misc/preferences.dart';
import '../models/theory_model.dart';
import 'theory_list_provider_mixin.dart';

class TheoryListProvider extends StateNotifier<List<Theory>>
    with TheoryListProviderMixin {
  @override
  final key = PreferenceKeys.theories;

  TheoryListProvider() : super([]);
}

final theoryListProvider =
    StateNotifierProvider<TheoryListProvider, List<Theory>>(
  (_) => TheoryListProvider(),
);
