import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../misc/preferences.dart';
import '../models/theory_model.dart';

const _uuid = Uuid();

/// TheoryのCRUDのMixin
mixin TheoryListProviderMixin on StateNotifier<List<Theory>> {
  late String key;

  Future init() async {
    final list = await Preference.getTheories(key);

    if (list != null) {
      for (var e in list) {
        add(e);
      }
    }

    addListener((state) async {
      await Preference.saveTheories(key, state);
    });
  }

  /// 新しいTheoryを生成する
  ///
  /// 生成したTheoryを返す
  Theory create() {
    final theory = add(const Theory());
    return theory;
  }

  /// Theoryを追加する
  ///
  /// キーがnull、または空文字の場合に生成する
  /// [types]を[pokedex]から設定する
  ///
  /// 新しいものから降順にするため、先頭に追加する
  Theory add(Theory theory) {
    // キーを設定する
    if (theory.key == null || theory.key!.isEmpty) {
      theory = theory.copyWith(key: _uuid.v4());
    }

    // キーが重複した場合、アサート
    assert(state.firstWhereOrNull((e) => e.key == theory.key) == null);

    // 追加時にタイプの初期値を設定する
    theory = theory.copyWith(types: theory.pokemon.types);

    // 先頭に追加する
    state = [theory, ...state];

    return theory;
  }

  /// Theoryを複製する
  ///
  /// 異なるキーを生成して設定する
  /// 複製したTheoryを返す
  Theory clone(Theory theory) {
    theory = theory.copyWith(key: _uuid.v4());
    add(theory);
    return theory;
  }

  /// Theoryを削除する
  void delete(Theory theory) {
    state = state.where((e) => e.key != theory.key).toList();
  }

  /// Theoryを更新する
  ///
  /// 選択可能な特性でない場合、初期化する
  /// 特性を変更した場合に、特性のメタ情報を初期化する
  /// ポケモンが変わった時に、タイプを初期化する
  void update(Theory theory) {
    final current = state.firstWhereOrNull((e) => e.key == theory.key);

    // 選択している特性を含まない時は置き換える
    if (theory.pokemon.abilities.firstWhereOrNull((e) => e == theory.ability) ==
        null) {
      theory = theory.copyWith(ability: theory.pokemon.abilities[0]);
    }

    if (current == null) {
      // 見つからなかった場合は追加する
      add(theory);
    } else {
      // 特性が変わった時、メタを初期化する
      if (current.ability != theory.ability) {
        theory = theory.copyWith(abilityMeta: 0);
      }
      // ポケモンが変わった時、タイプを初期化する
      if (current.pokemon != theory.pokemon) {
        theory = theory.copyWith(types: theory.pokemon.types);
      }

      state = state.map((e) => e.key == theory.key ? theory : e).toList();
    }
  }

  /// Theoryを並び替える
  void reorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      // 後ろに追加する場合、削除を先に行うためインデックスをひとつ前にする
      newIndex -= 1;
    }

    final theory = state[oldIndex];
    state = [...state]
      ..removeAt(oldIndex)
      ..insert(newIndex, theory);
  }
}
