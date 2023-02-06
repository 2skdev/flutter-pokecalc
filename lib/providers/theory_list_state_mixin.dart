import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../models/theory.dart';

const _uuid = Uuid();

mixin TheoryList on StateNotifier<List<Theory>> {
  Theory create() {
    final theory = Theory(key: _uuid.v4());
    add(theory);

    return theory;
  }

  void add(Theory theory) {
    if (theory.key == null || theory.key!.isEmpty) {
      theory = theory.copyWith(key: _uuid.v4());
    }
    state = [...state, theory];
  }

  Theory clone(Theory theory) {
    theory = theory.copyWith(key: _uuid.v4());
    add(theory);
    return theory;
  }

  void delete(Theory theory) {
    state = state.where((e) => e.key != theory.key).toList();
  }

  void update(Theory theory) {
    /* 選択している特性を含まない時は置き換える */
    if (theory.pokemon.abilities.firstWhereOrNull((e) => e == theory.ability) ==
        null) {
      theory = theory.copyWith(ability: theory.pokemon.abilities[0]);
    }

    if (state.firstWhereOrNull((e) => e.key == theory.key) == null) {
      /* 見つからなかった場合は追加する */
      add(theory);
    } else {
      state = state.map((e) => e.key == theory.key ? theory : e).toList();
    }
  }

  void reorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      /* 後ろに追加する場合、削除を先に行うためインデックスをひとつ前にする */
      newIndex -= 1;
    }

    final theory = state[oldIndex];
    state = [...state]
      ..removeAt(oldIndex)
      ..insert(newIndex, theory);
  }
}
