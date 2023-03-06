import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../extensions/iterable.dart';
import '../misc/preferences.dart';
import '../models/theory_model.dart';

const _uuid = Uuid();

class TheoryListProvider extends StateNotifier<List<Theory>> {
  final PreferenceKeys key;

  TheoryListProvider(this.key) : super([]);

  Future init() async {
    final list = await Preference.getTheories(key);

    if (list != null) {
      final initState = <Theory>[];
      for (var e in list) {
        // メタデータはdynamicのため、アサート防止として起動時に初期化する
        initState.add(e.initMetadata());
      }
      state = initState;
    }

    addListener((state) async {
      await Preference.saveTheories(key, state);
    });
  }

  /// 新しいTheoryを生成する
  ///
  /// 生成したTheoryを返す
  Theory create() {
    final theory = add(Theory(id: _uuid.v4()));
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
    if (theory.id.isEmpty) {
      theory = theory.copyWith(id: _uuid.v4());
    }

    // キーが重複した場合、アサート
    assert(state.firstWhereOrNull((e) => e.id == theory.id) == null);

    // 追加時にタイプの初期値を設定する
    theory = theory.copyWith(types: theory.pokemon.types);

    // 追加時にメタを初期化する
    theory = theory.initMetadata();

    // 先頭に追加する
    state = [theory, ...state];

    return theory;
  }

  /// Theoryを複製する
  ///
  /// 異なるキーを生成して設定する
  /// 複製したTheoryを返す
  Theory clone(Theory theory) {
    theory = theory.copyWith(id: _uuid.v4());
    add(theory);
    return theory;
  }

  /// Theoryを削除する
  void delete(Theory theory) {
    state = state.where((e) => e.id != theory.id).toList();
  }

  /// Theoryを更新する
  ///
  /// 選択可能な特性でない場合、初期化する
  /// 特性を変更した場合に、特性のメタ情報を初期化する
  /// ポケモンが変わった時に、タイプを初期化する
  void update(Theory theory) {
    final current = state.firstWhereOrNull((e) => e.id == theory.id);

    // 選択している特性を含まない時は置き換える
    if (theory.pokemon.abilities.contains(theory.ability.state) == false) {
      theory = theory.copyWith(
          ability: theory.ability.copyWith(state: theory.pokemon.abilities[0]));
    }

    if (current == null) {
      // 見つからなかった場合は追加する
      add(theory);
    } else {
      // ポケモンが変わった時、タイプを初期化する
      if (current.pokemon != theory.pokemon) {
        theory = theory.copyWith(types: theory.pokemon.types);
      }
      // 特性が変わった時、メタを初期化する
      if (current.ability.state != theory.ability.state) {
        theory = theory.copyWith(
          ability: theory.ability.initMetadata(),
        );
      }
      // 技が変わった時、メタを初期化する
      for (var i = 0; i < theory.moves.length; i++) {
        if (current.moves[i].state != theory.moves[i].state) {
          theory = theory.copyWith(
            moves:
                theory.moves.update(i, theory.moves[i].initMetadata()).toList(),
          );
        }
      }

      state = state.map((e) => e.id == theory.id ? theory : e).toList();
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

final theoryListProvider =
    StateNotifierProvider<TheoryListProvider, List<Theory>>(
  (_) => TheoryListProvider(PreferenceKeys.theories),
);

final enemyListProvider =
    StateNotifierProvider<TheoryListProvider, List<Theory>>(
  (_) => TheoryListProvider(PreferenceKeys.enemies),
);
