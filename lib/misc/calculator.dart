import 'dart:math';

import 'package:pokecalc/models/ability_model.dart';

import '../enums/enums.dart';
import '../extensions/double.dart';
import '../extensions/theory.dart';
import '../models/condition_model.dart';
import '../models/environment_model.dart';
import '../models/move_model.dart';
import '../models/stats_model.dart';
import '../models/theory_model.dart';

/// 計算用のCondition
///
/// [Condition]クラスと同等の振る舞いをするために、必要な情報のgetterを追加する
class ConditionForCalc {
  late final Conditions _conditions;

  Condition get self => _conditions.self;
  Condition get enemy => _conditions.enemy;

  ConditionForCalc(Conditions conditions) : _conditions = conditions;

  ConditionForCalc get swap => ConditionForCalc(_conditions.swap);

  static ConditionForCalc initialize({
    required Conditions conditions,
    required Abilities enemyAbility,
  }) {
    // シェルアーマーは急所に当たらない
    if (enemyAbility == Abilities.shell_armor) {
      conditions = conditions.copyWith(
        self: conditions.self.copyWith(
          critical: false,
        ),
      );
    }

    // 急所の時は壁無効
    if (conditions.self.critical) {
      conditions = conditions.copyWith(
        enemy: conditions.enemy.copyWith(
          shield: Shields.none,
        ),
      );
    }

    // 急所の時はランク変化を有利なように変化
    if (conditions.self.critical) {
      conditions = conditions.copyWith(
        // 自分の攻撃、特攻の下降補正を0にする
        self: conditions.self.copyWith(
          rank: conditions.self.copyWith(
            a: max<int>(conditions.self.rank.a, 0),
            c: max<int>(conditions.self.rank.c, 0),
          ),
        ),
        // 相手の防御、特防の上昇補正を0にする
        enemy: conditions.enemy.copyWith(
          rank: conditions.enemy.copyWith(
            b: min<int>(conditions.enemy.rank.b, 0),
            d: min<int>(conditions.enemy.rank.d, 0),
          ),
        ),
      );
    }

    return ConditionForCalc(conditions);
  }
}

/// 計算用のTheory
///
/// [Theory]クラスと同等の振る舞いをするために、必要な情報のgetterを追加する
class TheoryForCalc {
  final Theory _theory;
  late Stats actual;

  AbilityModel get ability => _theory.ability;
  Items get item => _theory.item;
  Pokedex get pokemon => _theory.pokemon;
  bool get terastal => _theory.terastal;
  Types get teratype => _theory.teratype;
  List<Types> get types =>
      _theory.terastal ? [_theory.teratype] : _theory.types;

  /// 飛んでいるかを判定する
  ///
  /// タイプ: 飛行、特性: 浮遊、持ち物: 風船 が該当
  bool get isFlying {
    // タイプ: 飛行
    if (types.contains(Types.flying)) {
      return true;
    }
    // 特性: 浮遊
    else if (ability.state == Abilities.levitate) {
      return true;
    }
    // 持ち物: 風船
    else if (item == Items.airballoon) {
      return true;
    }

    return false;
  }

  TheoryForCalc({
    required Theory theory,
    required Theory enemy,
    required Moves move,
    required ConditionForCalc conditions,
    required Environment environment,
  })  : _theory = theory,
        actual = theory.actual {
    // ランク補正されたステータスを計算する
    int calcRankStats(int stats, int rank) {
      if (rank >= 0) {
        return ((stats * (2 + rank)) / 2).floor();
      } else {
        return ((stats * 2) / (2 + rank.abs())).floor();
      }
    }

    actual = Stats(
      h: actual.h,
      a: calcRankStats(actual.a, conditions.self.rank.a),
      b: calcRankStats(actual.b, conditions.self.rank.b),
      c: calcRankStats(actual.c, conditions.self.rank.c),
      d: calcRankStats(actual.d, conditions.self.rank.d),
      s: calcRankStats(actual.s, conditions.self.rank.s),
    );

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
        if (types.contains(Types.rock)) {
          setCorrect(d: 1.5);
        }
        break;
      case Weathers.hail:
        // あられ+こおりタイプ
        // 防御が1.5倍
        if (types.contains(Types.ice)) {
          setCorrect(b: 1.5);
        }
        break;
      default:
        break;
    }

