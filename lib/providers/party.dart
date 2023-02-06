import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/party.dart';
import '../models/theory.dart';

class PartiesNotifier extends StateNotifier<List<Party>> {
  PartiesNotifier() : super([Party()]);

  void create() {
    state = [...state, Party()];
  }

  void clear(int index) {
    state = [...state]..removeAt(index);
  }

  void update({
    required int index,
    required inPartyIndex,
    TheoryKey key,
  }) {
    assert(index < state.length);
    assert(inPartyIndex < Party.maxLength);

    final newState = [...state];
    newState[index] = newState[index].update(inPartyIndex, key);
    state = newState;
  }

  void delete({
    required int index,
    required inPartyIndex,
  }) {
    assert(index < state.length);
    assert(inPartyIndex < Party.maxLength);

    final newState = [...state];
    newState[index] = newState[index].delete(inPartyIndex);
    state = newState;
  }
}

final partiesNotifier = StateNotifierProvider<PartiesNotifier, List<Party>>(
  (_) => PartiesNotifier(),
);
