import '../models/stats_model.dart';
import '../models/theory_model.dart';

/// 実数値のステータスを計算する関数を拡張
extension ActualStats on Theory {
  /// HPの実数値を計算する
  ///
  /// HPとそれ以外で計算式が異なる
  /// HP以外は[_calcStats]を使用すること
  int _calcHp({
    required int base,
    required int individual,
    required int effort,
    int level = 50,
  }) {
    var tmp = 0;

    // 種族値 × 2 + 個体値 + 努力値 ÷ 4
    tmp = (base * 2 + individual + effort / 4).floor();
    // × レベル / 100
    tmp = (tmp * level / 100).floor();
    // + レベル + 10
    tmp = tmp + level + 10;

    return tmp;
  }

  /// 攻撃、防御、特攻、特防、素早の実数値を計算する
  ///
  /// HPとそれ以外で計算式が異なる
  /// HPは[_calcHp]を使用すること
  int _calcStats({
    required int base,
    required int individual,
    required int effort,
    int level = 50,
    int buff = 1,
  }) {
    var tmp = 0;

    // 種族値 × 2 + 個体値 + 努力値 ÷ 4
    tmp = (base * 2 + individual + effort / 4).floor();
    // × レベル ÷ 100 + 5
    tmp = (tmp * level / 100).floor() + 5;
    // × 性格補正(少数)
    if (buff == 1) {
      tmp = (tmp * 1.1).floor();
    } else if (buff == -1) {
      tmp = (tmp * 0.9).floor();
    }

    return tmp;
  }

  /// 実数値のステータスを取得する
  Stats get actual {
    return Stats(
      h: _calcHp(
        base: pokemon.stats.h,
        individual: individual.h,
        effort: effort.h,
      ),
      a: _calcStats(
        base: pokemon.stats.a,
        individual: individual.a,
        effort: effort.a,
        buff: nature.buff.a,
      ),
      b: _calcStats(
        base: pokemon.stats.b,
        individual: individual.b,
        effort: effort.b,
        buff: nature.buff.b,
      ),
      c: _calcStats(
        base: pokemon.stats.c,
        individual: individual.c,
        effort: effort.c,
        buff: nature.buff.c,
      ),
      d: _calcStats(
        base: pokemon.stats.d,
        individual: individual.d,
        effort: effort.d,
        buff: nature.buff.d,
      ),
      s: _calcStats(
        base: pokemon.stats.s,
        individual: individual.s,
        effort: effort.s,
        buff: nature.buff.s,
      ),
    );
  }
}