    switch (theory.ability.state) {
      // スロースタート
      case Abilities.slow_start:
        // 5ターンの間、攻撃が0.5倍
        if (theory.ability.metadata) {
          setCorrect(a: 0.5);
        }
        break;

      // よわき
      case Abilities.defeatist:
        // HPが半分になると、攻撃が0.5倍
        if (theory.ability.metadata) {
          setCorrect(a: 0.5);
        }
        break;

      // クォークチャージ
      case Abilities.quark_drive:
        // エレキフィールド状態か、ブーストエナジーを持っている時、最も高い能力(ランク補正込み)が1.3倍
        if (environment.field == Fields.electric ||
            theory.item == Items.boosterenergy) {
          final highest = actual.toArray().sublist(1).reduce(max);

          if (highest == actual.a) {
            setCorrect(a: 1.3);
          } else if (highest == actual.b) {
            setCorrect(b: 1.3);
          } else if (highest == actual.c) {
            setCorrect(c: 1.3);
          } else if (highest == actual.d) {
            setCorrect(d: 1.3);
          } else if (highest == actual.s) {
            setCorrect(s: 1.5);
          }
        }
        break;

      // こだいかっせい
      case Abilities.protosynthesis:
        // にほんばれ状態か、ブーストエナジーを持っている時、最も高い能力(ランク補正込み)が1.3倍
        if (environment.weather == Weathers.sunshine ||
            theory.item == Items.boosterenergy) {
          final highest = actual.toArray().sublist(1).reduce(max);

          if (highest == actual.a) {
            setCorrect(a: 1.3);
          } else if (highest == actual.b) {
            setCorrect(b: 1.3);
          } else if (highest == actual.c) {
            setCorrect(c: 1.3);
          } else if (highest == actual.d) {
            setCorrect(d: 1.3);
          } else if (highest == actual.s) {
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
        if (conditions.self.ailment != Ailments.none) {
          setCorrect(a: 1.5);
        }
        break;

      // ふしぎなうろこ
      case Abilities.marvel_scale:
        // 状態異常の時、防御が1.5倍
        if (conditions.self.ailment != Ailments.none) {
          setCorrect(b: 1.5);
        }
        break;

      // しんりょく
      case Abilities.overgrow:
        // HPが1/3以下でくさタイプで攻撃する時、攻撃と特攻が1.5倍
        if (theory.ability.metadata) {
          if (move.type == Types.grass) {
            setCorrect(a: 1.5, c: 1.5);
          }
        }
        break;

      // もうか
      case Abilities.blaze:
        // HPが1/3以下でほのおタイプで攻撃する時、攻撃と特攻が1.5倍
        if (theory.ability.metadata) {
          if (move.type == Types.fire) {
            setCorrect(a: 1.5, c: 1.5);
          }
        }
        break;

      // げきりゅう
      case Abilities.torrent:
        // HPが1/3以下でみずタイプで攻撃する時、攻撃と特攻が1.5倍
        if (theory.ability.metadata) {
          if (move.type == Types.water) {
            setCorrect(a: 1.5, c: 1.5);
          }
        }
        break;

      // むしのしらせ
      case Abilities.swarm:
        // HPが1/3以下でむしタイプで攻撃する時、攻撃と特攻が1.5倍
        if (theory.ability.metadata) {
          if (move.type == Types.bug) {
            setCorrect(a: 1.5, c: 1.5);
          }
        }
        break;

      // もらいび
      case Abilities.flash_fire:
        // ほのお技を受けた状態でほのおタイプで攻撃する時、攻撃と特攻が1.5倍
        if (theory.ability.metadata) {
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
        if (theory.ability.metadata) {
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
        if (theory.ability.metadata) {
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

    switch (enemy.ability.state) {
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
    actual = Stats(
      h: min(((actual.h * correct.h) / 1.0.to12bit()).round6(), 0xffffffff),
      a: min(((actual.a * correct.a) / 1.0.to12bit()).round6(), 0xffffffff),
      b: min(((actual.b * correct.b) / 1.0.to12bit()).round6(), 0xffffffff),
      c: min(((actual.c * correct.c) / 1.0.to12bit()).round6(), 0xffffffff),
      d: min(((actual.d * correct.d) / 1.0.to12bit()).round6(), 0xffffffff),
      s: min(((actual.s * correct.s) / 1.0.to12bit()).round6(), 0xffffffff),
    );
  }
}

/// 計算用のMoves
///
/// [Moves]クラスと同等の振る舞いをするために、必要な情報のgetterを追加する
class MoveForCalc {
  final Moves _move;
  final dynamic meta;
  int power;
  MoveCategory category;
  Types type;

  /// 接触技
  bool get isContact {
    if (category == MoveCategory.physical) {
      // 物理技は非接触技を列挙
      switch (_move) {
        case Moves.aqua_cutter:
        case Moves.aqua_step:
        case Moves.attack_order:
        case Moves.aura_wheel:
        case Moves.axe_kick:
        case Moves.barb_barrage:
        case Moves.barrage:
        case Moves.beak_blast:
        case Moves.beat_up:
        case Moves.bitter_blade:
        case Moves.blazing_torque:
        case Moves.bone_club:
        case Moves.bone_rush:
        case Moves.bonemerang:
        case Moves.bulldoze:
        case Moves.bullet_seed:
        case Moves.ceaseless_edge:
        case Moves.collision_course:
        case Moves.combat_torque:
        case Moves.comeuppance:
        case Moves.diamond_storm:
        case Moves.dire_claw:
        case Moves.double_shock:
        case Moves.dragon_darts:
        case Moves.drum_beating:
        case Moves.dual_wingbeat:
        case Moves.earthquake:
        case Moves.egg_bomb:
        case Moves.explosion:
        case Moves.feint:
        case Moves.fissure:
        case Moves.fling:
        case Moves.flower_trick:
        case Moves.freeze_shock:
        case Moves.fusion_bolt:
        case Moves.gigaton_hammer:
        case Moves.glacial_lance:
        case Moves.glaive_rush:
        case Moves.grav_apple:
        case Moves.gunk_shot:
        case Moves.headlong_rush:
        case Moves.hyper_drill:
        case Moves.hyperspace_fury:
        case Moves.ice_shard:
        case Moves.ice_spinner:
        case Moves.icicle_crash:
        case Moves.icicle_spear:
        case Moves.jet_punch:
        case Moves.kowtow_cleave:
        case Moves.lands_wrath:
        case Moves.last_respects:
        case Moves.leafage:
        case Moves.magical_torque:
        case Moves.magnet_bomb:
        case Moves.magnitude:
        case Moves.metal_burst:
        case Moves.meteor_assault:
        case Moves.mortal_spin:
        case Moves.mountain_gale:
        case Moves.natural_gift:
        case Moves.noxious_torque:
        case Moves.order_up:
        case Moves.pay_day:
        case Moves.petal_blizzard:
        case Moves.pin_missile:
        case Moves.poison_sting:
        case Moves.poltergeist:
        case Moves.population_bomb:
        case Moves.pounce:
        case Moves.precipice_blades:
        case Moves.present:
        case Moves.psycho_cut:
        case Moves.psyshield_bash:
        case Moves.pyro_ball:
        case Moves.rage_fist:
        case Moves.raging_bull:
        case Moves.raging_fury:
        case Moves.razor_leaf:
        case Moves.rock_blast:
        case Moves.rock_slide:
        case Moves.rock_throw:
        case Moves.rock_tomb:
        case Moves.rock_wrecker:
        case Moves.sacred_fire:
        case Moves.salt_cure:
        case Moves.sand_tomb:
        case Moves.sappy_seed:
        case Moves.scale_shot:
        case Moves.secret_power:
        case Moves.seed_bomb:
        case Moves.self_destruct:
        case Moves.shadow_bone:
        case Moves.sinister_arrow_raid:
        case Moves.sky_attack:
        case Moves.smack_down:
        case Moves.spike_cannon:
        case Moves.spin_out:
        case Moves.spirit_shackle:
        case Moves.splintered_stormshards:
        case Moves.stone_axe:
        case Moves.stone_edge:
        case Moves.thousand_arrows:
        case Moves.thousand_waves:
        case Moves.trailblaze:
        case Moves.triple_arrows:
        case Moves.triple_dive:
        case Moves.twineedle:
        case Moves.wave_crash:
        case Moves.wicked_torque:
          return false;
        default:
          return true;
      }
    } else {
      // 物理技は接触技を列挙
      switch (_move) {
        case Moves.draining_kiss:
        case Moves.electro_drift:
        case Moves.grass_knot:
        case Moves.infestation:
        case Moves.petal_dance:
        case Moves.trump_card:
        case Moves.wring_out:
          return true;
        default:
          return false;
      }
    }
  }

  /// 拳技
  bool get isPunch {
    switch (_move) {
      case Moves.ice_hammer:
      case Moves.hammer_arm:
      case Moves.thunder_punch:
      case Moves.focus_punch:
      case Moves.power_up_punch:
      case Moves.meteor_mash:
      case Moves.shadow_punch:
      case Moves.sky_uppercut:
      case Moves.drain_punch:
      case Moves.dynamic_punch:
      case Moves.bullet_punch:
      case Moves.dizzy_punch:
      case Moves.plasma_fists:
      case Moves.fire_punch:
      case Moves.mach_punch:
      case Moves.mega_punch:
      case Moves.ice_punch:
      case Moves.comet_punch:
      case Moves.double_iron_bash:
      case Moves.wicked_blow:
      case Moves.surging_strikes:
      case Moves.headlong_rush:
      case Moves.jet_punch:
      case Moves.rage_fist:
        return true;
      default:
        return false;
    }
  }

  /// 牙技
  bool get isBite {
    switch (_move) {
      case Moves.bite:
      case Moves.crunch:
      case Moves.jaw_lock:
      case Moves.poison_fang:
      case Moves.fire_fang:
      case Moves.thunder_fang:
      case Moves.ice_fang:
      case Moves.psychic_fangs:
      case Moves.fishious_rend:
        return true;
      default:
        return false;
    }
  }

  /// 切技
  bool get isCut {
    switch (_move) {
      case Moves.aqua_cutter:
      case Moves.cut:
      case Moves.air_cutter:
      case Moves.air_slash:
      case Moves.stone_axe:
      case Moves.behemoth_blade:
      case Moves.slash:
      case Moves.cross_poison:
      case Moves.psyblade:
      case Moves.psycho_cut:
      case Moves.razor_shell:
      case Moves.x_scissor:
      case Moves.secret_sword:
      case Moves.sacred_sword:
      case Moves.solar_blade:
      case Moves.night_slash:
      case Moves.aerial_ace:
      case Moves.kowtow_cleave:
      case Moves.population_bomb:
      case Moves.razor_leaf:
      case Moves.ceaseless_edge:
      case Moves.bitter_blade:
      case Moves.leaf_blade:
      case Moves.fury_cutter:
        return true;
      default:
        return false;
    }
  }

  /// 音技
  bool get isSound {
    switch (_move) {
      case Moves.snore:
      case Moves.sparkling_aria:
      case Moves.echoed_voice:
      case Moves.uproar:
      case Moves.clanging_scales:
      case Moves.disarming_voice:
      case Moves.snarl:
      case Moves.hyper_voice:
      case Moves.boomburst:
      case Moves.bug_buzz:
      case Moves.round:
      case Moves.overdrive:
      case Moves.eerie_spell:
      case Moves.torch_song:
        return true;
      default:
        return false;
    }
  }

  /// 波動技
  bool get isWave {
    switch (_move) {
      case Moves.dark_pulse:
      case Moves.heal_pulse:
      case Moves.origin_pulse:
      case Moves.terrain_pulse:
      case Moves.aura_sphere:
      case Moves.water_pulse:
      case Moves.dragon_pulse:
        return true;
      default:
        return false;
    }
  }

  /// 反動技
  bool get isRecoil {
    switch (_move) {
      case Moves.head_charge:
      case Moves.wave_crash:
      case Moves.wood_hammer:
      case Moves.submission:
      case Moves.double_edge:
      case Moves.take_down:
      case Moves.flare_blitz:
      case Moves.brave_bird:
      case Moves.volt_tackle:
      case Moves.head_smash:
      case Moves.wild_charge:
      case Moves.light_of_ruin:
        return true;
      default:
        return false;
    }
  }

  MoveForCalc({
    required MoveModel move,
    required TheoryForCalc attacker,
    required TheoryForCalc defence,
    required ConditionForCalc conditions,
    required Environment environment,
  })  : _move = move.state!,
        meta = move.metadata,
        power = move.state!.power ?? 0,
        category = move.state!.category,
        type = move.state!.type {
    // 威力
    if (_move.metaclass == MoveMetaClass.input_power) {
      // 威力入力
      power = move.metadata;
    }

    // 技種別
    if (_move == Moves.tera_blast) {
      if (attacker.actual.a > attacker.actual.c) {
        category = MoveCategory.physical;
      } else {
        category = MoveCategory.special;
      }
    }

    // タイプ
    if (_move == Moves.tera_blast) {
      type = attacker.teratype;
    }

    // 補正値を1.0で初期化
    int correct = 1.0.to12bit();

    // 補正値設定関数
    setCorrect(double mag) =>
        correct = (correct * mag.to12bit() / 1.0.to12bit()).round();

    if (move.state!.metaclass == MoveMetaClass.damage_x2) {
      // 威力2倍
      if (move.metadata) {
        setCorrect(2.0);
      }
    } else if (move.state!.metaclass == MoveMetaClass.damage_x1_5) {
      // 威力1.5倍
      if (move.metadata) {
        setCorrect(1.5);
      }
    }

    switch (attacker.ability.state) {
      // とうそうしん
      case Abilities.rivalry:
        // 同じ性別の相手の時、技の威力が1.25倍
        // 違う性別の相手の時、技の威力が0.75倍
        if (attacker.ability.metadata) {
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
        setCorrect(1.0 + attacker.ability.metadata * 0.1);
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
        if (type == Types.normal) {
          setCorrect(1.2);
        }
        break;

      // てつのこぶし
      case Abilities.iron_fist:
        // 拳技の威力が1.2倍
        if (isPunch) {
          setCorrect(1.2);
        }
        break;

      // すてみ
      case Abilities.reckless:
        // 反動技の威力が1.2倍
        if (isRecoil) {
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
        if (attacker.ability.metadata) {
          setCorrect(1.3);
        }
        break;

      // すなのちから
      case Abilities.sand_force:
        // すなあらしのとき、いわ・じめん・ハガネタイプの技の威力が1.3倍
        if (environment.weather == Weathers.sandstorm) {
          if (type == Types.rock ||
              type == Types.ground ||
              type == Types.steel) {
            setCorrect(1.3);
          }
        }
        break;

      // アナライズ
      case Abilities.analytic:
        // 一番最後に技を出すと威力が1.3倍
        if (attacker.ability.metadata) {
          setCorrect(1.3);
        }
        break;

      case Abilities.tough_claws:
        // 接触技の威力が1.3倍
        if (isContact) {
          setCorrect(1.3);
        }
        break;

      case Abilities.punk_rock:
        // 音技の威力が1.3倍
        if (isSound) {
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
        if (type == Types.fairy) {
          setCorrect(1.33);
        }
        break;

      // ダークオーラ
      case Abilities.dark_aura:
        // 戦闘に出ている全員のあくタイプの技の威力が1.33倍
        if (type == Types.dark) {
          setCorrect(1.33);
        }
        break;

      // はがねのせいしん
      case Abilities.steely_spirit:
        // 戦闘に出ている全員のはがねタイプの技の威力が1.5倍
        if (type == Types.steel) {
          setCorrect(1.5);
        }
        break;

      // テクニシャン
      case Abilities.technician:
        // 威力60以下の技の威力が1.5倍
        if (power <= 60) {
          setCorrect(1.5);
        }
        break;

      // ねつぼうそう
      case Abilities.flare_boost:
        // やけど状態の時、特殊技の威力が1.5倍
        if (conditions.self.ailment == Ailments.burn) {
          setCorrect(1.5);
        }
        break;

      // どくぼうそう
      case Abilities.toxic_boost:
        // どく状態の時、特殊技の威力が1.5倍
        if (conditions.self.ailment == Ailments.poison) {
          setCorrect(1.5);
        }
        break;

      // きれあじ
      case Abilities.sharpness:
        // 切技の威力が1.5倍
        if (isCut) {
          setCorrect(1.5);
        }
        break;

      // がんじょうあご
      case Abilities.strong_jaw:
        // 牙技の威力が1.5倍
        if (isBite) {
          setCorrect(1.5);
        }
        break;

      // メガランチャー
      case Abilities.mega_launcher:
        // 波動技の威力が1.5倍
        if (isWave) {
          setCorrect(1.5);
        }
        break;

      default:
        break;
    }

    switch (_move) {
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

      // てだすけ
      case Moves.helping_hand:
        // 使用したターンの味方の技の威力が1.5倍
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
          if (defence.isFlying == false) {
            setCorrect(1.5);
          }
        }
        break;

      // ライジングボルト
      case Moves.rising_voltage:
        // エレキフィールドで、ひこうタイプ・ふゆう・ふうせんでない時、技の威力が2倍
        if (environment.field == Fields.electric) {
          if (defence.isFlying == false) {
            setCorrect(2.0);
          }
        }
        break;

      // じゅうでん
      case Moves.charge:
        // 次に使うでんきタイプの技の威力が2倍
        break;

      // からげんき
      case Moves.facade:
        // 状態異常の時、技の威力が2倍
        if (conditions.self.ailment != Ailments.none) {
          setCorrect(2.0);
        }
        break;

      // ベノムショック
      case Moves.venoshock:
        // 相手がどく状態の時、威力が2倍
        if (conditions.enemy.ailment == Ailments.poison) {
          setCorrect(2.0);
        }
        break;

      default:
        break;
    }

    switch (attacker.ability.state) {
      // たいねつ
      case Abilities.heatproof:
        // 相手のほのおタイプの技の威力が0.5倍
        if (type == Types.fire) {
          setCorrect(0.5);
        }
        break;

      // かんそうはだ
      case Abilities.dry_skin:
        // 相手のほのおタイプの技の威力が1.25倍
        if (type == Types.fire) {
          setCorrect(1.25);
        }
        break;

      default:
        break;
    }

    switch (attacker.item) {
      // ちからのハチマキ
      case Items.muscleband:
        // 物理技の威力が1.1倍
        if (category == MoveCategory.physical) {
          setCorrect(1.1);
        }
        break;

      // ものしりメガネ
      case Items.wiseglasses:
        // 特殊技の威力が1.1倍
        if (category == MoveCategory.special) {
          setCorrect(1.1);
        }
        break;

      // パンチグローブ
      case Items.punchingglove:
        // パンチ技の威力が1.1倍
        if (isPunch) {
          setCorrect(1.1);
        }
        break;

      // シルクのスカーフ
      case Items.silkscarf:
        // ノーマルタイプの技の威力が1.2倍
        if (type == Types.normal) {
          setCorrect(1.2);
        }
        break;

      // こぶしのプレート
      // くろおび
      case Items.fistplate:
      case Items.blackbelt:
        // かくとうタイプの技の威力が1.2倍
        if (type == Types.fighting) {
          setCorrect(1.2);
        }
        break;

      // がんせきプレート
      // かたいいし
      case Items.stoneplate:
      case Items.hardstone:
        // いわタイプの技の威力が1.2倍
        if (type == Types.rock) {
          setCorrect(1.2);
        }
        break;

      // しずくプレート
      // しんぴのしずく
      case Items.splashplate:
      case Items.mysticwater:
        // みずタイプの技の威力が1.2倍
        if (type == Types.water) {
          setCorrect(1.2);
        }
        break;

      // こわもてプレート
      // くろいメガネ
      case Items.dreadplate:
      case Items.blackglasses:
        // あくタイプの技の威力が1.2倍
        if (type == Types.dark) {
          setCorrect(1.2);
        }
        break;

      // たまむしプレート
      // ぎんのこな
      case Items.insectplate:
      case Items.silverpowder:
        // むしタイプの技の威力が1.2倍
        if (type == Types.bug) {
          setCorrect(1.2);
        }
        break;

      // みどりのプレート
      // きせきのタネ
      case Items.meadowplate:
      case Items.miracleseed:
        // くさタイプの技の威力が1.2倍
        if (type == Types.grass) {
          setCorrect(1.2);
        }
        break;

      // もうどくプレート
      // どくバリ
      case Items.toxicplate:
      case Items.poisonbarb:
        // どくタイプの技の威力が1.2倍
        if (type == Types.poison) {
          setCorrect(1.2);
        }
        break;

      // もののけプレート
      // のろいのおふだ
      case Items.spookyplate:
      case Items.spelltag:
        // ゴーストタイプの技の威力が1.2倍
        if (type == Types.ghost) {
          setCorrect(1.2);
        }
        break;

      // ひのたまプレート
      // もくたん
      case Items.flameplate:
      case Items.charcoal:
        // ほのおタイプの技の威力が1.2倍
        if (type == Types.fire) {
          setCorrect(1.2);
        }
        break;

      // だいちのプレート
      // やわらかいすな
      case Items.earthplate:
      case Items.softsand:
        // じめんタイプの技の威力が1.2倍
        if (type == Types.ground) {
          setCorrect(1.2);
        }
        break;

      // りゅうのプレート
      // りゅうのキバ
      case Items.dracoplate:
      case Items.dragonfang:
        // ドラゴンタイプの技の威力が1.2倍
        if (type == Types.dragon) {
          setCorrect(1.2);
        }
        break;

      // いかずちプレート
      // じしゃく
      case Items.zapplate:
      case Items.magnet:
        // でんきタイプの技の威力が1.2倍
        if (type == Types.electric) {
          setCorrect(1.2);
        }
        break;

      // あおぞらプレート
      // するどいくちばし
      case Items.skyplate:
      case Items.sharpbeak:
        // ひこうタイプの技の威力が1.2倍
        if (type == Types.flying) {
          setCorrect(1.2);
        }
        break;

      // こうてつプレート
      // メタルコート
      case Items.ironplate:
      case Items.metalcoat:
        // はがねタイプの技の威力が1.2倍
        if (type == Types.steel) {
          setCorrect(1.2);
        }
        break;

      // つららのプレート
      // とけないこおり
      case Items.icicleplate:
      case Items.never_meltice:
        // こおりタイプの技の威力が1.2倍
        if (type == Types.ice) {
          setCorrect(1.2);
        }
        break;

      // ふしぎのプレート
      // まがったスプーン
      case Items.mindplate:
      case Items.twistedspoon:
        // エスパータイプの技の威力が1.2倍
        if (type == Types.psychic) {
          setCorrect(1.2);
        }
        break;

      // せいれいプレート
      case Items.pixieplate:
        // フェアリータイプの技の威力が1.2倍
        if (type == Types.fairy) {
          setCorrect(1.2);
        }
        break;

      default:
        break;
    }

    switch (environment.field) {
      case Fields.electric:
        // エレキフィールドの時、地面にいるポケモンのでんきタイプの技の威力が1.3倍
        if (attacker.isFlying == false) {
          if (type == Types.electric) {
            setCorrect(1.3);
          }
        }
        break;

      case Fields.grassy:
        // グラスフィールドの時、地面にいるポケモンのくさタイプの技の威力が1.3倍
        if (attacker.isFlying == false) {
          if (type == Types.grass) {
            setCorrect(1.3);
          }
        }
        // グラスフィールドの時、地面にいるポケモンが受けるじしん・じならし・マグニチュードの技の威力が0.5倍
        if (defence.isFlying == false) {
          if (_move == Moves.earthquake ||
              _move == Moves.bulldoze ||
              _move == Moves.magnitude) {
            setCorrect(0.5);
          }
        }
        break;

      case Fields.misty:
        // ミストフィールドの時、地面にいるポケモンが受けるドラゴンタイプの技の威力が0.5倍
        if (defence.isFlying == false) {
          if (type == Types.dragon) {
            setCorrect(0.5);
          }
        }
        break;

      case Fields.psychic:
        // サイコフィールドの時、面にいるポケモンのエスパータイプの技の威力が1.3倍
        if (attacker.isFlying == false) {
          if (type == Types.psychic) {
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
    power = (power * correct / 1.0.to12bit()).round6().clamp(0, 0xffffffff);

    // テラスタイプと技のタイプが同じで威力が60未満の時は60にする
    if (attacker.terastal) {
      if (attacker.teratype == type) {
        power = power.clamp(60, power);
      }
    }
  }
}

class Damage {
  late ConditionForCalc conditionsForCalc;
  late TheoryForCalc attackerForCalc;
  late TheoryForCalc defenceForCalc;
  late MoveForCalc moveForCalc;
  final Environment environment;

  Damage({
    required Theory attacker,
    required Theory defence,
    required Conditions conditions,
    required MoveModel move,
    required this.environment,
  }) {
    assert(move.state != null);

    conditionsForCalc = ConditionForCalc.initialize(
      conditions: conditions,
      enemyAbility: defence.ability.state,
    );

    attackerForCalc = TheoryForCalc(
      theory: attacker,
      enemy: defence,
      conditions: conditionsForCalc,
      move: move.state!,
      environment: environment,
    );
    defenceForCalc = TheoryForCalc(
      theory: defence,
      enemy: attacker,
      conditions: conditionsForCalc.swap,
      move: move.state!,
      environment: environment,
    );

    moveForCalc = MoveForCalc(
      move: move,
      attacker: attackerForCalc,
      defence: defenceForCalc,
      conditions: conditionsForCalc,
      environment: environment,
    );
  }

  /// ダメージ計算に使用する技の威力の補正値を取得する
  ///
  /// 相手の特性やアイテム、技などを考慮する
  int _damageCorrect(
    double typeEfficacy,
  ) {
    var correct = 1.0.to12bit();
    setCorrect(double mag) =>
        correct = (correct * mag.to12bit() / 1.0.to12bit()).round();

    // リフレクターの時、物理技のダメージを0.5倍
    if (conditionsForCalc.enemy.shield.isPhysical) {
      setCorrect(0.5);
    }
    // ひかりのかべの時、特殊技のダメージを0.5倍
    if (conditionsForCalc.enemy.shield.isSpecial) {
      setCorrect(0.5);
    }

    switch (attackerForCalc.ability.state) {
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
        if (conditionsForCalc.self.critical) {
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

    switch (defenceForCalc.ability.state) {
      // もふもふ
      case Abilities.fluffy:
        // ほのおタイプの技のダメージを2倍
        if (moveForCalc.type == Types.fire) {
          setCorrect(2.0);
        }
        // 接触技のダメージを0.5倍
        if (moveForCalc.isContact) {
          setCorrect(0.5);
        }
        break;

      // マルチスケイル
      case Abilities.multiscale:
        // HP満タンの時に受けるダメージを0.5倍
        if (defenceForCalc.ability.metadata) {
          setCorrect(0.5);
        }
        break;

      // パンクロック
      case Abilities.punk_rock:
        // 受ける音技のダメージを0.5倍
        if (moveForCalc.isSound) {
          setCorrect(0.5);
        }
        break;

      // こおりのりんぷん
      case Abilities.ice_scales:
        // こおりタイプの技のダメージを0.5倍
        if (moveForCalc.type == Types.ice) {
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

    switch (moveForCalc._move) {
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

    switch (attackerForCalc.item) {
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

    switch (defenceForCalc.item) {
      case Items.roseliberry:
        // フェアリータイプの技のダメージを0.5倍
        if (moveForCalc.type == Types.fairy) {
          setCorrect(0.5);
        }
        break;

      case Items.chilanberry:
        // ノーマルタイプの技のダメージを0.5倍
        if (moveForCalc.type == Types.normal) {
          setCorrect(0.5);
        }
        break;

      case Items.babiriberry:
        // はがねタイプの技のダメージを0.5倍
        if (moveForCalc.type == Types.steel) {
          setCorrect(0.5);
        }
        break;

      case Items.colburberry:
        // あくタイプの技のダメージを0.5倍
        if (moveForCalc.type == Types.dark) {
          setCorrect(0.5);
        }
        break;

      case Items.habanberry:
        // ドラゴンタイプの技のダメージを0.5倍
        if (moveForCalc.type == Types.dragon) {
          setCorrect(0.5);
        }
        break;

      case Items.kasibberry:
        // ゴーストタイプの技のダメージを0.5倍
        if (moveForCalc.type == Types.ghost) {
          setCorrect(0.5);
        }
        break;

      case Items.chartiberry:
        // いわタイプの技のダメージを0.5倍
        if (moveForCalc.type == Types.rock) {
          setCorrect(0.5);
        }
        break;

      case Items.tangaberry:
        // むしタイプの技のダメージを0.5倍
        if (moveForCalc.type == Types.rock) {
          setCorrect(0.5);
        }
        break;

      case Items.payapaberry:
        // エスパータイプの技のダメージを0.5倍
        if (moveForCalc.type == Types.psychic) {
          setCorrect(0.5);
        }
        break;

      case Items.cobaberry:
        // ひこうタイプの技のダメージを0.5倍
        if (moveForCalc.type == Types.flying) {
          setCorrect(0.5);
        }
        break;

      case Items.shucaberry:
        // じめんタイプの技のダメージを0.5倍
        if (moveForCalc.type == Types.ground) {
          setCorrect(0.5);
        }
        break;

      case Items.kebiaberry:
        // どくタイプの技のダメージを0.5倍
        if (moveForCalc.type == Types.poison) {
          setCorrect(0.5);
        }
        break;

      case Items.chopleberry:
        // かくとうタイプの技のダメージを0.5倍
        if (moveForCalc.type == Types.fighting) {
          setCorrect(0.5);
        }
        break;

      case Items.yacheberry:
        // こおりタイプの技のダメージを0.5倍
        if (moveForCalc.type == Types.ice) {
          setCorrect(0.5);
        }
        break;

      case Items.rindoberry:
        // くさタイプの技のダメージを0.5倍
        if (moveForCalc.type == Types.grass) {
          setCorrect(0.5);
        }
        break;

      case Items.passhoberry:
        // みずタイプの技のダメージを0.5倍
        if (moveForCalc.type == Types.water) {
          setCorrect(0.5);
        }
        break;

      case Items.occaberry:
        // ほのおタイプの技のダメージを0.5倍
        if (moveForCalc.type == Types.fire) {
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

  int calc(double rand) {
    int damage;

    // 基本ダメージを計算
    // レベル * 2 / 5 + 2
    damage = (100 / 5 + 2).floor();

    // 技のダメージを計算
    if (moveForCalc.category == MoveCategory.physical) {
      damage = (damage *
              moveForCalc.power *
              attackerForCalc.actual.a /
              defenceForCalc.actual.b)
          .floor();
    } else {
      damage = (damage *
              moveForCalc.power *
              attackerForCalc.actual.c /
              defenceForCalc.actual.d)
          .floor();
    }
    damage = (damage / 50 + 2).floor();

    // 天候強化
    switch (environment.weather) {
      case Weathers.sunshine:
        if (moveForCalc.type == Types.fire) {
          // ほのおタイプの技のダメージが1.5倍
          damage = (damage * 1.5.to12bit() / 1.0.to12bit()).round6();
        } else if (moveForCalc.type == Types.water) {
          if (moveForCalc._move == Moves.hydro_steam) {
            // ハイドロスチームは雨の時に威力が1.5倍
            damage = (damage * 1.5.to12bit() / 1.0.to12bit()).round6();
          } else {
            // みずタイプの技のダメージが0.5倍
            damage = (damage * 0.5.to12bit() / 1.0.to12bit()).round6();
          }
        }
        break;

      case Weathers.rain:
        if (moveForCalc.type == Types.water) {
          // みずタイプの技のダメージが1.5倍
          damage = (damage * 1.5.to12bit() / 1.0.to12bit()).round6();
        } else if (moveForCalc.type == Types.fire) {
          // ほのおタイプの技のダメージが0.5倍
          damage = (damage * 0.5.to12bit() / 1.0.to12bit()).round6();
        }
        break;

      default:
        break;
    }

    // サイコブレイドはエレキフィールドの時、威力が1.5倍
    // TODO: 計算場所は要確認
    if (moveForCalc._move == Moves.psyblade &&
        environment.field == Fields.electric) {
      damage = (damage * 1.5.to12bit() / 1.0.to12bit()).round6();
    }

    // 急所はダメージが1.5倍
    if (conditionsForCalc.self.critical) {
      damage = (damage * 1.5.to12bit() / 1.0.to12bit()).round6();
    }

    // 乱数
    damage = (damage * rand.to12bit() / 1.0.to12bit()).floor();

    // タイプ一致
    // テラスタイプ一致
    if (attackerForCalc.terastal &&
        attackerForCalc.teratype == moveForCalc.type) {
      if (attackerForCalc.ability.state == Abilities.adaptability) {
        // テラスタイプ一致+適応力は2.25倍
        damage = (damage * 2.25.to12bit() / 1.0.to12bit()).round6();
      } else {
        if (attackerForCalc.pokemon.types.contains(attackerForCalc.teratype)) {
          // 元のタイプと同じテラスタイプの場合は2倍
          damage = (damage * 2.0.to12bit() / 1.0.to12bit()).round6();
        } else {
          // テラスタイプ一致は1.5倍
          damage = (damage * 1.5.to12bit() / 1.0.to12bit()).round6();
        }
      }
    } else if (attackerForCalc.types.contains(moveForCalc.type)) {
      if (attackerForCalc.ability.state == Abilities.adaptability) {
        // タイプ一致+適応力は2倍
        damage = (damage * 2.0.to12bit() / 1.0.to12bit()).round6();
      } else {
        // タイプ一致は1.5倍
        damage = (damage * 1.5.to12bit() / 1.0.to12bit()).round6();
      }
    }

    // タイプ相性
    var efficacy = 1.0;
    for (final type in defenceForCalc.types) {
      efficacy = efficacy * moveForCalc.type.efficacy(type);
    }
    // ふゆうはじめんタイプの技を受けない
    if (defenceForCalc.ability.state == Abilities.levitate) {
      efficacy = 0.0;
    }
    damage = (damage * efficacy).floor();

    // やけどはダメージが0.5倍
    if (conditionsForCalc.self.ailment == Ailments.burn) {
      damage = (damage * 0.5.to12bit() / 1.0.to12bit()).round6();
    }

    // ダメージ補正値
    damage = (damage * _damageCorrect(efficacy) / 1.0.to12bit()).round6();

    // 連続攻撃
    if (moveForCalc._move.metaclass == MoveMetaClass.hits_x1_x10 ||
        moveForCalc._move.metaclass == MoveMetaClass.hits_x2_x5) {
      damage = damage * moveForCalc.meta as int;
    } else if (moveForCalc._move.metaclass == MoveMetaClass.hits_x2) {
      damage = damage * 2;
    } else if (moveForCalc._move.metaclass == MoveMetaClass.hits_x3) {
      damage = damage * 3;
    }

    return damage;
  }
}
