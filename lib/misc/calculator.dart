import 'dart:math';

import 'package:pokecalc/extensions/double.dart';
import 'package:pokecalc/models/environment_model.dart';

import '../enums/enums.dart';
import '../extensions/theory.dart';
import '../models/condition_model.dart';
import '../models/stats_model.dart';
import '../models/theory_model.dart';

class TheoryCondition {
  TheoryCondition({
    required this.theory,
    required this.condition,
  });

  final Theory theory;
  Condition condition;

  /// 現在のタイプを取得する
  ///
  /// テラスタルしている場合、テラスタルのタイプを返す
  /// それ以外では、ユーザーが選択したタイプを返す
  List<Types> get currentTypes {
    if (theory.terastal) {
      return [theory.teratype];
    } else {
      return theory.types;
    }
  }

  /// 飛んでいるかを判定する
  ///
  /// タイプ: 飛行、特性: 浮遊、持ち物: 風船 が該当
  bool get isFlying {
    // タイプ: 飛行
    if (currentTypes.contains(Types.flying)) {
      return true;
    }
    // 特性: 浮遊
    else if (theory.ability == Abilities.levitate) {
      return true;
    }
    // 持ち物: 風船
    else if (theory.item == Items.airballoon) {
      return true;
    }

    return false;
  }

  /// ランク補正されたステータスを取得する
  ///
  /// HPはランク補正なしのため、計算しない
  Stats get ranked {
    int calc(int stats, int rank) {
      if (rank >= 0) {
        return ((stats * (2 + rank)) / 2).floor();
      } else {
        return ((stats * 2) / (2 + rank.abs())).floor();
      }
    }

    return Stats(
      h: theory.actual.h,
      a: calc(theory.actual.a, condition.rank.a),
      b: calc(theory.actual.b, condition.rank.b),
      c: calc(theory.actual.c, condition.rank.c),
      d: calc(theory.actual.d, condition.rank.d),
      s: calc(theory.actual.s, condition.rank.s),
    );
  }

  /// ダメージ計算に使用するステータスを取得する
  ///
  /// 相手の特性やアイテム、技、天候などを考慮する
  Stats effective({
    required TheoryCondition enemy,
    required Moves move,
    required Environment environment,
  }) {
    // 補正値を1.0で初期化
    Stats correct = Stats(
      h: 1.0.to12bit(),
      a: 1.0.to12bit(),
      b: 1.0.to12bit(),
      c: 1.0.to12bit(),
      d: 1.0.to12bit(),
      s: 1.0.to12bit(),
    );

    // 補正値設定関数
    setCorrect({
      double? h,
      double? a,
      double? b,
      double? c,
      double? d,
      double? s,
    }) {
      correct = correct.copyWith(
        h: (correct.h * (h ?? 1.0).to12bit() / 1.0.to12bit()).round(),
        a: (correct.a * (a ?? 1.0).to12bit() / 1.0.to12bit()).round(),
        b: (correct.b * (b ?? 1.0).to12bit() / 1.0.to12bit()).round(),
        c: (correct.c * (c ?? 1.0).to12bit() / 1.0.to12bit()).round(),
        d: (correct.d * (d ?? 1.0).to12bit() / 1.0.to12bit()).round(),
        s: (correct.s * (s ?? 1.0).to12bit() / 1.0.to12bit()).round(),
      );
    }

    switch (environment.weather) {
      case Weathers.sandstorm:
        // すなあらし+いわタイプ
        // 特防が1.5倍
        if (currentTypes.contains(Types.rock)) {
          setCorrect(d: 1.5);
        }
        break;
      case Weathers.hail:
        // あられ+こおりタイプ
        // 防御が1.5倍
        if (currentTypes.contains(Types.ice)) {
          setCorrect(b: 1.5);
        }
        break;
      default:
        break;
    }

    switch (theory.ability) {
      // スロースタート
      case Abilities.slow_start:
        // 5ターンの間、攻撃が0.5倍
        if (theory.abilityMeta != 0) {
          setCorrect(a: 0.5);
        }
        break;

      // よわき
      case Abilities.defeatist:
        // HPが半分になると、攻撃が0.5倍
        if (theory.abilityMeta != 0) {
          setCorrect(a: 0.5);
        }
        break;

      // クォークチャージ
      case Abilities.quark_drive:
        // エレキフィールド状態か、ブーストエナジーを持っている時、最も高い能力(ランク補正込み)が1.3倍
        if (environment.field == Fields.electric ||
            theory.item == Items.boosterenergy) {
          final highest = ranked.toArray().sublist(1).reduce(max);

          if (highest == ranked.a) {
            setCorrect(a: 1.3);
          } else if (highest == ranked.b) {
            setCorrect(b: 1.3);
          } else if (highest == ranked.c) {
            setCorrect(c: 1.3);
          } else if (highest == ranked.d) {
            setCorrect(d: 1.3);
          } else if (highest == ranked.s) {
            setCorrect(s: 1.5);
          }
        }
        break;

      // こだいかっせい
      case Abilities.protosynthesis:
        // にほんばれ状態か、ブーストエナジーを持っている時、最も高い能力(ランク補正込み)が1.3倍
        if (environment.weather == Weathers.sunshine ||
            theory.item == Items.boosterenergy) {
          final highest = ranked.toArray().sublist(1).reduce(max);

          if (highest == ranked.a) {
            setCorrect(a: 1.3);
          } else if (highest == ranked.b) {
            setCorrect(b: 1.3);
          } else if (highest == ranked.c) {
            setCorrect(c: 1.3);
          } else if (highest == ranked.d) {
            setCorrect(d: 1.3);
          } else if (highest == ranked.s) {
            setCorrect(s: 1.5);
          }
        }
        break;

      // ハドロンエンジン
      case Abilities.hadron_engine:
        // エレキフィールド状態の時、特攻が1.33倍
        if (environment.field == Fields.electric) {
          setCorrect(c: 1.33);
        }
        break;

      // ひひいろのこどう
      case Abilities.orichalcum_pulse:
        // にほんばれ状態の時、攻撃が1.33倍
        if (environment.weather == Weathers.sunshine) {
          setCorrect(a: 1.3);
        }
        break;

      // フラワーギフト
      case Abilities.flower_gift:
        // にほんばれ状態の時、攻撃と特防が1.5倍
        if (environment.weather == Weathers.sunshine) {
          setCorrect(a: 1.5, d: 1.5);
        }
        break;

      // こんじょう
      case Abilities.guts:
        // 状態異常の時、攻撃が1.5倍
        if (condition.ailment != Ailments.none) {
          setCorrect(a: 1.5);
        }
        break;

      // ふしぎなうろこ
      case Abilities.marvel_scale:
        // 状態異常の時、防御が1.5倍
        if (condition.ailment != Ailments.none) {
          setCorrect(b: 1.5);
        }
        break;

      // しんりょく
      case Abilities.overgrow:
        // HPが1/3以下でくさタイプで攻撃する時、攻撃と特攻が1.5倍
        if (theory.abilityMeta != 0) {
          if (move.type == Types.grass) {
            setCorrect(a: 1.5, c: 1.5);
          }
        }
        break;

      // もうか
      case Abilities.blaze:
        // HPが1/3以下でほのおタイプで攻撃する時、攻撃と特攻が1.5倍
        if (theory.abilityMeta != 0) {
          if (move.type == Types.fire) {
            setCorrect(a: 1.5, c: 1.5);
          }
        }
        break;

      // げきりゅう
      case Abilities.torrent:
        // HPが1/3以下でみずタイプで攻撃する時、攻撃と特攻が1.5倍
        if (theory.abilityMeta != 0) {
          if (move.type == Types.water) {
            setCorrect(a: 1.5, c: 1.5);
          }
        }
        break;

      // むしのしらせ
      case Abilities.swarm:
        // HPが1/3以下でむしタイプで攻撃する時、攻撃と特攻が1.5倍
        if (theory.abilityMeta != 0) {
          if (move.type == Types.bug) {
            setCorrect(a: 1.5, c: 1.5);
          }
        }
        break;

      // もらいび
      case Abilities.flash_fire:
        // ほのお技を受けた状態でほのおタイプで攻撃する時、攻撃と特攻が1.5倍
        if (theory.abilityMeta != 0) {
          if (move.type == Types.fire) {
            setCorrect(a: 1.5, c: 1.5);
          }
        }
        break;

      // サンパワー
      case Abilities.solar_power:
        // にほんばれ状態の時、特攻が1.5倍
        if (environment.weather == Weathers.sunshine) {
          setCorrect(c: 1.5);
        }
        break;

      // プラス
      // マイナス
      case Abilities.plus:
      case Abilities.minus:
        // もう一方が戦闘に出ると、特攻が1.5倍
        if (theory.abilityMeta != 0) {
          setCorrect(c: 1.5);
        }
        break;

      // いわはこび
      case Abilities.rocky_payload:
        // いわタイプで攻撃する時、攻撃と特攻が1.5倍
        if (move.type == Types.rock) {
          setCorrect(a: 1.5, c: 1.5);
        }
        break;

      // はがねつかい
      case Abilities.steelworker:
        // はがねタイプで攻撃する時、攻撃と特攻が1.5倍
        if (move.type == Types.steel) {
          setCorrect(a: 1.5, c: 1.5);
        }
        break;

      // ごりむちゅう
      case Abilities.gorilla_tactics:
        // 最初に選択した技しか使えなくなるが、攻撃が1.5倍
        if (move.category == MoveCategory.physical) {
          setCorrect(a: 1.5);
        }
        break;

      // トランジスタ
      case Abilities.transistor:
        // でんきタイプで攻撃する時、攻撃と特攻が1.5倍
        if (move.type == Types.electric) {
          setCorrect(a: 1.5, c: 1.5);
        }
        break;

      // りゅうのあぎと
      case Abilities.dragons_maw:
        // ドラゴンタイプで攻撃する時、攻撃と特攻が1.5倍
        if (move.type == Types.dragon) {
          setCorrect(a: 1.5, c: 1.5);
        }
        break;

      // ちからもち
      // ヨガパワー
      case Abilities.huge_power:
      case Abilities.pure_power:
        // こうげきが2倍
        setCorrect(a: 2.0);
        break;

      // すいほう
      case Abilities.water_bubble:
        // みずタイプで攻撃する時、攻撃と特攻が2倍
        // ほのおタイプで攻撃する時、攻撃と特攻が0.5倍
        if (move.type == Types.water) {
          setCorrect(a: 2.0, c: 2.0);
        } else if (move.type == Types.fire) {
          setCorrect(a: 0.5, c: 0.5);
        }
        break;

      // はりこみ
      case Abilities.stakeout:
        // 交代で出てきた相手に攻撃する時、攻撃と特攻が2倍
        if (theory.abilityMeta != 0) {
          setCorrect(a: 2.0, c: 2.0);
        }
        break;

      // くさのけがわ
      case Abilities.grass_pelt:
        // グラスフィールド状態の時、防御が1.5倍
        if (environment.field == Fields.grassy) {
          setCorrect(b: 1.5);
        }
        break;

      // ファーコート
      case Abilities.fur_coat:
        // 物理技を受ける時、防御が2倍
        setCorrect(b: 2.0);
        break;

      default:
        break;
    }

    switch (enemy.theory.ability) {
      // わざわいのおふだ
      case Abilities.tablets_of_ruin:
        // 自分以外の攻撃が3/4倍
        setCorrect(a: 0.75);
        break;

      // わざわいのつるぎ
      case Abilities.sword_of_ruin:
        // 自分以外の防御が3/4倍
        setCorrect(b: 0.75);
        break;

      // わざわいのうつわ
      case Abilities.vessel_of_ruin:
        // 自分以外の特攻が3/4倍
        setCorrect(c: 0.75);
        break;

      // わざわいのたま
      case Abilities.beads_of_ruin:
        // 自分以外の特防が3/4倍
        setCorrect(d: 0.75);
        break;

      // あついしぼう
      case Abilities.thick_fat:
        // ほのお・こおりタイプの技を受ける時、相手の攻撃と特攻が0.5倍
        if (move.type == Types.fire || move.type == Types.ice) {
          setCorrect(a: 0.5, c: 0.5);
        }
        break;

      // きよめのしお
      case Abilities.purifying_salt:
        // ゴーストタイプの技を受ける時、相手の攻撃と特攻が0.5倍
        if (move.type == Types.ghost) {
          setCorrect(a: 0.5, c: 0.5);
        }
        break;

      default:
        break;
    }

    switch (theory.item) {
      // こだわりハチマキ
      case Items.choiceband:
        // 攻撃が1.5倍
        setCorrect(a: 1.5);
        break;

      // こだわりメガネ
      case Items.choicespecs:
        // 特攻が1.5倍
        setCorrect(c: 1.5);
        break;

      // こだわりスカーフ
      case Items.choicescarf:
        // 素早さが2.0倍
        setCorrect(c: 2.0);
        break;

      // でんきだま
      case Items.lightball:
        // ピカチュウに持たせると特攻が2倍
        if (theory.pokemon == Pokedex.pikachu) {
          setCorrect(c: 1.5);
        }
        break;

      // しんかのきせき
      case Items.eviolite:
        // 進化前のポケモンに持たせると、防御と特防が1.5倍
        // TODO: 進化前判定
        setCorrect(b: 1.5, d: 1.5);
        break;

      // とつげきチョッキ
      case Items.assaultvest:
        // 特防が1.5倍
        setCorrect(d: 1.5);
        break;

      default:
        break;
    }

    // ステータス補正を計算、五捨五超入
    return ranked.copyWith(
      h: ((ranked.h * correct.h) / 1.0.to12bit()).round6().clamp(0, 0xffffffff),
      a: ((ranked.a * correct.a) / 1.0.to12bit()).round6().clamp(0, 0xffffffff),
      b: ((ranked.b * correct.b) / 1.0.to12bit()).round6().clamp(0, 0xffffffff),
      c: ((ranked.c * correct.c) / 1.0.to12bit()).round6().clamp(0, 0xffffffff),
      d: ((ranked.d * correct.d) / 1.0.to12bit()).round6().clamp(0, 0xffffffff),
      s: ((ranked.s * correct.s) / 1.0.to12bit()).round6().clamp(0, 0xffffffff),
    );
  }

  /// ダメージ計算に使用する技の威力を取得する
  ///
  /// 相手の特性やアイテム、技、天候などを考慮する
  int movePower({
    required TheoryCondition enemy,
    required Moves move,
    required Environment environment,
  }) {
    int correct = 1.0.to12bit();
    setCorrect(double mag) =>
        correct = (correct * mag.to12bit() / 1.0.to12bit()).round();

    // 技の威力が未定義の時は0にする
    if (move.power == null || move.power == 0) {
      return 0;
    }

    switch (theory.ability) {
      // とうそうしん
      case Abilities.rivalry:
        // 同じ性別の相手の時、技の威力が1.25倍
        // 違う性別の相手の時、技の威力が0.75倍
        if (theory.abilityMeta != 0) {
          setCorrect(1.25);
        } else {
          setCorrect(0.75);
        }
        break;

      // オーラブレイク
      case Abilities.aura_break:
        // ダークオーラ、フェアリーオーラの効果の補正を0.75倍
        // TODO: 対応
        break;

      // そうだいしょう
      case Abilities.supreme_overlord:
        // 1体につき+10%
        setCorrect(1.0 + theory.abilityMeta * 0.1);
        break;

      // エレキスキン
      // スカイスキン
      // ノーマルスキン
      // フェアリースキン
      // フリーズスキン
      case Abilities.galvanize:
      case Abilities.aerilate:
      case Abilities.normalize:
      case Abilities.pixilate:
      case Abilities.refrigerate:
        // ノーマルタイプの技の威力が1.2倍
        if (move.type == Types.normal) {
          setCorrect(1.2);
        }
        break;

      // てつのこぶし
      case Abilities.iron_fist:
        // 拳技の威力が1.2倍
        if (move.isPunch) {
          setCorrect(1.2);
        }
        break;

      // すてみ
      case Abilities.reckless:
        // 反動技の威力が1.2倍
        if (move.isRecoil) {
          setCorrect(1.2);
        }
        break;

      // バッテリー
      case Abilities.battery:
        // ダブルバトルの時に味方の特殊技の威力が1.3倍
        // TODO: ダブルバトルの対応
        break;

      // ちからずく
      case Abilities.sheer_force:
        // 追加効果がなくなるが、威力が1.3倍
        if (theory.abilityMeta != 0) {
          setCorrect(1.3);
        }
        break;

      // すなのちから
      case Abilities.sand_force:
        // すなあらしのとき、いわ・じめん・ハガネタイプの技の威力が1.3倍
        if (environment.weather == Weathers.sandstorm) {
          if (move.type == Types.rock ||
              move.type == Types.ground ||
              move.type == Types.steel) {
            setCorrect(1.3);
          }
        }
        break;

      // アナライズ
      case Abilities.analytic:
        // 一番最後に技を出すと威力が1.3倍
        if (theory.abilityMeta != 0) {
          setCorrect(1.3);
        }
        break;

      case Abilities.tough_claws:
        // 接触技の威力が1.3倍
        if (move.isContact) {
          setCorrect(1.3);
        }
        break;

      case Abilities.punk_rock:
        // 音技の威力が1.3倍
        if (move.isSound) {
          setCorrect(1.3);
        }
        break;

      // パワースポット
      case Abilities.power_spot:
        // ダブルバトルの時に味方の技の威力が1.3倍
        // TODO: 効果の有無の対応
        break;

      // フェアリーオーラ
      case Abilities.fairy_aura:
        // 戦闘に出ている全員のフェアリータイプの技の威力が1.33倍
        if (move.type == Types.fairy) {
          setCorrect(1.33);
        }
        break;

      // ダークオーラ
      case Abilities.dark_aura:
        // 戦闘に出ている全員のあくタイプの技の威力が1.33倍
        if (move.type == Types.dark) {
          setCorrect(1.33);
        }
        break;

      // はがねのせいしん
      case Abilities.steely_spirit:
        // 戦闘に出ている全員のはがねタイプの技の威力が1.5倍
        if (move.type == Types.steel) {
          setCorrect(1.5);
        }
        break;

      // テクニシャン
      case Abilities.technician:
        // 威力60以下の技の威力が1.5倍
        if (move.power! <= 60) {
          setCorrect(1.5);
        }
        break;

      // ねつぼうそう
      case Abilities.flare_boost:
        // やけど状態の時、特殊技の威力が1.5倍
        if (condition.ailment == Ailments.burn) {
          setCorrect(1.5);
        }
        break;

      // どくぼうそう
      case Abilities.toxic_boost:
        // どく状態の時、特殊技の威力が1.5倍
        if (condition.ailment == Ailments.poison) {
          setCorrect(1.5);
        }
        break;

      // きれあじ
      case Abilities.sharpness:
        // 切技の威力が1.5倍
        if (move.isCut) {
          setCorrect(1.5);
        }
        break;

      // がんじょうあご
      case Abilities.strong_jaw:
        // 牙技の威力が1.5倍
        if (move.isBite) {
          setCorrect(1.5);
        }
        break;

      // メガランチャー
      case Abilities.mega_launcher:
        // 波動技の威力が1.5倍
        if (move.isWave) {
          setCorrect(1.5);
        }
        break;

      default:
        break;
    }

    switch (move) {
      // ソーラービーム
      // ソーラーブレード
      case Moves.solar_beam:
      case Moves.solar_blade:
        // 天候があめ・すなあらし・あられのとき、威力が0.5倍
        if (environment.weather == Weathers.rain ||
            environment.weather == Weathers.sandstorm ||
            environment.weather == Weathers.hail) {
          setCorrect(0.5);
        }
        break;

      // はたきおとす
      case Moves.knock_off:
        // 相手が持ち物を持っていた場合、威力が1.5倍
        // TODO: 追加効果技の対応
        break;

      // てだすけ
      case Moves.helping_hand:
        // 使用したターンの味方の技の威力が1.5倍
        // TODO: てだすけ対応
        break;

      // Ｇのちから
      case Moves.grav_apple:
        // 重力状態の時、技の威力が1.5倍
        // TODO: 重力対応
        break;

      // ワイドフォース
      case Moves.expanding_force:
        // サイコフィールドで、ひこうタイプ・ふゆう・ふうせんでない時、技の威力が1.5倍
        if (environment.field == Fields.psychic) {
          if (enemy.isFlying == false) {
            setCorrect(1.5);
          }
        }
        break;

      // ライジングボルト
      case Moves.rising_voltage:
        // エレキフィールドで、ひこうタイプ・ふゆう・ふうせんでない時、技の威力が2倍
        if (environment.field == Fields.electric) {
          if (enemy.isFlying == false) {
            setCorrect(2.0);
          }
        }
        break;

      // じゅうでん
      case Moves.charge:
        // 次に使うでんきタイプの技の威力が2倍
        // TODO: じゅうでん対応
        break;

      // からげんき
      case Moves.facade:
        // 状態異常の時、技の威力が2倍
        if (condition.ailment != Ailments.none) {
          setCorrect(2.0);
        }
        break;

      // しおみず
      case Moves.brine:
        // 相手の残りHPが半分以下の時、技の威力が2倍
        // TODO: 効果の有無の対応
        break;

      // ベノムショック
      case Moves.venoshock:
        // 相手がどく状態の時、威力が2倍
        if (enemy.condition.ailment == Ailments.poison) {
          setCorrect(2.0);
        }
        break;

      // かたきうち
      case Moves.retaliate:
        // 前のターンに味方が倒されている時、威力が2倍
        // TODO: 効果の有無の対応
        break;

      default:
        break;
    }

    switch (enemy.theory.ability) {
      // たいねつ
      case Abilities.heatproof:
        // 相手のほのおタイプの技の威力が0.5倍
        if (move.type == Types.fire) {
          setCorrect(0.5);
        }
        break;

      // かんそうはだ
      case Abilities.dry_skin:
        // 相手のほのおタイプの技の威力が1.25倍
        if (move.type == Types.fire) {
          setCorrect(1.25);
        }
        break;

      default:
        break;
    }

    switch (theory.item) {
      // ちからのハチマキ
      case Items.muscleband:
        // 物理技の威力が1.1倍
        if (move.category == MoveCategory.physical) {
          setCorrect(1.1);
        }
        break;

      // ものしりメガネ
      case Items.wiseglasses:
        // 特殊技の威力が1.1倍
        if (move.category == MoveCategory.special) {
          setCorrect(1.1);
        }
        break;

      // パンチグローブ
      case Items.punchingglove:
        // パンチ技の威力が1.1倍
        if (move.isPunch) {
          setCorrect(1.1);
        }
        break;

      // シルクのスカーフ
      case Items.silkscarf:
        // ノーマルタイプの技の威力が1.2倍
        if (move.type == Types.normal) {
          setCorrect(1.2);
        }
        break;

      // こぶしのプレート
      // くろおび
      case Items.fistplate:
      case Items.blackbelt:
        // かくとうタイプの技の威力が1.2倍
        if (move.type == Types.fighting) {
          setCorrect(1.2);
        }
        break;

      // がんせきプレート
      // かたいいし
      case Items.stoneplate:
      case Items.hardstone:
        // いわタイプの技の威力が1.2倍
        if (move.type == Types.rock) {
          setCorrect(1.2);
        }
        break;

      // しずくプレート
      // しんぴのしずく
      case Items.splashplate:
      case Items.mysticwater:
        // みずタイプの技の威力が1.2倍
        if (move.type == Types.water) {
          setCorrect(1.2);
        }
        break;

      // こわもてプレート
      // くろいメガネ
      case Items.dreadplate:
      case Items.blackglasses:
        // あくタイプの技の威力が1.2倍
        if (move.type == Types.dark) {
          setCorrect(1.2);
        }
        break;

      // たまむしプレート
      // ぎんのこな
      case Items.insectplate:
      case Items.silverpowder:
        // むしタイプの技の威力が1.2倍
        if (move.type == Types.bug) {
          setCorrect(1.2);
        }
        break;

      // みどりのプレート
      // きせきのタネ
      case Items.meadowplate:
      case Items.miracleseed:
        // くさタイプの技の威力が1.2倍
        if (move.type == Types.grass) {
          setCorrect(1.2);
        }
        break;

      // もうどくプレート
      // どくバリ
      case Items.toxicplate:
      case Items.poisonbarb:
        // どくタイプの技の威力が1.2倍
        if (move.type == Types.poison) {
          setCorrect(1.2);
        }
        break;

      // もののけプレート
      // のろいのおふだ
      case Items.spookyplate:
      case Items.spelltag:
        // ゴーストタイプの技の威力が1.2倍
        if (move.type == Types.ghost) {
          setCorrect(1.2);
        }
        break;

      // ひのたまプレート
      // もくたん
      case Items.flameplate:
      case Items.charcoal:
        // ほのおタイプの技の威力が1.2倍
        if (move.type == Types.fire) {
          setCorrect(1.2);
        }
        break;

      // だいちのプレート
      // やわらかいすな
      case Items.earthplate:
      case Items.softsand:
        // じめんタイプの技の威力が1.2倍
        if (move.type == Types.ground) {
          setCorrect(1.2);
        }
        break;

      // りゅうのプレート
      // りゅうのキバ
      case Items.dracoplate:
      case Items.dragonfang:
        // ドラゴンタイプの技の威力が1.2倍
        if (move.type == Types.dragon) {
          setCorrect(1.2);
        }
        break;

      // いかずちプレート
      // じしゃく
      case Items.zapplate:
      case Items.magnet:
        // でんきタイプの技の威力が1.2倍
        if (move.type == Types.electric) {
          setCorrect(1.2);
        }
        break;

      // あおぞらプレート
      // するどいくちばし
      case Items.skyplate:
      case Items.sharpbeak:
        // ひこうタイプの技の威力が1.2倍
        if (move.type == Types.flying) {
          setCorrect(1.2);
        }
        break;

      // こうてつプレート
      // メタルコート
      case Items.ironplate:
      case Items.metalcoat:
        // はがねタイプの技の威力が1.2倍
        if (move.type == Types.steel) {
          setCorrect(1.2);
        }
        break;

      // つららのプレート
      // とけないこおり
      case Items.icicleplate:
      case Items.never_meltice:
        // こおりタイプの技の威力が1.2倍
        if (move.type == Types.ice) {
          setCorrect(1.2);
        }
        break;

      // ふしぎのプレート
      // まがったスプーン
      case Items.mindplate:
      case Items.twistedspoon:
        // エスパータイプの技の威力が1.2倍
        if (move.type == Types.psychic) {
          setCorrect(1.2);
        }
        break;

      // せいれいプレート
      case Items.pixieplate:
        // フェアリータイプの技の威力が1.2倍
        if (move.type == Types.fairy) {
          setCorrect(1.2);
        }
        break;

      default:
        break;
    }

    switch (environment.field) {
      case Fields.electric:
        // エレキフィールドの時、地面にいるポケモンのでんきタイプの技の威力が1.3倍
        if (isFlying == false) {
          if (move.type == Types.electric) {
            setCorrect(1.3);
          }
        }
        break;

      case Fields.grassy:
        // グラスフィールドの時、地面にいるポケモンのくさタイプの技の威力が1.3倍
        if (isFlying == false) {
          if (move.type == Types.grass) {
            setCorrect(1.3);
          }
        }
        // グラスフィールドの時、地面にいるポケモンが受けるじしん・じならし・マグニチュードの技の威力が0.5倍
        if (enemy.isFlying == false) {
          if (move == Moves.earthquake ||
              move == Moves.bulldoze ||
              move == Moves.magnitude) {
            setCorrect(0.5);
          }
        }
        break;

      case Fields.misty:
        // ミストフィールドの時、地面にいるポケモンが受けるドラゴンタイプの技の威力が0.5倍
        if (enemy.isFlying == false) {
          if (move.type == Types.dragon) {
            setCorrect(0.5);
          }
        }
        break;

      case Fields.psychic:
        // サイコフィールドの時、面にいるポケモンのエスパータイプの技の威力が1.3倍
        if (isFlying == false) {
          if (move.type == Types.psychic) {
            setCorrect(1.3);
          }
        }
        break;

      default:
        break;
    }

    // みずあそびの時、ほのおタイプの技の威力が0.33倍
    // どろあそびの時、でんきタイプの技の威力が0.33倍
    // TODO: 対応

    // 技の威力の補正を計算、五捨五超入
    var power =
        (move.power! * correct / 1.0.to12bit()).round6().clamp(0, 0xffffffff);

    // テラスタイプと技のタイプが同じで威力が60未満の時は60にする
    if (theory.terastal) {
      if (currentTypes.contains(move.type)) {
        if (power < 60) {
          power = 60;
        }
      }
    }

    return power;
  }

  /// ダメージ計算に使用する技の威力の補正値を取得する
  ///
  /// 相手の特性やアイテム、技などを考慮する
  int damageCorrect({
    required TheoryCondition enemy,
    required Moves move,
    required double typeEfficacy,
  }) {
    var correct = 1.0.to12bit();
    setCorrect(double mag) =>
        correct = (correct * mag.to12bit() / 1.0.to12bit()).round();

    // リフレクターの時、物理技のダメージを0.5倍
    if (enemy.condition.shield.isPhysical) {
      setCorrect(0.5);
    }
    // ひかりのかべの時、特殊技のダメージを0.5倍
    if (enemy.condition.shield.isSpecial) {
      setCorrect(0.5);
    }

    switch (theory.ability) {
      // ブレインフォース
      case Abilities.neuroforce:
        // 効果抜群の技のダメージを1.25倍
        if (typeEfficacy > 1.0) {
          setCorrect(1.25);
        }
        break;

      // スナイパー
      case Abilities.sniper:
        // 急所に当てた時のダメージを1.5倍(計2.25倍)
        if (condition.critical) {
          setCorrect(1.25);
        }
        break;

      // いろめがね
      case Abilities.tinted_lens:
        // 効果いまひとつの技のダメージを2倍
        if (typeEfficacy < 1.0) {
          setCorrect(2.0);
        }
        break;

      default:
        break;
    }

    switch (enemy.theory.ability) {
      // もふもふ
      case Abilities.fluffy:
        // ほのおタイプの技のダメージを2倍
        if (move.type == Types.fire) {
          setCorrect(2.0);
        }
        // 接触技のダメージを0.5倍
        if (move.isContact) {
          setCorrect(0.5);
        }
        break;

      // マルチスケイル
      case Abilities.multiscale:
        // HP満タンの時に受けるダメージを0.5倍
        if (enemy.theory.abilityMeta != 0) {
          setCorrect(0.5);
        }
        break;

      // パンクロック
      case Abilities.punk_rock:
        // 受ける音技のダメージを0.5倍
        if (move.isSound) {
          setCorrect(0.5);
        }
        break;

      // こおりのりんぷん
      case Abilities.ice_scales:
        // こおりタイプの技のダメージを0.5倍
        if (move.type == Types.ice) {
          setCorrect(0.5);
        }
        break;

      // ハードロック
      // フィルター
      // プリズムアーマー
      case Abilities.solid_rock:
      case Abilities.filter:
      case Abilities.prism_armor:
        // 効果抜群のダメージを0.75倍
        if (typeEfficacy >= 2) {
          setCorrect(0.75);
        }
        break;

      default:
        break;
    }

    switch (move) {
      // アクセルブレイク
      // イナズマドライブ
      case Moves.electro_drift:
      case Moves.collision_course:
        // 効果抜群の技のダメージを4/3倍
        if (typeEfficacy >= 2) {
          setCorrect(1.33);
        }
        break;

      default:
        break;
    }

    switch (theory.item) {
      // メトロノーム
      case Items.metronome:
        // 2回目 4915
        // 3回目 5734
        // 4回目 6553
        // 5回目 7372
        // 6回目 8192
        // TODO: 対応
        break;

      // たつじんのおび
      case Items.expertbelt:
        // 効果抜群の技のダメージを1.2倍
        if (typeEfficacy >= 2) {
          setCorrect(1.2);
        }
        break;

      // いのちのたま
      case Items.lifeorb:
        // 技のダメージを1.3倍
        setCorrect(1.3);
        break;

      default:
        break;
    }

    switch (enemy.theory.item) {
      case Items.roseliberry:
        // フェアリータイプの技のダメージを0.5倍
        if (move.type == Types.fairy) {
          setCorrect(0.5);
        }
        break;

      case Items.chilanberry:
        // ノーマルタイプの技のダメージを0.5倍
        if (move.type == Types.normal) {
          setCorrect(0.5);
        }
        break;

      case Items.babiriberry:
        // はがねタイプの技のダメージを0.5倍
        if (move.type == Types.steel) {
          setCorrect(0.5);
        }
        break;

      case Items.colburberry:
        // あくタイプの技のダメージを0.5倍
        if (move.type == Types.dark) {
          setCorrect(0.5);
        }
        break;

      case Items.habanberry:
        // ドラゴンタイプの技のダメージを0.5倍
        if (move.type == Types.dragon) {
          setCorrect(0.5);
        }
        break;

      case Items.kasibberry:
        // ゴーストタイプの技のダメージを0.5倍
        if (move.type == Types.ghost) {
          setCorrect(0.5);
        }
        break;

      case Items.chartiberry:
        // いわタイプの技のダメージを0.5倍
        if (move.type == Types.rock) {
          setCorrect(0.5);
        }
        break;

      case Items.tangaberry:
        // むしタイプの技のダメージを0.5倍
        if (move.type == Types.rock) {
          setCorrect(0.5);
        }
        break;

      case Items.payapaberry:
        // エスパータイプの技のダメージを0.5倍
        if (move.type == Types.psychic) {
          setCorrect(0.5);
        }
        break;

      case Items.cobaberry:
        // ひこうタイプの技のダメージを0.5倍
        if (move.type == Types.flying) {
          setCorrect(0.5);
        }
        break;

      case Items.shucaberry:
        // じめんタイプの技のダメージを0.5倍
        if (move.type == Types.ground) {
          setCorrect(0.5);
        }
        break;

      case Items.kebiaberry:
        // どくタイプの技のダメージを0.5倍
        if (move.type == Types.poison) {
          setCorrect(0.5);
        }
        break;

      case Items.chopleberry:
        // かくとうタイプの技のダメージを0.5倍
        if (move.type == Types.fighting) {
          setCorrect(0.5);
        }
        break;

      case Items.yacheberry:
        // こおりタイプの技のダメージを0.5倍
        if (move.type == Types.ice) {
          setCorrect(0.5);
        }
        break;

      case Items.rindoberry:
        // くさタイプの技のダメージを0.5倍
        if (move.type == Types.grass) {
          setCorrect(0.5);
        }
        break;

      case Items.passhoberry:
        // みずタイプの技のダメージを0.5倍
        if (move.type == Types.water) {
          setCorrect(0.5);
        }
        break;

      case Items.occaberry:
        // ほのおタイプの技のダメージを0.5倍
        if (move.type == Types.fire) {
          setCorrect(0.5);
        }
        break;

      default:
        break;
    }

    // TODO: 対応
    // ふみつけ+ちいさくなる
    // ハードローラー+ちいさくなる
    // ドラゴンダイブ+ちいさくなる
    // ヒートスタンプ+ちいさくなる
    // フライングプレス+ちいさくなる
    // のしかかり+ちいさくなる
    // ヘビーボンバー+ちいさくなる
    // じしん+あなをほる
    // マグニチュード+あなをほる
    // なみのり+ダイビング

    return correct;
  }

  int calcDamage({
    required TheoryCondition enemy,
    required Moves move,
    required Environment environment,
    double rand = 1.0,
  }) {
    int damage;

    // 変化技、ダメージなしは0を返す
    if (move.power == null) {
      return 0;
    }

    // シェルアーマーは急所に当たらない
    if (condition.critical) {
      if (enemy.theory.ability == Abilities.shell_armor) {
        condition = condition.copyWith(critical: false);
      }
    }

    // 急所による壁、ランクの変化
    if (condition.critical) {
      // 急所の時は壁無効
      enemy.condition = enemy.condition.copyWith(shield: Shields.none);

      // ランク
      // 自分の攻撃の下降補正を0にする
      if (condition.rank.a < 0) {
        condition = condition.copyWith(
          rank: condition.rank.copyWith(a: 0),
        );
      }
      // 自分の特攻の下降補正を0にする
      if (condition.rank.c < 0) {
        condition = condition.copyWith(
          rank: condition.rank.copyWith(a: 0),
        );
      }
      // 相手の防御の上昇補正を0にする
      if (enemy.condition.rank.b > 0) {
        enemy.condition = enemy.condition.copyWith(
          rank: enemy.condition.rank.copyWith(b: 0),
        );
      }
      // 相手の特防の上昇補正を0にする
      if (enemy.condition.rank.d > 0) {
        enemy.condition = enemy.condition.copyWith(
          rank: enemy.condition.rank.copyWith(b: 0),
        );
      }
    }

    // 基本ダメージを計算
    // レベル * 2 / 5 + 2
    damage = (100 / 5 + 2).floor();

    // 最終威力
    final power = movePower(
      move: move,
      enemy: enemy,
      environment: environment,
    );

    // 最終ステータス
    final attackerStats = effective(
      move: move,
      enemy: enemy,
      environment: environment,
    );

    // 最終防御力
    final defenceStats = enemy.effective(
      move: move,
      enemy: this,
      environment: environment,
    );

    // 技のダメージを計算
    if (move.category == MoveCategory.physical) {
      damage = (damage * power * attackerStats.a / defenceStats.b).floor();
    } else {
      damage = (damage * power * attackerStats.c / defenceStats.d).floor();
    }
    damage = (damage / 50 + 2).floor();

    // 天候強化
    switch (environment.weather) {
      case Weathers.sunshine:
        if (move.type == Types.fire) {
          // ほのおタイプの技のダメージが1.5倍
          damage = (damage * 1.5.to12bit() / 1.0.to12bit()).round6();
        } else if (move.type == Types.water) {
          // みずタイプの技のダメージが0.5倍
          damage = (damage * 0.5.to12bit() / 1.0.to12bit()).round6();
        }
        break;

      case Weathers.rain:
        if (move.type == Types.water) {
          // みずタイプの技のダメージが1.5倍
          damage = (damage * 1.5.to12bit() / 1.0.to12bit()).round6();
        } else if (move.type == Types.fire) {
          // ほのおタイプの技のダメージが0.5倍
          damage = (damage * 0.5.to12bit() / 1.0.to12bit()).round6();
        }
        break;

      default:
        break;
    }

    // 急所はダメージが1.5倍
    if (condition.critical) {
      damage = (damage * 1.5.to12bit() / 1.0.to12bit()).round6();
    }

    // 乱数
    damage = (damage * rand.to12bit() / 1.0.to12bit()).floor();

    // タイプ一致
    // テラスタイプ一致
    if (theory.terastal && theory.teratype == move.type) {
      if (theory.ability == Abilities.adaptability) {
        // テラスタイプ一致+適応力は2.25倍
        damage = (damage * 2.25.to12bit() / 1.0.to12bit()).round6();
      } else {
        if (theory.types.contains(theory.teratype)) {
          // 元のタイプと同じテラスタイプの場合は2倍
          damage = (damage * 2.0.to12bit() / 1.0.to12bit()).round6();
        } else {
          // テラスタイプ一致は1.5倍
          damage = (damage * 1.5.to12bit() / 1.0.to12bit()).round6();
        }
      }
    } else if (theory.types.contains(move.type)) {
      if (theory.ability == Abilities.adaptability) {
        // タイプ一致+適応力は2倍
        damage = (damage * 2.0.to12bit() / 1.0.to12bit()).round6();
      } else {
        // タイプ一致は1.5倍
        damage = (damage * 1.5.to12bit() / 1.0.to12bit()).round6();
      }
    }

    // タイプ相性
    var efficacy = 1.0;
    for (final type in enemy.currentTypes) {
      efficacy = efficacy * move.type.efficacy(type);
    }
    // ふゆうはじめんタイプの技を受けない
    if (enemy.theory.ability == Abilities.levitate) {
      efficacy = 0.0;
    }
    damage = (damage * efficacy).floor();

    // やけどはダメージが0.5倍
    if (condition.ailment == Ailments.burn) {
      damage = (damage * 0.5.to12bit() / 1.0.to12bit()).round6();
    }

    // ダメージ補正値
    damage = (damage *
            damageCorrect(
              move: move,
              enemy: enemy,
              typeEfficacy: efficacy,
            ) /
            1.0.to12bit())
        .round6();

    return damage;
  }
}
