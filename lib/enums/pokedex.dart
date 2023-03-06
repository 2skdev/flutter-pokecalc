// ignore_for_file: constant_identifier_names
import '../models/stats_model.dart';
import 'abilities.dart';
import 'base.dart';
import 'types.dart';

enum Pokedex implements StringNamedEnum {
  sprigatito(
    string: "ニャオハ",
    types: [Types.grass],
    abilities: [Abilities.overgrow, Abilities.protean],
    stats: Stats(h: 40, a: 61, b: 54, c: 45, d: 45, s: 65),
  ),
  floragato(
    string: "ニャローテ",
    types: [Types.grass],
    abilities: [Abilities.overgrow, Abilities.protean],
    stats: Stats(h: 61, a: 80, b: 63, c: 60, d: 63, s: 83),
  ),
  meowscarada(
    string: "マスカーニャ",
    types: [Types.grass, Types.dark],
    abilities: [Abilities.overgrow, Abilities.protean],
    stats: Stats(h: 76, a: 110, b: 70, c: 81, d: 70, s: 123),
  ),
  fuecoco(
    string: "ホゲータ",
    types: [Types.fire],
    abilities: [Abilities.blaze, Abilities.unaware],
    stats: Stats(h: 67, a: 45, b: 59, c: 63, d: 40, s: 36),
  ),
  crocalor(
    string: "アチゲータ",
    types: [Types.fire],
    abilities: [Abilities.blaze, Abilities.unaware],
    stats: Stats(h: 81, a: 55, b: 78, c: 90, d: 58, s: 49),
  ),
  skeledirge(
    string: "ラウドボーン",
    types: [Types.fire, Types.ghost],
    abilities: [Abilities.blaze, Abilities.unaware],
    stats: Stats(h: 104, a: 75, b: 100, c: 110, d: 75, s: 66),
  ),
  quaxly(
    string: "クワッス",
    types: [Types.water],
    abilities: [Abilities.torrent, Abilities.moxie],
    stats: Stats(h: 55, a: 65, b: 45, c: 50, d: 45, s: 50),
  ),
  quaxwell(
    string: "ウェルカモ",
    types: [Types.water],
    abilities: [Abilities.torrent, Abilities.moxie],
    stats: Stats(h: 70, a: 85, b: 65, c: 65, d: 60, s: 65),
  ),
  quaquaval(
    string: "ウェーニバル",
    types: [Types.water, Types.fighting],
    abilities: [Abilities.torrent, Abilities.moxie],
    stats: Stats(h: 85, a: 120, b: 80, c: 85, d: 75, s: 85),
  ),
  lechonk(
    string: "グルトン",
    types: [Types.normal],
    abilities: [Abilities.aroma_veil, Abilities.gluttony, Abilities.thick_fat],
    stats: Stats(h: 54, a: 45, b: 40, c: 35, d: 45, s: 35),
  ),
  oinkologne_male(
    string: "パフュートン(オスのすがた)",
    types: [Types.normal],
    abilities: [
      Abilities.lingering_aroma,
      Abilities.gluttony,
      Abilities.thick_fat
    ],
    stats: Stats(h: 110, a: 100, b: 75, c: 59, d: 80, s: 65),
  ),
  oinkologne_female(
    string: "パフュートン(メスのすがた)",
    types: [Types.normal],
    abilities: [Abilities.aroma_veil, Abilities.gluttony, Abilities.thick_fat],
    stats: Stats(h: 115, a: 90, b: 70, c: 59, d: 90, s: 65),
  ),
  tarountula(
    string: "タマンチュラ",
    types: [Types.bug],
    abilities: [Abilities.insomnia, Abilities.stakeout],
    stats: Stats(h: 35, a: 41, b: 45, c: 29, d: 40, s: 20),
  ),
  spidops(
    string: "ワナイダー",
    types: [Types.bug],
    abilities: [Abilities.insomnia, Abilities.stakeout],
    stats: Stats(h: 60, a: 79, b: 92, c: 52, d: 86, s: 35),
  ),
  nymble(
    string: "マメバッタ",
    types: [Types.bug],
    abilities: [Abilities.swarm, Abilities.tinted_lens],
    stats: Stats(h: 33, a: 46, b: 40, c: 21, d: 25, s: 45),
  ),
  lokix(
    string: "エクスレッグ",
    types: [Types.bug, Types.dark],
    abilities: [Abilities.swarm, Abilities.tinted_lens],
    stats: Stats(h: 71, a: 102, b: 78, c: 52, d: 55, s: 92),
  ),
  hoppip(
    string: "ハネッコ",
    types: [Types.grass, Types.flying],
    abilities: [
      Abilities.chlorophyll,
      Abilities.leaf_guard,
      Abilities.infiltrator
    ],
    stats: Stats(h: 35, a: 35, b: 40, c: 35, d: 55, s: 50),
  ),
  skiploom(
    string: "ポポッコ",
    types: [Types.grass, Types.flying],
    abilities: [
      Abilities.chlorophyll,
      Abilities.leaf_guard,
      Abilities.infiltrator
    ],
    stats: Stats(h: 55, a: 45, b: 50, c: 45, d: 65, s: 80),
  ),
  jumpluff(
    string: "ワタッコ",
    types: [Types.grass, Types.flying],
    abilities: [
      Abilities.chlorophyll,
      Abilities.leaf_guard,
      Abilities.infiltrator
    ],
    stats: Stats(h: 75, a: 55, b: 70, c: 55, d: 95, s: 110),
  ),
  fletchling(
    string: "ヤヤコマ",
    types: [Types.normal, Types.flying],
    abilities: [Abilities.big_pecks, Abilities.gale_wings],
    stats: Stats(h: 45, a: 50, b: 43, c: 40, d: 38, s: 62),
  ),
  fletchinder(
    string: "ヒノヤコマ",
    types: [Types.fire, Types.flying],
    abilities: [Abilities.flame_body, Abilities.gale_wings],
    stats: Stats(h: 62, a: 73, b: 55, c: 56, d: 52, s: 84),
  ),
  talonflame(
    string: "ファイアロー",
    types: [Types.fire, Types.flying],
    abilities: [Abilities.flame_body, Abilities.gale_wings],
    stats: Stats(h: 78, a: 81, b: 71, c: 74, d: 69, s: 126),
  ),
  pawmi(
    string: "パモ",
    types: [Types.electric],
    abilities: [Abilities.static, Abilities.natural_cure, Abilities.iron_fist],
    stats: Stats(h: 45, a: 50, b: 20, c: 40, d: 25, s: 60),
  ),
  pawmo(
    string: "パモット",
    types: [Types.electric, Types.fighting],
    abilities: [
      Abilities.volt_absorb,
      Abilities.natural_cure,
      Abilities.iron_fist
    ],
    stats: Stats(h: 60, a: 75, b: 40, c: 50, d: 40, s: 85),
  ),
  pawmot(
    string: "パーモット",
    types: [Types.electric, Types.fighting],
    abilities: [
      Abilities.volt_absorb,
      Abilities.natural_cure,
      Abilities.iron_fist
    ],
    stats: Stats(h: 70, a: 115, b: 70, c: 70, d: 60, s: 105),
  ),
  houndour(
    string: "デルビル",
    types: [Types.dark, Types.fire],
    abilities: [Abilities.early_bird, Abilities.flash_fire, Abilities.unnerve],
    stats: Stats(h: 45, a: 60, b: 30, c: 80, d: 50, s: 65),
  ),
  houndoom(
    string: "ヘルガー",
    types: [Types.dark, Types.fire],
    abilities: [Abilities.early_bird, Abilities.flash_fire, Abilities.unnerve],
    stats: Stats(h: 75, a: 90, b: 50, c: 110, d: 80, s: 95),
  ),
  yungoos(
    string: "ヤングース",
    types: [Types.normal],
    abilities: [
      Abilities.strong_jaw,
      Abilities.stakeout,
      Abilities.adaptability
    ],
    stats: Stats(h: 48, a: 70, b: 30, c: 30, d: 30, s: 45),
  ),
  gumshoos(
    string: "デカグース",
    types: [Types.normal],
    abilities: [
      Abilities.strong_jaw,
      Abilities.stakeout,
      Abilities.adaptability
    ],
    stats: Stats(h: 88, a: 110, b: 60, c: 55, d: 60, s: 45),
  ),
  skwovet(
    string: "ホシガリス",
    types: [Types.normal],
    abilities: [Abilities.cheek_pouch, Abilities.gluttony],
    stats: Stats(h: 70, a: 55, b: 55, c: 35, d: 35, s: 25),
  ),
  greedent(
    string: "ヨクバリス",
    types: [Types.normal],
    abilities: [Abilities.cheek_pouch, Abilities.gluttony],
    stats: Stats(h: 120, a: 95, b: 95, c: 55, d: 75, s: 20),
  ),
  sunkern(
    string: "ヒマナッツ",
    types: [Types.grass],
    abilities: [
      Abilities.chlorophyll,
      Abilities.solar_power,
      Abilities.early_bird
    ],
    stats: Stats(h: 30, a: 30, b: 30, c: 30, d: 30, s: 30),
  ),
  sunflora(
    string: "キマワリ",
    types: [Types.grass],
    abilities: [
      Abilities.chlorophyll,
      Abilities.solar_power,
      Abilities.early_bird
    ],
    stats: Stats(h: 75, a: 75, b: 55, c: 105, d: 85, s: 30),
  ),
  kricketot(
    string: "コロボーシ",
    types: [Types.bug],
    abilities: [Abilities.shed_skin, Abilities.run_away],
    stats: Stats(h: 37, a: 25, b: 41, c: 25, d: 41, s: 25),
  ),
  kricketune(
    string: "コロトック",
    types: [Types.bug],
    abilities: [Abilities.swarm, Abilities.technician],
    stats: Stats(h: 77, a: 85, b: 51, c: 55, d: 51, s: 65),
  ),
  scatterbug(
    string: "コフキムシ",
    types: [Types.bug],
    abilities: [
      Abilities.shield_dust,
      Abilities.compound_eyes,
      Abilities.friend_guard
    ],
    stats: Stats(h: 38, a: 35, b: 40, c: 27, d: 25, s: 35),
  ),
  spewpa(
    string: "コフーライ",
    types: [Types.bug],
    abilities: [Abilities.shed_skin, Abilities.friend_guard],
    stats: Stats(h: 45, a: 22, b: 60, c: 27, d: 30, s: 29),
  ),
  vivillon(
    string: "ビビヨン",
    types: [Types.bug, Types.flying],
    abilities: [
      Abilities.shield_dust,
      Abilities.compound_eyes,
      Abilities.friend_guard
    ],
    stats: Stats(h: 80, a: 52, b: 50, c: 90, d: 50, s: 89),
  ),
  combee(
    string: "ミツハニー",
    types: [Types.bug, Types.flying],
    abilities: [Abilities.honey_gather, Abilities.hustle],
    stats: Stats(h: 30, a: 30, b: 42, c: 30, d: 42, s: 70),
  ),
  vespiquen(
    string: "ビークイン",
    types: [Types.bug, Types.flying],
    abilities: [Abilities.pressure, Abilities.unnerve],
    stats: Stats(h: 70, a: 80, b: 102, c: 80, d: 102, s: 40),
  ),
  rookidee(
    string: "ココガラ",
    types: [Types.flying],
    abilities: [Abilities.keen_eye, Abilities.unnerve, Abilities.big_pecks],
    stats: Stats(h: 38, a: 47, b: 35, c: 33, d: 35, s: 57),
  ),
  corvisquire(
    string: "アオガラス",
    types: [Types.flying],
    abilities: [Abilities.keen_eye, Abilities.unnerve, Abilities.big_pecks],
    stats: Stats(h: 68, a: 67, b: 55, c: 43, d: 55, s: 77),
  ),
  corviknight(
    string: "アーマーガア",
    types: [Types.flying, Types.steel],
    abilities: [Abilities.pressure, Abilities.unnerve, Abilities.mirror_armor],
    stats: Stats(h: 98, a: 87, b: 105, c: 53, d: 85, s: 67),
  ),
  happiny(
    string: "ピンプク",
    types: [Types.normal],
    abilities: [
      Abilities.natural_cure,
      Abilities.serene_grace,
      Abilities.friend_guard
    ],
    stats: Stats(h: 100, a: 5, b: 5, c: 15, d: 65, s: 30),
  ),
  chansey(
    string: "ラッキー",
    types: [Types.normal],
    abilities: [
      Abilities.natural_cure,
      Abilities.serene_grace,
      Abilities.healer
    ],
    stats: Stats(h: 250, a: 5, b: 5, c: 35, d: 105, s: 50),
  ),
  blissey(
    string: "ハピナス",
    types: [Types.normal],
    abilities: [
      Abilities.natural_cure,
      Abilities.serene_grace,
      Abilities.healer
    ],
    stats: Stats(h: 255, a: 10, b: 10, c: 75, d: 135, s: 55),
  ),
  azurill(
    string: "ルリリ",
    types: [Types.normal, Types.fairy],
    abilities: [
      Abilities.thick_fat,
      Abilities.huge_power,
      Abilities.sap_sipper
    ],
    stats: Stats(h: 50, a: 20, b: 40, c: 20, d: 40, s: 20),
  ),
  marill(
    string: "マリル",
    types: [Types.water, Types.fairy],
    abilities: [
      Abilities.thick_fat,
      Abilities.huge_power,
      Abilities.sap_sipper
    ],
    stats: Stats(h: 70, a: 20, b: 50, c: 20, d: 50, s: 40),
  ),
  azumarill(
    string: "マリルリ",
    types: [Types.water, Types.fairy],
    abilities: [
      Abilities.thick_fat,
      Abilities.huge_power,
      Abilities.sap_sipper
    ],
    stats: Stats(h: 100, a: 50, b: 80, c: 60, d: 80, s: 50),
  ),
  surskit(
    string: "アメタマ",
    types: [Types.bug, Types.water],
    abilities: [Abilities.swift_swim, Abilities.rain_dish],
    stats: Stats(h: 40, a: 30, b: 32, c: 50, d: 52, s: 65),
  ),
  masquerain(
    string: "アメモース",
    types: [Types.bug, Types.flying],
    abilities: [Abilities.intimidate, Abilities.unnerve],
    stats: Stats(h: 70, a: 60, b: 62, c: 100, d: 82, s: 80),
  ),
  buizel(
    string: "ブイゼル",
    types: [Types.water],
    abilities: [Abilities.swift_swim, Abilities.water_veil],
    stats: Stats(h: 55, a: 65, b: 35, c: 60, d: 30, s: 85),
  ),
  floatzel(
    string: "フローゼル",
    types: [Types.water],
    abilities: [Abilities.swift_swim, Abilities.water_veil],
    stats: Stats(h: 85, a: 105, b: 55, c: 85, d: 50, s: 115),
  ),
  wooper(
    string: "ウパー",
    types: [Types.water, Types.ground],
    abilities: [Abilities.damp, Abilities.water_absorb, Abilities.unaware],
    stats: Stats(h: 55, a: 45, b: 45, c: 25, d: 25, s: 15),
  ),
  wooper_paldean(
    string: "ウパー(パルデアのすがた)",
    types: [Types.poison, Types.ground],
    abilities: [
      Abilities.poison_point,
      Abilities.water_absorb,
      Abilities.unaware
    ],
    stats: Stats(h: 55, a: 45, b: 45, c: 25, d: 25, s: 15),
  ),
  quagsire(
    string: "ヌオー",
    types: [Types.water, Types.ground],
    abilities: [Abilities.damp, Abilities.water_absorb, Abilities.unaware],
    stats: Stats(h: 95, a: 85, b: 85, c: 65, d: 65, s: 35),
  ),
  clodsire(
    string: "ドオー",
    types: [Types.poison, Types.ground],
    abilities: [
      Abilities.poison_point,
      Abilities.water_absorb,
      Abilities.unaware
    ],
    stats: Stats(h: 130, a: 75, b: 60, c: 45, d: 100, s: 20),
  ),
  psyduck(
    string: "コダック",
    types: [Types.water],
    abilities: [Abilities.damp, Abilities.cloud_nine, Abilities.swift_swim],
    stats: Stats(h: 50, a: 52, b: 48, c: 65, d: 50, s: 55),
  ),
  golduck(
    string: "ゴルダック",
    types: [Types.water],
    abilities: [Abilities.damp, Abilities.cloud_nine, Abilities.swift_swim],
    stats: Stats(h: 80, a: 82, b: 78, c: 95, d: 80, s: 85),
  ),
  chewtle(
    string: "カムカメ",
    types: [Types.water],
    abilities: [
      Abilities.strong_jaw,
      Abilities.shell_armor,
      Abilities.swift_swim
    ],
    stats: Stats(h: 50, a: 64, b: 50, c: 38, d: 38, s: 44),
  ),
  drednaw(
    string: "カジリガメ",
    types: [Types.water, Types.rock],
    abilities: [
      Abilities.strong_jaw,
      Abilities.shell_armor,
      Abilities.swift_swim
    ],
    stats: Stats(h: 90, a: 115, b: 90, c: 48, d: 68, s: 74),
  ),
  igglybuff(
    string: "ププリン",
    types: [Types.normal, Types.fairy],
    abilities: [
      Abilities.cute_charm,
      Abilities.competitive,
      Abilities.friend_guard
    ],
    stats: Stats(h: 90, a: 30, b: 15, c: 40, d: 20, s: 15),
  ),
  jigglypuff(
    string: "プリン",
    types: [Types.normal, Types.fairy],
    abilities: [
      Abilities.cute_charm,
      Abilities.competitive,
      Abilities.friend_guard
    ],
    stats: Stats(h: 115, a: 45, b: 20, c: 45, d: 25, s: 20),
  ),
  wigglytuff(
    string: "プクリン",
    types: [Types.normal, Types.fairy],
    abilities: [Abilities.cute_charm, Abilities.competitive, Abilities.frisk],
    stats: Stats(h: 140, a: 70, b: 45, c: 85, d: 50, s: 45),
  ),
  ralts(
    string: "ラルトス",
    types: [Types.psychic, Types.fairy],
    abilities: [Abilities.synchronize, Abilities.trace, Abilities.telepathy],
    stats: Stats(h: 28, a: 25, b: 25, c: 45, d: 35, s: 40),
  ),
  kirlia(
    string: "キルリア",
    types: [Types.psychic, Types.fairy],
    abilities: [Abilities.synchronize, Abilities.trace, Abilities.telepathy],
    stats: Stats(h: 38, a: 35, b: 35, c: 65, d: 55, s: 50),
  ),
  gardevoir(
    string: "サーナイト",
    types: [Types.psychic, Types.fairy],
    abilities: [Abilities.synchronize, Abilities.trace, Abilities.telepathy],
    stats: Stats(h: 68, a: 65, b: 65, c: 125, d: 115, s: 80),
  ),
  gallade(
    string: "エルレイド",
    types: [Types.psychic, Types.fighting],
    abilities: [Abilities.steadfast, Abilities.sharpness, Abilities.justified],
    stats: Stats(h: 68, a: 125, b: 65, c: 65, d: 115, s: 80),
  ),
  drowzee(
    string: "スリープ",
    types: [Types.psychic],
    abilities: [Abilities.insomnia, Abilities.forewarn, Abilities.inner_focus],
    stats: Stats(h: 60, a: 48, b: 45, c: 43, d: 90, s: 42),
  ),
  hypno(
    string: "スリーパー",
    types: [Types.psychic],
    abilities: [Abilities.insomnia, Abilities.forewarn, Abilities.inner_focus],
    stats: Stats(h: 85, a: 73, b: 70, c: 73, d: 115, s: 67),
  ),
  gastly(
    string: "ゴース",
    types: [Types.ghost, Types.poison],
    abilities: [Abilities.levitate],
    stats: Stats(h: 30, a: 35, b: 30, c: 100, d: 35, s: 80),
  ),
  haunter(
    string: "ゴースト",
    types: [Types.ghost, Types.poison],
    abilities: [Abilities.levitate],
    stats: Stats(h: 45, a: 50, b: 45, c: 115, d: 55, s: 95),
  ),
  gengar(
    string: "ゲンガー",
    types: [Types.ghost, Types.poison],
    abilities: [Abilities.cursed_body],
    stats: Stats(h: 60, a: 65, b: 60, c: 130, d: 75, s: 110),
  ),
  tandemaus(
    string: "ワッカネズミ",
    types: [Types.normal],
    abilities: [Abilities.run_away, Abilities.pickup, Abilities.own_tempo],
    stats: Stats(h: 50, a: 50, b: 45, c: 40, d: 45, s: 75),
  ),
  maushold(
    string: "イッカネズミ",
    types: [Types.normal],
    abilities: [
      Abilities.friend_guard,
      Abilities.cheek_pouch,
      Abilities.technician
    ],
    stats: Stats(h: 74, a: 75, b: 70, c: 65, d: 75, s: 111),
  ),
  pichu(
    string: "ピチュー",
    types: [Types.electric],
    abilities: [Abilities.static, Abilities.lightning_rod],
    stats: Stats(h: 20, a: 40, b: 15, c: 35, d: 35, s: 60),
  ),
  pikachu(
    string: "ピカチュウ",
    types: [Types.electric],
    abilities: [Abilities.static, Abilities.lightning_rod],
    stats: Stats(h: 35, a: 55, b: 40, c: 50, d: 50, s: 90),
  ),
  raichu(
    string: "ライチュウ",
    types: [Types.electric],
    abilities: [Abilities.static, Abilities.lightning_rod],
    stats: Stats(h: 60, a: 90, b: 55, c: 90, d: 80, s: 110),
  ),
  fidough(
    string: "パピモッチ",
    types: [Types.fairy],
    abilities: [Abilities.own_tempo, Abilities.klutz],
    stats: Stats(h: 37, a: 55, b: 70, c: 30, d: 55, s: 65),
  ),
  dachsbun(
    string: "バウッツェル",
    types: [Types.fairy],
    abilities: [Abilities.well_baked_body, Abilities.aroma_veil],
    stats: Stats(h: 57, a: 80, b: 115, c: 50, d: 80, s: 95),
  ),
  slakoth(
    string: "ナマケロ",
    types: [Types.normal],
    abilities: [Abilities.truant],
    stats: Stats(h: 60, a: 60, b: 60, c: 35, d: 35, s: 30),
  ),
  vigoroth(
    string: "ヤルキモノ",
    types: [Types.normal],
    abilities: [Abilities.vital_spirit],
    stats: Stats(h: 80, a: 80, b: 80, c: 55, d: 55, s: 90),
  ),
  slaking(
    string: "ケッキング",
    types: [Types.normal],
    abilities: [Abilities.truant],
    stats: Stats(h: 150, a: 160, b: 100, c: 95, d: 65, s: 100),
  ),
  bounsweet(
    string: "アマカジ",
    types: [Types.grass],
    abilities: [
      Abilities.leaf_guard,
      Abilities.oblivious,
      Abilities.sweet_veil
    ],
    stats: Stats(h: 42, a: 30, b: 38, c: 30, d: 38, s: 32),
  ),
  steenee(
    string: "アママイコ",
    types: [Types.grass],
    abilities: [
      Abilities.leaf_guard,
      Abilities.oblivious,
      Abilities.sweet_veil
    ],
    stats: Stats(h: 52, a: 40, b: 48, c: 40, d: 48, s: 62),
  ),
  tsareena(
    string: "アマージョ",
    types: [Types.grass],
    abilities: [
      Abilities.leaf_guard,
      Abilities.queenly_majesty,
      Abilities.sweet_veil
    ],
    stats: Stats(h: 72, a: 120, b: 98, c: 50, d: 98, s: 72),
  ),
  smoliv(
    string: "ミニーブ",
    types: [Types.grass, Types.normal],
    abilities: [Abilities.early_bird, Abilities.harvest],
    stats: Stats(h: 41, a: 35, b: 45, c: 58, d: 51, s: 30),
  ),
  dolliv(
    string: "オリーニョ",
    types: [Types.grass, Types.normal],
    abilities: [Abilities.early_bird, Abilities.harvest],
    stats: Stats(h: 52, a: 53, b: 60, c: 78, d: 78, s: 33),
  ),
  arboliva(
    string: "オリーヴァ",
    types: [Types.grass, Types.normal],
    abilities: [Abilities.seed_sower, Abilities.harvest],
    stats: Stats(h: 78, a: 69, b: 90, c: 125, d: 109, s: 39),
  ),
  bonsly(
    string: "ウソハチ",
    types: [Types.rock],
    abilities: [Abilities.sturdy, Abilities.rock_head, Abilities.rattled],
    stats: Stats(h: 50, a: 80, b: 95, c: 10, d: 45, s: 10),
  ),
  sudowoodo(
    string: "ウソッキー",
    types: [Types.rock],
    abilities: [Abilities.sturdy, Abilities.rock_head, Abilities.rattled],
    stats: Stats(h: 70, a: 100, b: 115, c: 30, d: 65, s: 30),
  ),
  rockruff(
    string: "イワンコ",
    types: [Types.rock],
    abilities: [
      Abilities.keen_eye,
      Abilities.vital_spirit,
      Abilities.steadfast,
      Abilities.own_tempo
    ],
    stats: Stats(h: 45, a: 65, b: 40, c: 30, d: 40, s: 60),
  ),
  lycanroc(
    string: "ルガルガン(まひるのすがた)",
    types: [Types.rock],
    abilities: [Abilities.keen_eye, Abilities.sand_rush, Abilities.steadfast],
    stats: Stats(h: 75, a: 115, b: 65, c: 55, d: 65, s: 112),
  ),
  lycanroc_midnight(
    string: "ルガルガン(まよなかのすがた)",
    types: [Types.rock],
    abilities: [Abilities.keen_eye, Abilities.vital_spirit, Abilities.no_guard],
    stats: Stats(h: 85, a: 115, b: 75, c: 55, d: 75, s: 82),
  ),
  lycanroc_dusk(
    string: "ルガルガン(たそがれのすがた)",
    types: [Types.rock],
    abilities: [Abilities.tough_claws],
    stats: Stats(h: 75, a: 117, b: 65, c: 55, d: 65, s: 110),
  ),
  rolycoly(
    string: "タンドン",
    types: [Types.rock],
    abilities: [
      Abilities.steam_engine,
      Abilities.heatproof,
      Abilities.flash_fire
    ],
    stats: Stats(h: 30, a: 40, b: 50, c: 40, d: 50, s: 30),
  ),
  carkol(
    string: "トロッゴン",
    types: [Types.rock, Types.fire],
    abilities: [
      Abilities.steam_engine,
      Abilities.flame_body,
      Abilities.flash_fire
    ],
    stats: Stats(h: 80, a: 60, b: 90, c: 60, d: 70, s: 50),
  ),
  coalossal(
    string: "セキタンザン",
    types: [Types.rock, Types.fire],
    abilities: [
      Abilities.steam_engine,
      Abilities.flame_body,
      Abilities.flash_fire
    ],
    stats: Stats(h: 110, a: 80, b: 120, c: 80, d: 90, s: 30),
  ),
  shinx(
    string: "コリンク",
    types: [Types.electric],
    abilities: [Abilities.rivalry, Abilities.intimidate, Abilities.guts],
    stats: Stats(h: 45, a: 65, b: 34, c: 40, d: 34, s: 45),
  ),
  luxio(
    string: "ルクシオ",
    types: [Types.electric],
    abilities: [Abilities.rivalry, Abilities.intimidate, Abilities.guts],
    stats: Stats(h: 60, a: 85, b: 49, c: 60, d: 49, s: 60),
  ),
  luxray(
    string: "レントラー",
    types: [Types.electric],
    abilities: [Abilities.rivalry, Abilities.intimidate, Abilities.guts],
    stats: Stats(h: 80, a: 120, b: 79, c: 95, d: 79, s: 70),
  ),
  starly(
    string: "ムックル",
    types: [Types.normal, Types.flying],
    abilities: [Abilities.keen_eye, Abilities.reckless],
    stats: Stats(h: 40, a: 55, b: 30, c: 30, d: 30, s: 60),
  ),
  staravia(
    string: "ムクバード",
    types: [Types.normal, Types.flying],
    abilities: [Abilities.intimidate, Abilities.reckless],
    stats: Stats(h: 55, a: 75, b: 50, c: 40, d: 40, s: 80),
  ),
  staraptor(
    string: "ムクホーク",
    types: [Types.normal, Types.flying],
    abilities: [Abilities.intimidate, Abilities.reckless],
    stats: Stats(h: 85, a: 120, b: 70, c: 50, d: 60, s: 100),
  ),
  oricorio(
    string: "オドリドリ(めらめらスタイル)",
    types: [Types.fire, Types.flying],
    abilities: [Abilities.dancer],
    stats: Stats(h: 75, a: 70, b: 70, c: 98, d: 70, s: 93),
  ),
  oricorio_pom_pom(
    string: "オドリドリ(ぱちぱちスタイル)",
    types: [Types.electric, Types.flying],
    abilities: [Abilities.dancer],
    stats: Stats(h: 75, a: 70, b: 70, c: 98, d: 70, s: 93),
  ),
  oricorio_pau(
    string: "オドリドリ(ふらふらスタイル)",
    types: [Types.psychic, Types.flying],
    abilities: [Abilities.dancer],
    stats: Stats(h: 75, a: 70, b: 70, c: 98, d: 70, s: 93),
  ),
  oricorio_sensu(
    string: "オドリドリ(まいまいスタイル)",
    types: [Types.ghost, Types.flying],
    abilities: [Abilities.dancer],
    stats: Stats(h: 75, a: 70, b: 70, c: 98, d: 70, s: 93),
  ),
  mareep(
    string: "メリープ",
    types: [Types.electric],
    abilities: [Abilities.static, Abilities.plus],
    stats: Stats(h: 55, a: 40, b: 40, c: 65, d: 45, s: 35),
  ),
  flaaffy(
    string: "モココ",
    types: [Types.electric],
    abilities: [Abilities.static, Abilities.plus],
    stats: Stats(h: 70, a: 55, b: 55, c: 80, d: 60, s: 45),
  ),
  ampharos(
    string: "デンリュウ",
    types: [Types.electric],
    abilities: [Abilities.static, Abilities.plus],
    stats: Stats(h: 90, a: 75, b: 85, c: 115, d: 90, s: 55),
  ),
  petilil(
    string: "チュリネ",
    types: [Types.grass],
    abilities: [
      Abilities.chlorophyll,
      Abilities.own_tempo,
      Abilities.leaf_guard
    ],
    stats: Stats(h: 45, a: 35, b: 50, c: 70, d: 50, s: 30),
  ),
  lilligant(
    string: "ドレディア",
    types: [Types.grass],
    abilities: [
      Abilities.chlorophyll,
      Abilities.own_tempo,
      Abilities.leaf_guard
    ],
    stats: Stats(h: 70, a: 60, b: 75, c: 110, d: 75, s: 90),
  ),
  shroomish(
    string: "キノココ",
    types: [Types.grass],
    abilities: [
      Abilities.effect_spore,
      Abilities.poison_heal,
      Abilities.quick_feet
    ],
    stats: Stats(h: 60, a: 40, b: 60, c: 40, d: 60, s: 35),
  ),
  breloom(
    string: "キノガッサ",
    types: [Types.grass, Types.fighting],
    abilities: [
      Abilities.effect_spore,
      Abilities.poison_heal,
      Abilities.technician
    ],
    stats: Stats(h: 60, a: 130, b: 80, c: 60, d: 60, s: 70),
  ),
  applin(
    string: "カジッチュ",
    types: [Types.grass, Types.dragon],
    abilities: [Abilities.ripen, Abilities.gluttony, Abilities.bulletproof],
    stats: Stats(h: 40, a: 40, b: 80, c: 40, d: 40, s: 20),
  ),
  flapple(
    string: "アップリュー",
    types: [Types.grass, Types.dragon],
    abilities: [Abilities.ripen, Abilities.gluttony, Abilities.hustle],
    stats: Stats(h: 70, a: 110, b: 80, c: 95, d: 60, s: 70),
  ),
  appletun(
    string: "タルップル",
    types: [Types.grass, Types.dragon],
    abilities: [Abilities.ripen, Abilities.gluttony, Abilities.thick_fat],
    stats: Stats(h: 110, a: 85, b: 80, c: 100, d: 80, s: 30),
  ),
  spoink(
    string: "バネブー",
    types: [Types.psychic],
    abilities: [Abilities.thick_fat, Abilities.own_tempo, Abilities.gluttony],
    stats: Stats(h: 60, a: 25, b: 35, c: 70, d: 80, s: 60),
  ),
  grumpig(
    string: "ブーピッグ",
    types: [Types.psychic],
    abilities: [Abilities.thick_fat, Abilities.own_tempo, Abilities.gluttony],
    stats: Stats(h: 80, a: 45, b: 65, c: 90, d: 110, s: 80),
  ),
  squawkabilly(
    string: "イキリンコ",
    types: [Types.normal, Types.flying],
    abilities: [Abilities.intimidate, Abilities.hustle, Abilities.guts],
    stats: Stats(h: 82, a: 96, b: 51, c: 45, d: 51, s: 92),
  ),
  misdreavus(
    string: "ムウマ",
    types: [Types.ghost],
    abilities: [Abilities.levitate],
    stats: Stats(h: 60, a: 60, b: 60, c: 85, d: 85, s: 85),
  ),
  mismagius(
    string: "ムウマージ",
    types: [Types.ghost],
    abilities: [Abilities.levitate],
    stats: Stats(h: 60, a: 60, b: 60, c: 105, d: 105, s: 105),
  ),
  makuhita(
    string: "マクノシタ",
    types: [Types.fighting],
    abilities: [Abilities.thick_fat, Abilities.guts, Abilities.sheer_force],
    stats: Stats(h: 72, a: 60, b: 30, c: 20, d: 30, s: 25),
  ),
  hariyama(
    string: "ハリテヤマ",
    types: [Types.fighting],
    abilities: [Abilities.thick_fat, Abilities.guts, Abilities.sheer_force],
    stats: Stats(h: 144, a: 120, b: 60, c: 40, d: 60, s: 50),
  ),
  crabrawler(
    string: "マケンカニ",
    types: [Types.fighting],
    abilities: [
      Abilities.hyper_cutter,
      Abilities.iron_fist,
      Abilities.anger_point
    ],
    stats: Stats(h: 47, a: 82, b: 57, c: 42, d: 47, s: 63),
  ),
  crabominable(
    string: "ケケンカニ",
    types: [Types.fighting, Types.ice],
    abilities: [
      Abilities.hyper_cutter,
      Abilities.iron_fist,
      Abilities.anger_point
    ],
    stats: Stats(h: 97, a: 132, b: 77, c: 62, d: 67, s: 43),
  ),
  salandit(
    string: "ヤトウモリ",
    types: [Types.poison, Types.fire],
    abilities: [Abilities.corrosion, Abilities.oblivious],
    stats: Stats(h: 48, a: 44, b: 40, c: 71, d: 40, s: 77),
  ),
  salazzle(
    string: "エンニュート",
    types: [Types.poison, Types.fire],
    abilities: [Abilities.corrosion, Abilities.oblivious],
    stats: Stats(h: 68, a: 64, b: 60, c: 111, d: 60, s: 117),
  ),
  phanpy(
    string: "ゴマゾウ",
    types: [Types.ground],
    abilities: [Abilities.pickup, Abilities.sand_veil],
    stats: Stats(h: 90, a: 60, b: 60, c: 40, d: 40, s: 40),
  ),
  donphan(
    string: "ドンファン",
    types: [Types.ground],
    abilities: [Abilities.sturdy, Abilities.sand_veil],
    stats: Stats(h: 90, a: 120, b: 120, c: 60, d: 60, s: 50),
  ),
  cufant(
    string: "ゾウドウ",
    types: [Types.steel],
    abilities: [Abilities.sheer_force, Abilities.heavy_metal],
    stats: Stats(h: 72, a: 80, b: 49, c: 40, d: 49, s: 40),
  ),
  copperajah(
    string: "ダイオウドウ",
    types: [Types.steel],
    abilities: [Abilities.sheer_force, Abilities.heavy_metal],
    stats: Stats(h: 122, a: 130, b: 69, c: 80, d: 69, s: 30),
  ),
  gible(
    string: "フカマル",
    types: [Types.dragon, Types.ground],
    abilities: [Abilities.sand_veil, Abilities.rough_skin],
    stats: Stats(h: 58, a: 70, b: 45, c: 40, d: 45, s: 42),
  ),
  gabite(
    string: "ガバイト",
    types: [Types.dragon, Types.ground],
    abilities: [Abilities.sand_veil, Abilities.rough_skin],
    stats: Stats(h: 68, a: 90, b: 65, c: 50, d: 55, s: 82),
  ),
  garchomp(
    string: "ガブリアス",
    types: [Types.dragon, Types.ground],
    abilities: [Abilities.sand_veil, Abilities.rough_skin],
    stats: Stats(h: 108, a: 130, b: 95, c: 80, d: 85, s: 102),
  ),
  nacli(
    string: "コジオ",
    types: [Types.rock],
    abilities: [
      Abilities.purifying_salt,
      Abilities.sturdy,
      Abilities.clear_body
    ],
    stats: Stats(h: 55, a: 55, b: 75, c: 35, d: 35, s: 25),
  ),
  naclstack(
    string: "ジオヅム",
    types: [Types.rock],
    abilities: [
      Abilities.purifying_salt,
      Abilities.sturdy,
      Abilities.clear_body
    ],
    stats: Stats(h: 60, a: 60, b: 100, c: 35, d: 65, s: 35),
  ),
  garganacl(
    string: "キョジオーン",
    types: [Types.rock],
    abilities: [
      Abilities.purifying_salt,
      Abilities.sturdy,
      Abilities.clear_body
    ],
    stats: Stats(h: 100, a: 100, b: 130, c: 45, d: 90, s: 35),
  ),
  wingull(
    string: "キャモメ",
    types: [Types.water, Types.flying],
    abilities: [Abilities.keen_eye, Abilities.hydration, Abilities.rain_dish],
    stats: Stats(h: 40, a: 30, b: 30, c: 55, d: 30, s: 85),
  ),
  pelipper(
    string: "ペリッパー",
    types: [Types.water, Types.flying],
    abilities: [Abilities.keen_eye, Abilities.drizzle, Abilities.rain_dish],
    stats: Stats(h: 60, a: 50, b: 100, c: 95, d: 70, s: 65),
  ),
  magikarp(
    string: "コイキング",
    types: [Types.water],
    abilities: [Abilities.swift_swim, Abilities.rattled],
    stats: Stats(h: 20, a: 10, b: 55, c: 15, d: 20, s: 80),
  ),
  gyarados(
    string: "ギャラドス",
    types: [Types.water, Types.flying],
    abilities: [Abilities.intimidate, Abilities.moxie],
    stats: Stats(h: 95, a: 125, b: 79, c: 60, d: 100, s: 81),
  ),
  arrokuda(
    string: "サシカマス",
    types: [Types.water],
    abilities: [Abilities.swift_swim, Abilities.propeller_tail],
    stats: Stats(h: 41, a: 63, b: 40, c: 40, d: 30, s: 66),
  ),
  barraskewda(
    string: "カマスジョー",
    types: [Types.water],
    abilities: [Abilities.swift_swim, Abilities.propeller_tail],
    stats: Stats(h: 61, a: 123, b: 60, c: 60, d: 50, s: 136),
  ),
  basculin_white_striped(
    string: "バスラオ(しろすじのすがた)",
    types: [Types.water],
    abilities: [
      Abilities.rattled,
      Abilities.adaptability,
      Abilities.mold_breaker
    ],
    stats: Stats(h: 70, a: 92, b: 65, c: 80, d: 55, s: 98),
  ),
  basculin_red_striped(
    string: "バスラオ(あかすじのすがた)",
    types: [Types.water],
    abilities: [
      Abilities.reckless,
      Abilities.adaptability,
      Abilities.mold_breaker
    ],
    stats: Stats(h: 70, a: 92, b: 65, c: 80, d: 55, s: 98),
  ),
  basculin_blue_striped(
    string: "バスラオ(あおすじのすがた)",
    types: [Types.water],
    abilities: [
      Abilities.rock_head,
      Abilities.adaptability,
      Abilities.mold_breaker
    ],
    stats: Stats(h: 70, a: 92, b: 65, c: 80, d: 55, s: 98),
  ),
  gulpin(
    string: "ゴクリン",
    types: [Types.poison],
    abilities: [
      Abilities.liquid_ooze,
      Abilities.sticky_hold,
      Abilities.gluttony
    ],
    stats: Stats(h: 70, a: 43, b: 53, c: 43, d: 53, s: 40),
  ),
  swalot(
    string: "マルノーム",
    types: [Types.poison],
    abilities: [
      Abilities.liquid_ooze,
      Abilities.sticky_hold,
      Abilities.gluttony
    ],
    stats: Stats(h: 100, a: 73, b: 83, c: 73, d: 83, s: 55),
  ),
  meowth(
    string: "ニャース",
    types: [Types.normal],
    abilities: [Abilities.pickup, Abilities.technician, Abilities.unnerve],
    stats: Stats(h: 40, a: 45, b: 35, c: 40, d: 40, s: 90),
  ),
  meowth_galarian(
    string: "ニャース(ガラルのすがた)",
    types: [Types.steel],
    abilities: [Abilities.pickup, Abilities.tough_claws, Abilities.unnerve],
    stats: Stats(h: 50, a: 65, b: 55, c: 40, d: 40, s: 40),
  ),
  persian(
    string: "ペルシアン",
    types: [Types.normal],
    abilities: [Abilities.limber, Abilities.technician, Abilities.unnerve],
    stats: Stats(h: 65, a: 70, b: 60, c: 65, d: 65, s: 115),
  ),
  perrserker(
    string: "ニャイキング",
    types: [Types.steel],
    abilities: [
      Abilities.battle_armor,
      Abilities.tough_claws,
      Abilities.steely_spirit
    ],
    stats: Stats(h: 70, a: 110, b: 110, c: 50, d: 60, s: 50),
  ),
  drifloon(
    string: "フワンテ",
    types: [Types.ghost, Types.flying],
    abilities: [Abilities.aftermath, Abilities.unburden, Abilities.flare_boost],
    stats: Stats(h: 90, a: 50, b: 34, c: 60, d: 44, s: 70),
  ),
  drifblim(
    string: "フワライド",
    types: [Types.ghost, Types.flying],
    abilities: [Abilities.aftermath, Abilities.unburden, Abilities.flare_boost],
    stats: Stats(h: 150, a: 80, b: 44, c: 90, d: 54, s: 80),
  ),
  flabebe(
    string: "フラベベ",
    types: [Types.fairy],
    abilities: [Abilities.flower_veil, Abilities.symbiosis],
    stats: Stats(h: 44, a: 38, b: 39, c: 61, d: 79, s: 42),
  ),
  floette(
    string: "フラエッテ",
    types: [Types.fairy],
    abilities: [Abilities.flower_veil, Abilities.symbiosis],
    stats: Stats(h: 54, a: 45, b: 47, c: 75, d: 98, s: 52),
  ),
  florges(
    string: "フラージェス",
    types: [Types.fairy],
    abilities: [Abilities.flower_veil, Abilities.symbiosis],
    stats: Stats(h: 78, a: 65, b: 68, c: 112, d: 154, s: 75),
  ),
  diglett(
    string: "ディグダ",
    types: [Types.ground],
    abilities: [
      Abilities.sand_veil,
      Abilities.arena_trap,
      Abilities.sand_force
    ],
    stats: Stats(h: 10, a: 55, b: 25, c: 35, d: 45, s: 95),
  ),
  dugtrio(
    string: "ダグトリオ",
    types: [Types.ground],
    abilities: [
      Abilities.sand_veil,
      Abilities.arena_trap,
      Abilities.sand_force
    ],
    stats: Stats(h: 35, a: 100, b: 50, c: 50, d: 70, s: 120),
  ),
  torkoal(
    string: "コータス",
    types: [Types.fire],
    abilities: [
      Abilities.white_smoke,
      Abilities.drought,
      Abilities.shell_armor
    ],
    stats: Stats(h: 70, a: 85, b: 140, c: 85, d: 70, s: 20),
  ),
  numel(
    string: "ドンメル",
    types: [Types.fire, Types.ground],
    abilities: [Abilities.oblivious, Abilities.simple, Abilities.own_tempo],
    stats: Stats(h: 60, a: 60, b: 40, c: 65, d: 45, s: 35),
  ),
  camerupt(
    string: "バクーダ",
    types: [Types.fire, Types.ground],
    abilities: [
      Abilities.magma_armor,
      Abilities.solid_rock,
      Abilities.anger_point
    ],
    stats: Stats(h: 70, a: 100, b: 70, c: 105, d: 75, s: 40),
  ),
  bronzor(
    string: "ドーミラー",
    types: [Types.steel, Types.psychic],
    abilities: [Abilities.levitate, Abilities.heatproof, Abilities.heavy_metal],
    stats: Stats(h: 57, a: 24, b: 86, c: 24, d: 86, s: 23),
  ),
  bronzong(
    string: "ドータクン",
    types: [Types.steel, Types.psychic],
    abilities: [Abilities.levitate, Abilities.heatproof, Abilities.heavy_metal],
    stats: Stats(h: 67, a: 89, b: 116, c: 79, d: 116, s: 33),
  ),
  axew(
    string: "キバゴ",
    types: [Types.dragon],
    abilities: [Abilities.rivalry, Abilities.mold_breaker, Abilities.unnerve],
    stats: Stats(h: 46, a: 87, b: 60, c: 30, d: 40, s: 57),
  ),
  fraxure(
    string: "オノンド",
    types: [Types.dragon],
    abilities: [Abilities.rivalry, Abilities.mold_breaker, Abilities.unnerve],
    stats: Stats(h: 66, a: 117, b: 70, c: 40, d: 50, s: 67),
  ),
  haxorus(
    string: "オノノクス",
    types: [Types.dragon],
    abilities: [Abilities.rivalry, Abilities.mold_breaker, Abilities.unnerve],
    stats: Stats(h: 76, a: 147, b: 90, c: 60, d: 70, s: 97),
  ),
  mankey(
    string: "マンキー",
    types: [Types.fighting],
    abilities: [
      Abilities.vital_spirit,
      Abilities.anger_point,
      Abilities.defiant
    ],
    stats: Stats(h: 40, a: 80, b: 35, c: 35, d: 45, s: 70),
  ),
  primeape(
    string: "オコリザル",
    types: [Types.fighting],
    abilities: [
      Abilities.vital_spirit,
      Abilities.anger_point,
      Abilities.defiant
    ],
    stats: Stats(h: 65, a: 105, b: 60, c: 60, d: 70, s: 95),
  ),
  annihilape(
    string: "コノヨザル",
    types: [Types.fighting, Types.ghost],
    abilities: [
      Abilities.vital_spirit,
      Abilities.inner_focus,
      Abilities.defiant
    ],
    stats: Stats(h: 110, a: 115, b: 80, c: 50, d: 90, s: 90),
  ),
  meditite(
    string: "アサナン",
    types: [Types.fighting, Types.psychic],
    abilities: [Abilities.pure_power, Abilities.telepathy],
    stats: Stats(h: 30, a: 40, b: 55, c: 40, d: 55, s: 60),
  ),
  medicham(
    string: "チャーレム",
    types: [Types.fighting, Types.psychic],
    abilities: [Abilities.pure_power, Abilities.telepathy],
    stats: Stats(h: 60, a: 60, b: 75, c: 60, d: 75, s: 80),
  ),
  riolu(
    string: "リオル",
    types: [Types.fighting],
    abilities: [
      Abilities.steadfast,
      Abilities.inner_focus,
      Abilities.prankster
    ],
    stats: Stats(h: 40, a: 70, b: 40, c: 35, d: 40, s: 60),
  ),
  lucario(
    string: "ルカリオ",
    types: [Types.fighting, Types.steel],
    abilities: [
      Abilities.steadfast,
      Abilities.inner_focus,
      Abilities.justified
    ],
    stats: Stats(h: 70, a: 110, b: 70, c: 115, d: 70, s: 90),
  ),
  charcadet(
    string: "カルボウ",
    types: [Types.fire],
    abilities: [Abilities.flash_fire, Abilities.flame_body],
    stats: Stats(h: 40, a: 50, b: 40, c: 50, d: 40, s: 35),
  ),
  armarouge(
    string: "グレンアルマ",
    types: [Types.fire, Types.psychic],
    abilities: [Abilities.flash_fire, Abilities.weak_armor],
    stats: Stats(h: 85, a: 60, b: 100, c: 125, d: 80, s: 75),
  ),
  ceruledge(
    string: "ソウブレイズ",
    types: [Types.fire, Types.ghost],
    abilities: [Abilities.flash_fire, Abilities.weak_armor],
    stats: Stats(h: 75, a: 125, b: 80, c: 60, d: 100, s: 85),
  ),
  barboach(
    string: "ドジョッチ",
    types: [Types.water, Types.ground],
    abilities: [
      Abilities.oblivious,
      Abilities.anticipation,
      Abilities.hydration
    ],
    stats: Stats(h: 50, a: 48, b: 43, c: 46, d: 41, s: 60),
  ),
  whiscash(
    string: "ナマズン",
    types: [Types.water, Types.ground],
    abilities: [
      Abilities.oblivious,
      Abilities.anticipation,
      Abilities.hydration
    ],
    stats: Stats(h: 110, a: 78, b: 73, c: 76, d: 71, s: 60),
  ),
  tadbulb(
    string: "ズピカ",
    types: [Types.electric],
    abilities: [Abilities.own_tempo, Abilities.static, Abilities.damp],
    stats: Stats(h: 61, a: 31, b: 41, c: 59, d: 35, s: 45),
  ),
  bellibolt(
    string: "ハラバリー",
    types: [Types.electric],
    abilities: [Abilities.electromorphosis, Abilities.static, Abilities.damp],
    stats: Stats(h: 109, a: 64, b: 91, c: 103, d: 83, s: 45),
  ),
  goomy(
    string: "ヌメラ",
    types: [Types.dragon],
    abilities: [Abilities.sap_sipper, Abilities.hydration, Abilities.gooey],
    stats: Stats(h: 45, a: 50, b: 35, c: 55, d: 75, s: 40),
  ),
  sliggoo(
    string: "ヌメイル",
    types: [Types.dragon],
    abilities: [Abilities.sap_sipper, Abilities.hydration, Abilities.gooey],
    stats: Stats(h: 68, a: 75, b: 53, c: 83, d: 113, s: 60),
  ),
  goodra(
    string: "ヌメルゴン",
    types: [Types.dragon],
    abilities: [Abilities.sap_sipper, Abilities.hydration, Abilities.gooey],
    stats: Stats(h: 90, a: 100, b: 70, c: 110, d: 150, s: 80),
  ),
  croagunk(
    string: "グレッグル",
    types: [Types.poison, Types.fighting],
    abilities: [
      Abilities.anticipation,
      Abilities.dry_skin,
      Abilities.poison_touch
    ],
    stats: Stats(h: 48, a: 61, b: 40, c: 61, d: 40, s: 50),
  ),
  toxicroak(
    string: "ドクロッグ",
    types: [Types.poison, Types.fighting],
    abilities: [
      Abilities.anticipation,
      Abilities.dry_skin,
      Abilities.poison_touch
    ],
    stats: Stats(h: 83, a: 106, b: 65, c: 86, d: 65, s: 85),
  ),
  wattrel(
    string: "カイデン",
    types: [Types.electric, Types.flying],
    abilities: [
      Abilities.wind_power,
      Abilities.volt_absorb,
      Abilities.competitive
    ],
    stats: Stats(h: 40, a: 40, b: 35, c: 55, d: 40, s: 70),
  ),
  kilowattrel(
    string: "タイカイデン",
    types: [Types.electric, Types.flying],
    abilities: [
      Abilities.wind_power,
      Abilities.volt_absorb,
      Abilities.competitive
    ],
    stats: Stats(h: 70, a: 70, b: 60, c: 105, d: 60, s: 125),
  ),
  eevee(
    string: "イーブイ",
    types: [Types.normal],
    abilities: [
      Abilities.run_away,
      Abilities.adaptability,
      Abilities.anticipation
    ],
    stats: Stats(h: 55, a: 55, b: 50, c: 45, d: 65, s: 55),
  ),
  vaporeon(
    string: "シャワーズ",
    types: [Types.water],
    abilities: [Abilities.water_absorb, Abilities.hydration],
    stats: Stats(h: 130, a: 65, b: 60, c: 110, d: 95, s: 65),
  ),
  jolteon(
    string: "サンダース",
    types: [Types.electric],
    abilities: [Abilities.volt_absorb, Abilities.quick_feet],
    stats: Stats(h: 65, a: 65, b: 60, c: 110, d: 95, s: 130),
  ),
  flareon(
    string: "ブースター",
    types: [Types.fire],
    abilities: [Abilities.flash_fire, Abilities.guts],
    stats: Stats(h: 65, a: 130, b: 60, c: 95, d: 110, s: 65),
  ),
  espeon(
    string: "エーフィ",
    types: [Types.psychic],
    abilities: [Abilities.synchronize, Abilities.magic_bounce],
    stats: Stats(h: 65, a: 65, b: 60, c: 130, d: 95, s: 110),
  ),
  umbreon(
    string: "ブラッキー",
    types: [Types.dark],
    abilities: [Abilities.synchronize, Abilities.inner_focus],
    stats: Stats(h: 95, a: 65, b: 110, c: 60, d: 130, s: 65),
  ),
  leafeon(
    string: "リーフィア",
    types: [Types.grass],
    abilities: [Abilities.leaf_guard, Abilities.chlorophyll],
    stats: Stats(h: 65, a: 110, b: 130, c: 60, d: 65, s: 95),
  ),
  glaceon(
    string: "グレイシア",
    types: [Types.ice],
    abilities: [Abilities.snow_cloak, Abilities.ice_body],
    stats: Stats(h: 65, a: 60, b: 110, c: 130, d: 95, s: 65),
  ),
  sylveon(
    string: "ニンフィア",
    types: [Types.fairy],
    abilities: [Abilities.cute_charm, Abilities.pixilate],
    stats: Stats(h: 95, a: 65, b: 65, c: 110, d: 130, s: 60),
  ),
  dunsparce(
    string: "ノコッチ",
    types: [Types.normal],
    abilities: [Abilities.serene_grace, Abilities.run_away, Abilities.rattled],
    stats: Stats(h: 100, a: 70, b: 70, c: 65, d: 65, s: 45),
  ),
  dudunsparce(
    string: "ノココッチ",
    types: [Types.normal],
    abilities: [Abilities.serene_grace, Abilities.run_away, Abilities.rattled],
    stats: Stats(h: 125, a: 100, b: 80, c: 85, d: 75, s: 55),
  ),
  deerling_spring(
    string: "シキジカ(はるのすがた)",
    types: [Types.normal, Types.grass],
    abilities: [
      Abilities.chlorophyll,
      Abilities.sap_sipper,
      Abilities.serene_grace
    ],
    stats: Stats(h: 60, a: 60, b: 50, c: 40, d: 50, s: 75),
  ),
  deerling_summer(
    string: "シキジカ(なつのすがた)",
    types: [Types.normal, Types.grass],
    abilities: [
      Abilities.chlorophyll,
      Abilities.sap_sipper,
      Abilities.serene_grace
    ],
    stats: Stats(h: 60, a: 60, b: 50, c: 40, d: 50, s: 75),
  ),
  deerling_autumn(
    string: "シキジカ(あきのすがた)",
    types: [Types.normal, Types.grass],
    abilities: [
      Abilities.chlorophyll,
      Abilities.sap_sipper,
      Abilities.serene_grace
    ],
    stats: Stats(h: 60, a: 60, b: 50, c: 40, d: 50, s: 75),
  ),
  deerling_winter(
    string: "シキジカ(ふゆのすがた)",
    types: [Types.normal, Types.grass],
    abilities: [
      Abilities.chlorophyll,
      Abilities.sap_sipper,
      Abilities.serene_grace
    ],
    stats: Stats(h: 60, a: 60, b: 50, c: 40, d: 50, s: 75),
  ),
  sawsbuck_spring(
    string: "メブキジカ(はるのすがた)",
    types: [Types.normal, Types.grass],
    abilities: [
      Abilities.chlorophyll,
      Abilities.sap_sipper,
      Abilities.serene_grace
    ],
    stats: Stats(h: 80, a: 100, b: 70, c: 60, d: 70, s: 95),
  ),
  sawsbuck_summer(
    string: "メブキジカ(なつのすがた)",
    types: [Types.normal, Types.grass],
    abilities: [
      Abilities.chlorophyll,
      Abilities.sap_sipper,
      Abilities.serene_grace
    ],
    stats: Stats(h: 80, a: 100, b: 70, c: 60, d: 70, s: 95),
  ),
  sawsbuck_autumn(
    string: "メブキジカ(あきのすがた)",
    types: [Types.normal, Types.grass],
    abilities: [
      Abilities.chlorophyll,
      Abilities.sap_sipper,
      Abilities.serene_grace
    ],
    stats: Stats(h: 80, a: 100, b: 70, c: 60, d: 70, s: 95),
  ),
  sawsbuck_winter(
    string: "メブキジカ(ふゆのすがた)",
    types: [Types.normal, Types.grass],
    abilities: [
      Abilities.chlorophyll,
      Abilities.sap_sipper,
      Abilities.serene_grace
    ],
    stats: Stats(h: 80, a: 100, b: 70, c: 60, d: 70, s: 95),
  ),
  girafarig(
    string: "キリンリキ",
    types: [Types.normal, Types.psychic],
    abilities: [
      Abilities.inner_focus,
      Abilities.early_bird,
      Abilities.sap_sipper
    ],
    stats: Stats(h: 70, a: 80, b: 65, c: 90, d: 65, s: 85),
  ),
  farigiraf(
    string: "リキキリン",
    types: [Types.normal, Types.psychic],
    abilities: [Abilities.cud_chew, Abilities.armor_tail, Abilities.sap_sipper],
    stats: Stats(h: 120, a: 90, b: 70, c: 110, d: 70, s: 60),
  ),
  grimer(
    string: "ベトベター",
    types: [Types.poison],
    abilities: [
      Abilities.stench,
      Abilities.sticky_hold,
      Abilities.poison_touch
    ],
    stats: Stats(h: 80, a: 80, b: 50, c: 40, d: 50, s: 25),
  ),
  muk(
    string: "ベトベトン",
    types: [Types.poison],
    abilities: [
      Abilities.stench,
      Abilities.sticky_hold,
      Abilities.poison_touch
    ],
    stats: Stats(h: 105, a: 105, b: 75, c: 65, d: 100, s: 50),
  ),
  maschiff(
    string: "オラチフ",
    types: [Types.dark],
    abilities: [Abilities.intimidate, Abilities.run_away, Abilities.stakeout],
    stats: Stats(h: 60, a: 78, b: 60, c: 40, d: 51, s: 51),
  ),
  mabosstiff(
    string: "マフィティフ",
    types: [Types.dark],
    abilities: [Abilities.intimidate, Abilities.guard_dog, Abilities.stakeout],
    stats: Stats(h: 80, a: 120, b: 90, c: 60, d: 70, s: 85),
  ),
  toxel(
    string: "エレズン",
    types: [Types.electric, Types.poison],
    abilities: [Abilities.rattled, Abilities.static, Abilities.klutz],
    stats: Stats(h: 40, a: 38, b: 35, c: 54, d: 35, s: 40),
  ),
  toxtricity_amped(
    string: "ストリンダー(ハイのすがた)",
    types: [Types.electric, Types.poison],
    abilities: [Abilities.punk_rock, Abilities.plus, Abilities.technician],
    stats: Stats(h: 75, a: 98, b: 70, c: 114, d: 70, s: 75),
  ),
  toxtricity_low_key(
    string: "ストリンダー(ローのすがた)",
    types: [Types.electric, Types.poison],
    abilities: [Abilities.punk_rock, Abilities.minus, Abilities.technician],
    stats: Stats(h: 75, a: 98, b: 70, c: 114, d: 70, s: 75),
  ),
  dedenne(
    string: "デデンネ",
    types: [Types.electric, Types.fairy],
    abilities: [Abilities.cheek_pouch, Abilities.pickup, Abilities.plus],
    stats: Stats(h: 67, a: 58, b: 57, c: 81, d: 67, s: 101),
  ),
  pachirisu(
    string: "パチリス",
    types: [Types.electric],
    abilities: [Abilities.run_away, Abilities.pickup, Abilities.volt_absorb],
    stats: Stats(h: 60, a: 45, b: 70, c: 45, d: 90, s: 95),
  ),
  shroodle(
    string: "シルシュルー",
    types: [Types.poison, Types.normal],
    abilities: [Abilities.unburden, Abilities.pickpocket, Abilities.prankster],
    stats: Stats(h: 40, a: 65, b: 35, c: 40, d: 35, s: 75),
  ),
  grafaiai(
    string: "タギングル",
    types: [Types.poison, Types.normal],
    abilities: [
      Abilities.unburden,
      Abilities.poison_touch,
      Abilities.prankster
    ],
    stats: Stats(h: 63, a: 95, b: 65, c: 80, d: 72, s: 110),
  ),
  stantler(
    string: "オドシシ",
    types: [Types.normal],
    abilities: [Abilities.intimidate, Abilities.frisk, Abilities.sap_sipper],
    stats: Stats(h: 73, a: 95, b: 62, c: 85, d: 65, s: 85),
  ),
  foongus(
    string: "タマゲタケ",
    types: [Types.grass, Types.poison],
    abilities: [Abilities.effect_spore, Abilities.regenerator],
    stats: Stats(h: 69, a: 55, b: 45, c: 55, d: 55, s: 15),
  ),
  amoonguss(
    string: "モロバレル",
    types: [Types.grass, Types.poison],
    abilities: [Abilities.effect_spore, Abilities.regenerator],
    stats: Stats(h: 114, a: 85, b: 70, c: 85, d: 80, s: 30),
  ),
  voltorb(
    string: "ビリリダマ",
    types: [Types.electric],
    abilities: [Abilities.soundproof, Abilities.static, Abilities.aftermath],
    stats: Stats(h: 40, a: 30, b: 50, c: 55, d: 55, s: 100),
  ),
  electrode(
    string: "マルマイン",
    types: [Types.electric],
    abilities: [Abilities.soundproof, Abilities.static, Abilities.aftermath],
    stats: Stats(h: 60, a: 50, b: 70, c: 80, d: 80, s: 150),
  ),
  magnemite(
    string: "コイル",
    types: [Types.electric, Types.steel],
    abilities: [Abilities.magnet_pull, Abilities.sturdy, Abilities.analytic],
    stats: Stats(h: 25, a: 35, b: 70, c: 95, d: 55, s: 45),
  ),
  magneton(
    string: "レアコイル",
    types: [Types.electric, Types.steel],
    abilities: [Abilities.magnet_pull, Abilities.sturdy, Abilities.analytic],
    stats: Stats(h: 50, a: 60, b: 95, c: 120, d: 70, s: 70),
  ),
  magnezone(
    string: "ジバコイル",
    types: [Types.electric, Types.steel],
    abilities: [Abilities.magnet_pull, Abilities.sturdy, Abilities.analytic],
    stats: Stats(h: 70, a: 70, b: 115, c: 130, d: 90, s: 60),
  ),
  ditto(
    string: "メタモン",
    types: [Types.normal],
    abilities: [Abilities.limber, Abilities.imposter],
    stats: Stats(h: 48, a: 48, b: 48, c: 48, d: 48, s: 48),
  ),
  growlithe(
    string: "ガーディ",
    types: [Types.fire],
    abilities: [
      Abilities.intimidate,
      Abilities.flash_fire,
      Abilities.justified
    ],
    stats: Stats(h: 55, a: 70, b: 45, c: 70, d: 50, s: 60),
  ),
  arcanine(
    string: "ウインディ",
    types: [Types.fire],
    abilities: [
      Abilities.intimidate,
      Abilities.flash_fire,
      Abilities.justified
    ],
    stats: Stats(h: 90, a: 110, b: 80, c: 100, d: 80, s: 95),
  ),
  teddiursa(
    string: "ヒメグマ",
    types: [Types.normal],
    abilities: [Abilities.pickup, Abilities.quick_feet, Abilities.honey_gather],
    stats: Stats(h: 60, a: 80, b: 50, c: 50, d: 50, s: 40),
  ),
  ursaring(
    string: "リングマ",
    types: [Types.normal],
    abilities: [Abilities.guts, Abilities.quick_feet, Abilities.unnerve],
    stats: Stats(h: 90, a: 130, b: 75, c: 75, d: 75, s: 55),
  ),
  zangoose(
    string: "ザングース",
    types: [Types.normal],
    abilities: [Abilities.immunity, Abilities.toxic_boost],
    stats: Stats(h: 73, a: 115, b: 60, c: 60, d: 60, s: 90),
  ),
  seviper(
    string: "ハブネーク",
    types: [Types.poison],
    abilities: [Abilities.shed_skin, Abilities.infiltrator],
    stats: Stats(h: 73, a: 100, b: 60, c: 100, d: 60, s: 65),
  ),
  swablu(
    string: "チルット",
    types: [Types.normal, Types.flying],
    abilities: [Abilities.natural_cure, Abilities.cloud_nine],
    stats: Stats(h: 45, a: 40, b: 60, c: 40, d: 75, s: 50),
  ),
  altaria(
    string: "チルタリス",
    types: [Types.dragon, Types.flying],
    abilities: [Abilities.natural_cure, Abilities.cloud_nine],
    stats: Stats(h: 75, a: 70, b: 90, c: 70, d: 105, s: 80),
  ),
  skiddo(
    string: "メェークル",
    types: [Types.grass],
    abilities: [Abilities.sap_sipper, Abilities.grass_pelt],
    stats: Stats(h: 66, a: 65, b: 48, c: 62, d: 57, s: 52),
  ),
  gogoat(
    string: "ゴーゴート",
    types: [Types.grass],
    abilities: [Abilities.sap_sipper, Abilities.grass_pelt],
    stats: Stats(h: 123, a: 100, b: 62, c: 97, d: 81, s: 68),
  ),
  tauros_paldean(
    string: "ケンタロス(コンバット種)",
    types: [Types.normal],
    abilities: [
      Abilities.intimidate,
      Abilities.anger_point,
      Abilities.cud_chew
    ],
    stats: Stats(h: 75, a: 100, b: 95, c: 40, d: 70, s: 110),
  ),
  tauros_paldean_blaze(
    string: "ケンタロス(ブレイズ種)",
    types: [Types.normal, Types.fire],
    abilities: [
      Abilities.intimidate,
      Abilities.anger_point,
      Abilities.cud_chew
    ],
    stats: Stats(h: 75, a: 100, b: 95, c: 40, d: 70, s: 110),
  ),
  tauros_paldean_aqua(
    string: "ケンタロス(ウォーター種)",
    types: [Types.normal, Types.fire],
    abilities: [
      Abilities.intimidate,
      Abilities.anger_point,
      Abilities.cud_chew
    ],
    stats: Stats(h: 75, a: 100, b: 95, c: 40, d: 70, s: 110),
  ),
  litleo(
    string: "シシコ",
    types: [Types.fire, Types.normal],
    abilities: [Abilities.rivalry, Abilities.unnerve, Abilities.moxie],
    stats: Stats(h: 62, a: 50, b: 58, c: 73, d: 54, s: 72),
  ),
  pyroar_male(
    string: "カエンジシ(オスのすがた)",
    types: [Types.fire, Types.normal],
    abilities: [Abilities.rivalry, Abilities.unnerve, Abilities.moxie],
    stats: Stats(h: 86, a: 68, b: 72, c: 109, d: 66, s: 106),
  ),
  pyroar_female(
    string: "カエンジシ(メスのすがた)",
    types: [Types.fire, Types.normal],
    abilities: [Abilities.rivalry, Abilities.unnerve, Abilities.moxie],
    stats: Stats(h: 86, a: 68, b: 72, c: 109, d: 66, s: 106),
  ),
  stunky(
    string: "スカンプー",
    types: [Types.poison, Types.dark],
    abilities: [Abilities.stench, Abilities.aftermath, Abilities.keen_eye],
    stats: Stats(h: 63, a: 63, b: 47, c: 41, d: 41, s: 74),
  ),
  skuntank(
    string: "スカタンク",
    types: [Types.poison, Types.dark],
    abilities: [Abilities.stench, Abilities.aftermath, Abilities.keen_eye],
    stats: Stats(h: 103, a: 93, b: 67, c: 71, d: 61, s: 84),
  ),
  zorua(
    string: "ゾロア",
    types: [Types.dark],
    abilities: [Abilities.illusion],
    stats: Stats(h: 40, a: 65, b: 40, c: 80, d: 40, s: 65),
  ),
  zoroark(
    string: "ゾロアーク",
    types: [Types.dark],
    abilities: [Abilities.illusion],
    stats: Stats(h: 60, a: 105, b: 60, c: 120, d: 60, s: 105),
  ),
  zoroark_hisuian(
    string: "ゾロアーク(ヒスイのすがた)",
    types: [Types.normal, Types.ghost],
    abilities: [Abilities.illusion],
    stats: Stats(h: 60, a: 105, b: 60, c: 120, d: 60, s: 105),
  ),
  sneasel(
    string: "ニューラ",
    types: [Types.dark, Types.ice],
    abilities: [
      Abilities.inner_focus,
      Abilities.keen_eye,
      Abilities.pickpocket
    ],
    stats: Stats(h: 55, a: 95, b: 55, c: 35, d: 75, s: 115),
  ),
  weavile(
    string: "マニューラ",
    types: [Types.dark, Types.ice],
    abilities: [Abilities.pressure, Abilities.pickpocket],
    stats: Stats(h: 70, a: 120, b: 65, c: 45, d: 85, s: 125),
  ),
  murkrow(
    string: "ヤミカラス",
    types: [Types.dark, Types.flying],
    abilities: [Abilities.insomnia, Abilities.super_luck, Abilities.prankster],
    stats: Stats(h: 60, a: 85, b: 42, c: 85, d: 42, s: 91),
  ),
  honchkrow(
    string: "ドンカラス",
    types: [Types.dark, Types.flying],
    abilities: [Abilities.insomnia, Abilities.super_luck, Abilities.moxie],
    stats: Stats(h: 100, a: 125, b: 52, c: 105, d: 52, s: 71),
  ),
  gothita(
    string: "ゴチム",
    types: [Types.psychic],
    abilities: [Abilities.frisk, Abilities.competitive, Abilities.shadow_tag],
    stats: Stats(h: 45, a: 30, b: 50, c: 55, d: 65, s: 45),
  ),
  gothorita(
    string: "ゴチミル",
    types: [Types.psychic],
    abilities: [Abilities.frisk, Abilities.competitive, Abilities.shadow_tag],
    stats: Stats(h: 60, a: 45, b: 70, c: 75, d: 85, s: 55),
  ),
  gothitelle(
    string: "ゴチルゼル",
    types: [Types.psychic],
    abilities: [Abilities.frisk, Abilities.competitive, Abilities.shadow_tag],
    stats: Stats(h: 70, a: 55, b: 95, c: 95, d: 110, s: 65),
  ),
  sinistea(
    string: "ヤバチャ",
    types: [Types.ghost],
    abilities: [Abilities.weak_armor, Abilities.cursed_body],
    stats: Stats(h: 40, a: 45, b: 45, c: 74, d: 54, s: 50),
  ),
  polteageist(
    string: "ポットデス",
    types: [Types.ghost],
    abilities: [Abilities.weak_armor, Abilities.cursed_body],
    stats: Stats(h: 60, a: 65, b: 65, c: 134, d: 114, s: 70),
  ),
  mimikyu(
    string: "ミミッキュ",
    types: [Types.ghost, Types.fairy],
    abilities: [Abilities.disguise],
    stats: Stats(h: 55, a: 90, b: 80, c: 50, d: 105, s: 96),
  ),
  klefki(
    string: "クレッフィ",
    types: [Types.steel, Types.fairy],
    abilities: [Abilities.prankster, Abilities.magician],
    stats: Stats(h: 57, a: 80, b: 91, c: 80, d: 87, s: 75),
  ),
  indeedee_male(
    string: "イエッサン(オスのすがた)",
    types: [Types.psychic, Types.normal],
    abilities: [
      Abilities.inner_focus,
      Abilities.synchronize,
      Abilities.psychic_surge
    ],
    stats: Stats(h: 60, a: 65, b: 55, c: 105, d: 95, s: 95),
  ),
  indeedee_female(
    string: "イエッサン(メスのすがた)",
    types: [Types.psychic, Types.normal],
    abilities: [
      Abilities.own_tempo,
      Abilities.synchronize,
      Abilities.psychic_surge
    ],
    stats: Stats(h: 70, a: 55, b: 65, c: 95, d: 105, s: 85),
  ),
  bramblin(
    string: "アノクサ",
    types: [Types.grass, Types.ghost],
    abilities: [Abilities.wind_rider, Abilities.infiltrator],
    stats: Stats(h: 40, a: 65, b: 30, c: 45, d: 35, s: 60),
  ),
  brambleghast(
    string: "アノホラグサ",
    types: [Types.grass, Types.ghost],
    abilities: [Abilities.wind_rider, Abilities.infiltrator],
    stats: Stats(h: 55, a: 115, b: 70, c: 80, d: 70, s: 90),
  ),
  toedscool(
    string: "ノノクラゲ",
    types: [Types.ground, Types.grass],
    abilities: [Abilities.mycelium_might],
    stats: Stats(h: 40, a: 40, b: 35, c: 50, d: 100, s: 70),
  ),
  toedscruel(
    string: "リククラゲ",
    types: [Types.ground, Types.grass],
    abilities: [Abilities.mycelium_might],
    stats: Stats(h: 80, a: 70, b: 65, c: 80, d: 120, s: 100),
  ),
  tropius(
    string: "トロピウス",
    types: [Types.grass, Types.flying],
    abilities: [
      Abilities.chlorophyll,
      Abilities.solar_power,
      Abilities.harvest
    ],
    stats: Stats(h: 99, a: 68, b: 83, c: 72, d: 87, s: 51),
  ),
  fomantis(
    string: "カリキリ",
    types: [Types.grass],
    abilities: [Abilities.leaf_guard, Abilities.contrary],
    stats: Stats(h: 40, a: 55, b: 35, c: 50, d: 35, s: 35),
  ),
  lurantis(
    string: "ラランテス",
    types: [Types.grass],
    abilities: [Abilities.leaf_guard, Abilities.contrary],
    stats: Stats(h: 70, a: 105, b: 90, c: 80, d: 90, s: 45),
  ),
  klawf(
    string: "ガケガニ",
    types: [Types.rock],
    abilities: [
      Abilities.anger_shell,
      Abilities.shell_armor,
      Abilities.regenerator
    ],
    stats: Stats(h: 70, a: 100, b: 115, c: 35, d: 55, s: 75),
  ),
  capsakid(
    string: "カプサイジ",
    types: [Types.grass],
    abilities: [Abilities.chlorophyll, Abilities.insomnia, Abilities.klutz],
    stats: Stats(h: 50, a: 62, b: 40, c: 62, d: 40, s: 50),
  ),
  scovillain(
    string: "スコヴィラン",
    types: [Types.grass, Types.fire],
    abilities: [Abilities.chlorophyll, Abilities.insomnia, Abilities.moody],
    stats: Stats(h: 65, a: 108, b: 65, c: 108, d: 65, s: 75),
  ),
  cacnea(
    string: "サボネア",
    types: [Types.grass],
    abilities: [Abilities.sand_veil, Abilities.water_absorb],
    stats: Stats(h: 50, a: 85, b: 40, c: 85, d: 40, s: 35),
  ),
  cacturne(
    string: "ノクタス",
    types: [Types.grass, Types.dark],
    abilities: [Abilities.sand_veil, Abilities.water_absorb],
    stats: Stats(h: 70, a: 115, b: 60, c: 115, d: 60, s: 55),
  ),
  rellor(
    string: "シガロコ",
    types: [Types.bug],
    abilities: [Abilities.compound_eyes, Abilities.shed_skin],
    stats: Stats(h: 41, a: 50, b: 60, c: 31, d: 58, s: 30),
  ),
  rabsca(
    string: "ベラカス",
    types: [Types.bug, Types.psychic],
    abilities: [Abilities.synchronize, Abilities.telepathy],
    stats: Stats(h: 75, a: 50, b: 85, c: 115, d: 100, s: 45),
  ),
  venonat(
    string: "コンパン",
    types: [Types.bug, Types.poison],
    abilities: [
      Abilities.compound_eyes,
      Abilities.tinted_lens,
      Abilities.run_away
    ],
    stats: Stats(h: 60, a: 55, b: 50, c: 40, d: 55, s: 45),
  ),
  venomoth(
    string: "モルフォン",
    types: [Types.bug, Types.poison],
    abilities: [
      Abilities.shield_dust,
      Abilities.tinted_lens,
      Abilities.wonder_skin
    ],
    stats: Stats(h: 70, a: 65, b: 60, c: 90, d: 75, s: 90),
  ),
  pineco(
    string: "クヌギダマ",
    types: [Types.bug],
    abilities: [Abilities.sturdy, Abilities.overcoat],
    stats: Stats(h: 50, a: 65, b: 90, c: 35, d: 35, s: 15),
  ),
  forretress(
    string: "フォレトス",
    types: [Types.bug, Types.steel],
    abilities: [Abilities.sturdy, Abilities.overcoat],
    stats: Stats(h: 75, a: 90, b: 140, c: 60, d: 60, s: 40),
  ),
  scyther(
    string: "ストライク",
    types: [Types.bug, Types.flying],
    abilities: [Abilities.swarm, Abilities.technician, Abilities.steadfast],
    stats: Stats(h: 70, a: 110, b: 80, c: 55, d: 80, s: 105),
  ),
  scizor(
    string: "ハッサム",
    types: [Types.bug, Types.steel],
    abilities: [Abilities.swarm, Abilities.technician, Abilities.light_metal],
    stats: Stats(h: 70, a: 130, b: 100, c: 55, d: 80, s: 65),
  ),
  heracross(
    string: "ヘラクロス",
    types: [Types.bug, Types.fighting],
    abilities: [Abilities.swarm, Abilities.guts, Abilities.moxie],
    stats: Stats(h: 80, a: 125, b: 75, c: 40, d: 95, s: 85),
  ),
  flittle(
    string: "ヒラヒナ",
    types: [Types.psychic],
    abilities: [Abilities.anticipation, Abilities.frisk, Abilities.speed_boost],
    stats: Stats(h: 30, a: 35, b: 30, c: 55, d: 30, s: 75),
  ),
  espathra(
    string: "クエスパトラ",
    types: [Types.psychic],
    abilities: [Abilities.opportunist, Abilities.frisk, Abilities.speed_boost],
    stats: Stats(h: 95, a: 60, b: 60, c: 101, d: 60, s: 105),
  ),
  hippopotas(
    string: "ヒポポタス",
    types: [Types.ground],
    abilities: [Abilities.sand_stream, Abilities.sand_force],
    stats: Stats(h: 68, a: 72, b: 78, c: 38, d: 42, s: 32),
  ),
  hippowdon(
    string: "カバルドン",
    types: [Types.ground],
    abilities: [Abilities.sand_stream, Abilities.sand_force],
    stats: Stats(h: 108, a: 112, b: 118, c: 68, d: 72, s: 47),
  ),
  sandile(
    string: "メグロコ",
    types: [Types.ground, Types.dark],
    abilities: [Abilities.intimidate, Abilities.moxie, Abilities.anger_point],
    stats: Stats(h: 50, a: 72, b: 35, c: 35, d: 35, s: 65),
  ),
  krokorok(
    string: "ワルビル",
    types: [Types.ground, Types.dark],
    abilities: [Abilities.intimidate, Abilities.moxie, Abilities.anger_point],
    stats: Stats(h: 60, a: 82, b: 45, c: 45, d: 45, s: 74),
  ),
  krookodile(
    string: "ワルビアル",
    types: [Types.ground, Types.dark],
    abilities: [Abilities.intimidate, Abilities.moxie, Abilities.anger_point],
    stats: Stats(h: 95, a: 117, b: 80, c: 65, d: 70, s: 92),
  ),
  silicobra(
    string: "スナヘビ",
    types: [Types.ground],
    abilities: [Abilities.sand_spit, Abilities.shed_skin, Abilities.sand_veil],
    stats: Stats(h: 52, a: 57, b: 75, c: 35, d: 50, s: 46),
  ),
  sandaconda(
    string: "サダイジャ",
    types: [Types.ground],
    abilities: [Abilities.sand_spit, Abilities.shed_skin, Abilities.sand_veil],
    stats: Stats(h: 72, a: 107, b: 125, c: 65, d: 70, s: 71),
  ),
  mudbray(
    string: "ドロバンコ",
    types: [Types.ground],
    abilities: [Abilities.own_tempo, Abilities.stamina, Abilities.inner_focus],
    stats: Stats(h: 70, a: 100, b: 70, c: 45, d: 55, s: 45),
  ),
  mudsdale(
    string: "バンバドロ",
    types: [Types.ground],
    abilities: [Abilities.own_tempo, Abilities.stamina, Abilities.inner_focus],
    stats: Stats(h: 100, a: 125, b: 100, c: 55, d: 85, s: 35),
  ),
  larvesta(
    string: "メラルバ",
    types: [Types.bug, Types.fire],
    abilities: [Abilities.flame_body, Abilities.swarm],
    stats: Stats(h: 55, a: 85, b: 55, c: 50, d: 55, s: 60),
  ),
  volcarona(
    string: "ウルガモス",
    types: [Types.bug, Types.fire],
    abilities: [Abilities.flame_body, Abilities.swarm],
    stats: Stats(h: 85, a: 60, b: 65, c: 135, d: 105, s: 100),
  ),
  bagon(
    string: "タツベイ",
    types: [Types.dragon],
    abilities: [Abilities.rock_head, Abilities.sheer_force],
    stats: Stats(h: 45, a: 75, b: 60, c: 40, d: 30, s: 50),
  ),
  shelgon(
    string: "コモルー",
    types: [Types.dragon],
    abilities: [Abilities.rock_head, Abilities.overcoat],
    stats: Stats(h: 65, a: 95, b: 100, c: 60, d: 50, s: 50),
  ),
  salamence(
    string: "ボーマンダ",
    types: [Types.dragon, Types.flying],
    abilities: [Abilities.intimidate, Abilities.moxie],
    stats: Stats(h: 95, a: 135, b: 80, c: 110, d: 80, s: 100),
  ),
  tinkatink(
    string: "カヌチャン",
    types: [Types.fairy, Types.steel],
    abilities: [
      Abilities.mold_breaker,
      Abilities.own_tempo,
      Abilities.pickpocket
    ],
    stats: Stats(h: 50, a: 45, b: 45, c: 35, d: 64, s: 58),
  ),
  tinkatuff(
    string: "ナカヌチャン",
    types: [Types.fairy, Types.steel],
    abilities: [
      Abilities.mold_breaker,
      Abilities.own_tempo,
      Abilities.pickpocket
    ],
    stats: Stats(h: 65, a: 55, b: 55, c: 45, d: 82, s: 78),
  ),
  tinkaton(
    string: "デカヌチャン",
    types: [Types.fairy, Types.steel],
    abilities: [
      Abilities.mold_breaker,
      Abilities.own_tempo,
      Abilities.pickpocket
    ],
    stats: Stats(h: 85, a: 75, b: 77, c: 70, d: 105, s: 94),
  ),
  hatenna(
    string: "ミブリム",
    types: [Types.psychic],
    abilities: [
      Abilities.healer,
      Abilities.anticipation,
      Abilities.magic_bounce
    ],
    stats: Stats(h: 42, a: 30, b: 45, c: 56, d: 53, s: 39),
  ),
  hattrem(
    string: "テブリム",
    types: [Types.psychic],
    abilities: [
      Abilities.healer,
      Abilities.anticipation,
      Abilities.magic_bounce
    ],
    stats: Stats(h: 57, a: 40, b: 65, c: 86, d: 73, s: 49),
  ),
  hatterene(
    string: "ブリムオン",
    types: [Types.psychic, Types.fairy],
    abilities: [
      Abilities.healer,
      Abilities.anticipation,
      Abilities.magic_bounce
    ],
    stats: Stats(h: 57, a: 90, b: 95, c: 136, d: 103, s: 29),
  ),
  impidimp(
    string: "ベロバー",
    types: [Types.dark, Types.fairy],
    abilities: [Abilities.prankster, Abilities.frisk, Abilities.pickpocket],
    stats: Stats(h: 45, a: 45, b: 30, c: 55, d: 40, s: 50),
  ),
  morgrem(
    string: "ギモー",
    types: [Types.dark, Types.fairy],
    abilities: [Abilities.prankster, Abilities.frisk, Abilities.pickpocket],
    stats: Stats(h: 65, a: 60, b: 45, c: 75, d: 55, s: 70),
  ),
  grimmsnarl(
    string: "オーロンゲ",
    types: [Types.dark, Types.fairy],
    abilities: [Abilities.prankster, Abilities.frisk, Abilities.pickpocket],
    stats: Stats(h: 95, a: 120, b: 65, c: 95, d: 75, s: 60),
  ),
  wiglett(
    string: "ウミディグダ",
    types: [Types.water],
    abilities: [Abilities.gooey, Abilities.rattled, Abilities.sand_veil],
    stats: Stats(h: 10, a: 55, b: 25, c: 35, d: 25, s: 95),
  ),
  wugtrio(
    string: "ウミトリオ",
    types: [Types.water],
    abilities: [Abilities.gooey, Abilities.rattled, Abilities.sand_veil],
    stats: Stats(h: 35, a: 100, b: 50, c: 50, d: 70, s: 120),
  ),
  bombirdier(
    string: "オトシドリ",
    types: [Types.flying, Types.dark],
    abilities: [
      Abilities.big_pecks,
      Abilities.keen_eye,
      Abilities.rocky_payload
    ],
    stats: Stats(h: 70, a: 103, b: 85, c: 60, d: 85, s: 82),
  ),
  finizen(
    string: "ナミイルカ",
    types: [Types.water],
    abilities: [Abilities.water_veil],
    stats: Stats(h: 70, a: 45, b: 40, c: 45, d: 40, s: 75),
  ),
  palafin(
    string: "イルカマン(ナイーブフォルム)",
    types: [Types.water],
    abilities: [Abilities.zero_to_hero],
    stats: Stats(h: 100, a: 70, b: 72, c: 53, d: 62, s: 100),
  ),
  palafin_hero(
    string: "イルカマン(マイティフォルム)",
    types: [Types.water],
    abilities: [Abilities.zero_to_hero],
    stats: Stats(h: 100, a: 160, b: 97, c: 106, d: 87, s: 100),
  ),
  varoom(
    string: "ブロロン",
    types: [Types.steel, Types.poison],
    abilities: [Abilities.overcoat, Abilities.slow_start],
    stats: Stats(h: 45, a: 70, b: 63, c: 30, d: 45, s: 47),
  ),
  revavroom(
    string: "ブロロローム",
    types: [Types.steel, Types.poison],
    abilities: [Abilities.overcoat, Abilities.filter],
    stats: Stats(h: 80, a: 119, b: 90, c: 54, d: 67, s: 90),
  ),
  cyclizar(
    string: "モトトカゲ",
    types: [Types.dragon, Types.normal],
    abilities: [Abilities.shed_skin, Abilities.regenerator],
    stats: Stats(h: 70, a: 95, b: 65, c: 85, d: 65, s: 121),
  ),
  orthworm(
    string: "ミミズズ",
    types: [Types.steel],
    abilities: [Abilities.earth_eater, Abilities.sand_veil],
    stats: Stats(h: 70, a: 85, b: 145, c: 60, d: 55, s: 65),
  ),
  sableye(
    string: "ヤミラミ",
    types: [Types.dark, Types.ghost],
    abilities: [Abilities.keen_eye, Abilities.stall, Abilities.prankster],
    stats: Stats(h: 50, a: 75, b: 75, c: 65, d: 65, s: 50),
  ),
  shuppet(
    string: "カゲボウズ",
    types: [Types.ghost],
    abilities: [Abilities.insomnia, Abilities.frisk, Abilities.cursed_body],
    stats: Stats(h: 44, a: 75, b: 35, c: 63, d: 33, s: 45),
  ),
  banette(
    string: "ジュペッタ",
    types: [Types.ghost],
    abilities: [Abilities.insomnia, Abilities.frisk, Abilities.cursed_body],
    stats: Stats(h: 64, a: 115, b: 65, c: 83, d: 63, s: 65),
  ),
  falinks(
    string: "タイレーツ",
    types: [Types.fighting],
    abilities: [Abilities.battle_armor, Abilities.defiant],
    stats: Stats(h: 65, a: 100, b: 100, c: 70, d: 60, s: 75),
  ),
  hawlucha(
    string: "ルチャブル",
    types: [Types.fighting, Types.flying],
    abilities: [Abilities.limber, Abilities.unburden, Abilities.mold_breaker],
    stats: Stats(h: 78, a: 92, b: 75, c: 74, d: 63, s: 118),
  ),
  spiritomb(
    string: "ミカルゲ",
    types: [Types.ghost, Types.dark],
    abilities: [Abilities.pressure, Abilities.infiltrator],
    stats: Stats(h: 50, a: 92, b: 108, c: 92, d: 108, s: 35),
  ),
  noibat(
    string: "オンバット",
    types: [Types.flying, Types.dragon],
    abilities: [Abilities.frisk, Abilities.infiltrator, Abilities.telepathy],
    stats: Stats(h: 40, a: 30, b: 35, c: 45, d: 40, s: 55),
  ),
  noivern(
    string: "オンバーン",
    types: [Types.flying, Types.dragon],
    abilities: [Abilities.frisk, Abilities.infiltrator, Abilities.telepathy],
    stats: Stats(h: 85, a: 70, b: 80, c: 97, d: 80, s: 123),
  ),
  dreepy(
    string: "ドラメシヤ",
    types: [Types.dragon, Types.ghost],
    abilities: [
      Abilities.clear_body,
      Abilities.infiltrator,
      Abilities.cursed_body
    ],
    stats: Stats(h: 28, a: 60, b: 30, c: 40, d: 30, s: 82),
  ),
  drakloak(
    string: "ドロンチ",
    types: [Types.dragon, Types.ghost],
    abilities: [
      Abilities.clear_body,
      Abilities.infiltrator,
      Abilities.cursed_body
    ],
    stats: Stats(h: 68, a: 80, b: 50, c: 60, d: 50, s: 102),
  ),
  dragapult(
    string: "ドラパルト",
    types: [Types.dragon, Types.ghost],
    abilities: [
      Abilities.clear_body,
      Abilities.infiltrator,
      Abilities.cursed_body
    ],
    stats: Stats(h: 88, a: 120, b: 75, c: 100, d: 75, s: 142),
  ),
  glimmet(
    string: "キラーメ",
    types: [Types.rock, Types.poison],
    abilities: [Abilities.toxic_debris, Abilities.corrosion],
    stats: Stats(h: 48, a: 35, b: 42, c: 105, d: 60, s: 60),
  ),
  glimmora(
    string: "キラフロル",
    types: [Types.rock, Types.poison],
    abilities: [Abilities.toxic_debris, Abilities.corrosion],
    stats: Stats(h: 83, a: 55, b: 90, c: 130, d: 81, s: 86),
  ),
  rotom(
    string: "ロトム",
    types: [Types.electric, Types.ghost],
    abilities: [Abilities.levitate],
    stats: Stats(h: 50, a: 50, b: 77, c: 95, d: 77, s: 91),
  ),
  rotom_heat(
    string: "ヒートロトム",
    types: [Types.electric, Types.fire],
    abilities: [Abilities.levitate],
    stats: Stats(h: 50, a: 65, b: 107, c: 105, d: 107, s: 86),
  ),
  rotom_wash(
    string: "ウォッシュロトム",
    types: [Types.electric, Types.water],
    abilities: [Abilities.levitate],
    stats: Stats(h: 50, a: 65, b: 107, c: 105, d: 107, s: 86),
  ),
  rotom_frost(
    string: "フロストロトム",
    types: [Types.electric, Types.ice],
    abilities: [Abilities.levitate],
    stats: Stats(h: 50, a: 65, b: 107, c: 105, d: 107, s: 86),
  ),
  rotom_fan(
    string: "スピンロトム",
    types: [Types.electric, Types.flying],
    abilities: [Abilities.levitate],
    stats: Stats(h: 50, a: 65, b: 107, c: 105, d: 107, s: 86),
  ),
  rotom_mow(
    string: "カットロトム",
    types: [Types.electric, Types.grass],
    abilities: [Abilities.levitate],
    stats: Stats(h: 50, a: 65, b: 107, c: 105, d: 107, s: 86),
  ),
  greavard(
    string: "ボチ",
    types: [Types.ghost],
    abilities: [Abilities.pickup, Abilities.fluffy],
    stats: Stats(h: 50, a: 61, b: 60, c: 30, d: 55, s: 34),
  ),
  houndstone(
    string: "ハカドッグ",
    types: [Types.ghost],
    abilities: [Abilities.sand_rush, Abilities.fluffy],
    stats: Stats(h: 72, a: 101, b: 100, c: 50, d: 97, s: 68),
  ),
  oranguru(
    string: "ヤレユータン",
    types: [Types.normal, Types.psychic],
    abilities: [
      Abilities.inner_focus,
      Abilities.telepathy,
      Abilities.symbiosis
    ],
    stats: Stats(h: 90, a: 60, b: 80, c: 90, d: 110, s: 60),
  ),
  passimian(
    string: "ナゲツケサル",
    types: [Types.fighting],
    abilities: [Abilities.receiver, Abilities.defiant],
    stats: Stats(h: 100, a: 120, b: 90, c: 40, d: 60, s: 80),
  ),
  komala(
    string: "ネッコアラ",
    types: [Types.normal],
    abilities: [Abilities.comatose],
    stats: Stats(h: 65, a: 115, b: 65, c: 75, d: 95, s: 65),
  ),
  larvitar(
    string: "ヨーギラス",
    types: [Types.rock, Types.ground],
    abilities: [Abilities.guts, Abilities.sand_veil],
    stats: Stats(h: 50, a: 64, b: 50, c: 45, d: 50, s: 41),
  ),
  pupitar(
    string: "サナギラス",
    types: [Types.rock, Types.ground],
    abilities: [Abilities.shed_skin],
    stats: Stats(h: 70, a: 84, b: 70, c: 65, d: 70, s: 51),
  ),
  tyranitar(
    string: "バンギラス",
    types: [Types.rock, Types.dark],
    abilities: [Abilities.sand_stream, Abilities.unnerve],
    stats: Stats(h: 100, a: 134, b: 110, c: 95, d: 100, s: 61),
  ),
  stonjourner(
    string: "イシヘンジン",
    types: [Types.rock],
    abilities: [Abilities.power_spot],
    stats: Stats(h: 100, a: 125, b: 135, c: 20, d: 20, s: 70),
  ),
  eiscue(
    string: "コオリッポ(アイスフェイス)",
    types: [Types.ice],
    abilities: [Abilities.ice_face],
    stats: Stats(h: 75, a: 80, b: 110, c: 65, d: 90, s: 50),
  ),
  eiscue_noice(
    string: "コオリッポ(ナイスフェイス)",
    types: [Types.ice],
    abilities: [Abilities.ice_face],
    stats: Stats(h: 75, a: 80, b: 70, c: 65, d: 50, s: 130),
  ),
  pincurchin(
    string: "バチンウニ",
    types: [Types.electric],
    abilities: [Abilities.lightning_rod, Abilities.electric_surge],
    stats: Stats(h: 48, a: 101, b: 95, c: 91, d: 85, s: 15),
  ),
  sandygast(
    string: "スナバァ",
    types: [Types.ghost, Types.ground],
    abilities: [Abilities.water_compaction, Abilities.sand_veil],
    stats: Stats(h: 55, a: 55, b: 80, c: 70, d: 45, s: 15),
  ),
  palossand(
    string: "シロデスナ",
    types: [Types.ghost, Types.ground],
    abilities: [Abilities.water_compaction, Abilities.sand_veil],
    stats: Stats(h: 85, a: 75, b: 110, c: 100, d: 75, s: 35),
  ),
  slowpoke(
    string: "ヤドン",
    types: [Types.water, Types.psychic],
    abilities: [
      Abilities.oblivious,
      Abilities.own_tempo,
      Abilities.regenerator
    ],
    stats: Stats(h: 90, a: 65, b: 65, c: 40, d: 40, s: 15),
  ),
  slowbro(
    string: "ヤドラン",
    types: [Types.water, Types.psychic],
    abilities: [
      Abilities.oblivious,
      Abilities.own_tempo,
      Abilities.regenerator
    ],
    stats: Stats(h: 95, a: 75, b: 110, c: 100, d: 80, s: 30),
  ),
  slowking(
    string: "ヤドキング",
    types: [Types.water, Types.psychic],
    abilities: [
      Abilities.oblivious,
      Abilities.own_tempo,
      Abilities.regenerator
    ],
    stats: Stats(h: 95, a: 75, b: 80, c: 100, d: 110, s: 30),
  ),
  shellos_west(
    string: "カラナクシ(にしのうみ)",
    types: [Types.water],
    abilities: [
      Abilities.sticky_hold,
      Abilities.storm_drain,
      Abilities.sand_force
    ],
    stats: Stats(h: 76, a: 48, b: 48, c: 57, d: 62, s: 34),
  ),
  shellos_east(
    string: "カラナクシ(ひがしのうみ)",
    types: [Types.water],
    abilities: [
      Abilities.sticky_hold,
      Abilities.storm_drain,
      Abilities.sand_force
    ],
    stats: Stats(h: 76, a: 48, b: 48, c: 57, d: 62, s: 34),
  ),
  gastrodon_west(
    string: "トリトドン(にしのうみ)",
    types: [Types.water, Types.ground],
    abilities: [
      Abilities.sticky_hold,
      Abilities.storm_drain,
      Abilities.sand_force
    ],
    stats: Stats(h: 111, a: 83, b: 68, c: 92, d: 82, s: 39),
  ),
  gastrodon_east(
    string: "トリトドン(ひがしのうみ)",
    types: [Types.water, Types.ground],
    abilities: [
      Abilities.sticky_hold,
      Abilities.storm_drain,
      Abilities.sand_force
    ],
    stats: Stats(h: 111, a: 83, b: 68, c: 92, d: 82, s: 39),
  ),
  shellder(
    string: "シェルダー",
    types: [Types.water],
    abilities: [
      Abilities.shell_armor,
      Abilities.skill_link,
      Abilities.overcoat
    ],
    stats: Stats(h: 30, a: 65, b: 100, c: 45, d: 25, s: 40),
  ),
  cloyster(
    string: "パルシェン",
    types: [Types.water, Types.ice],
    abilities: [
      Abilities.shell_armor,
      Abilities.skill_link,
      Abilities.overcoat
    ],
    stats: Stats(h: 50, a: 95, b: 180, c: 85, d: 45, s: 70),
  ),
  qwilfish(
    string: "ハリーセン",
    types: [Types.water, Types.poison],
    abilities: [
      Abilities.poison_point,
      Abilities.swift_swim,
      Abilities.intimidate
    ],
    stats: Stats(h: 65, a: 95, b: 85, c: 55, d: 55, s: 85),
  ),
  luvdisc(
    string: "ラブカス",
    types: [Types.water],
    abilities: [Abilities.swift_swim, Abilities.hydration],
    stats: Stats(h: 43, a: 30, b: 55, c: 40, d: 65, s: 97),
  ),
  finneon(
    string: "ケイコウオ",
    types: [Types.water],
    abilities: [
      Abilities.swift_swim,
      Abilities.storm_drain,
      Abilities.water_veil
    ],
    stats: Stats(h: 49, a: 49, b: 56, c: 49, d: 61, s: 66),
  ),
  lumineon(
    string: "ネオラント",
    types: [Types.water],
    abilities: [
      Abilities.swift_swim,
      Abilities.storm_drain,
      Abilities.water_veil
    ],
    stats: Stats(h: 69, a: 69, b: 76, c: 69, d: 86, s: 91),
  ),
  bruxish(
    string: "ハギギシリ",
    types: [Types.water, Types.psychic],
    abilities: [
      Abilities.dazzling,
      Abilities.strong_jaw,
      Abilities.wonder_skin
    ],
    stats: Stats(h: 68, a: 105, b: 70, c: 70, d: 70, s: 92),
  ),
  alomomola(
    string: "ママンボウ",
    types: [Types.water],
    abilities: [Abilities.healer, Abilities.hydration, Abilities.regenerator],
    stats: Stats(h: 165, a: 75, b: 80, c: 40, d: 45, s: 65),
  ),
  skrelp(
    string: "クズモー",
    types: [Types.poison, Types.water],
    abilities: [
      Abilities.poison_point,
      Abilities.poison_touch,
      Abilities.adaptability
    ],
    stats: Stats(h: 50, a: 60, b: 60, c: 60, d: 60, s: 30),
  ),
  dragalge(
    string: "ドラミドロ",
    types: [Types.poison, Types.dragon],
    abilities: [
      Abilities.poison_point,
      Abilities.poison_touch,
      Abilities.adaptability
    ],
    stats: Stats(h: 65, a: 75, b: 90, c: 97, d: 123, s: 44),
  ),
  clauncher(
    string: "ウデッポウ",
    types: [Types.water],
    abilities: [Abilities.mega_launcher],
    stats: Stats(h: 50, a: 53, b: 62, c: 58, d: 63, s: 44),
  ),
  clawitzer(
    string: "ブロスター",
    types: [Types.water],
    abilities: [Abilities.mega_launcher],
    stats: Stats(h: 71, a: 73, b: 88, c: 120, d: 89, s: 59),
  ),
  tynamo(
    string: "シビシラス",
    types: [Types.electric],
    abilities: [Abilities.levitate],
    stats: Stats(h: 35, a: 55, b: 40, c: 45, d: 40, s: 60),
  ),
  eelektrik(
    string: "シビビール",
    types: [Types.electric],
    abilities: [Abilities.levitate],
    stats: Stats(h: 65, a: 85, b: 70, c: 75, d: 70, s: 40),
  ),
  eelektross(
    string: "シビルドン",
    types: [Types.electric],
    abilities: [Abilities.levitate],
    stats: Stats(h: 85, a: 115, b: 80, c: 105, d: 80, s: 50),
  ),
  mareanie(
    string: "ヒドイデ",
    types: [Types.poison, Types.water],
    abilities: [Abilities.merciless, Abilities.limber, Abilities.regenerator],
    stats: Stats(h: 50, a: 53, b: 62, c: 43, d: 52, s: 45),
  ),
  toxapex(
    string: "ドヒドイデ",
    types: [Types.poison, Types.water],
    abilities: [Abilities.merciless, Abilities.limber, Abilities.regenerator],
    stats: Stats(h: 50, a: 63, b: 152, c: 53, d: 142, s: 35),
  ),
  flamigo(
    string: "カラミンゴ",
    types: [Types.flying, Types.fighting],
    abilities: [Abilities.scrappy, Abilities.tangled_feet, Abilities.costar],
    stats: Stats(h: 82, a: 115, b: 74, c: 75, d: 64, s: 90),
  ),
  dratini(
    string: "ミニリュウ",
    types: [Types.dragon],
    abilities: [Abilities.shed_skin, Abilities.marvel_scale],
    stats: Stats(h: 41, a: 64, b: 45, c: 50, d: 50, s: 50),
  ),
  dragonair(
    string: "ハクリュー",
    types: [Types.dragon],
    abilities: [Abilities.shed_skin, Abilities.marvel_scale],
    stats: Stats(h: 61, a: 84, b: 65, c: 70, d: 70, s: 70),
  ),
  dragonite(
    string: "カイリュー",
    types: [Types.dragon, Types.flying],
    abilities: [Abilities.inner_focus, Abilities.multiscale],
    stats: Stats(h: 91, a: 134, b: 95, c: 100, d: 100, s: 80),
  ),
  snom(
    string: "ユキハミ",
    types: [Types.ice, Types.bug],
    abilities: [Abilities.shield_dust, Abilities.ice_scales],
    stats: Stats(h: 30, a: 25, b: 35, c: 45, d: 30, s: 20),
  ),
  frosmoth(
    string: "モスノウ",
    types: [Types.ice, Types.bug],
    abilities: [Abilities.shield_dust, Abilities.ice_scales],
    stats: Stats(h: 70, a: 65, b: 60, c: 125, d: 90, s: 65),
  ),
  snover(
    string: "ユキカブリ",
    types: [Types.grass, Types.ice],
    abilities: [Abilities.snow_warning, Abilities.soundproof],
    stats: Stats(h: 60, a: 62, b: 50, c: 62, d: 60, s: 40),
  ),
  abomasnow(
    string: "ユキノオー",
    types: [Types.grass, Types.ice],
    abilities: [Abilities.snow_warning, Abilities.soundproof],
    stats: Stats(h: 90, a: 92, b: 75, c: 92, d: 85, s: 60),
  ),
  delibird(
    string: "デリバード",
    types: [Types.ice, Types.flying],
    abilities: [Abilities.vital_spirit, Abilities.hustle, Abilities.insomnia],
    stats: Stats(h: 45, a: 55, b: 45, c: 65, d: 45, s: 75),
  ),
  cubchoo(
    string: "クマシュン",
    types: [Types.ice],
    abilities: [Abilities.snow_cloak, Abilities.slush_rush, Abilities.rattled],
    stats: Stats(h: 55, a: 70, b: 40, c: 60, d: 40, s: 40),
  ),
  beartic(
    string: "ツンベアー",
    types: [Types.ice],
    abilities: [
      Abilities.snow_cloak,
      Abilities.slush_rush,
      Abilities.swift_swim
    ],
    stats: Stats(h: 95, a: 130, b: 80, c: 70, d: 80, s: 50),
  ),
  snorunt(
    string: "ユキワラシ",
    types: [Types.ice],
    abilities: [Abilities.inner_focus, Abilities.ice_body, Abilities.moody],
    stats: Stats(h: 50, a: 50, b: 50, c: 50, d: 50, s: 50),
  ),
  glalie(
    string: "オニゴーリ",
    types: [Types.ice],
    abilities: [Abilities.inner_focus, Abilities.ice_body, Abilities.moody],
    stats: Stats(h: 80, a: 80, b: 80, c: 80, d: 80, s: 80),
  ),
  froslass(
    string: "ユキメノコ",
    types: [Types.ice, Types.ghost],
    abilities: [Abilities.snow_cloak, Abilities.cursed_body],
    stats: Stats(h: 70, a: 80, b: 70, c: 80, d: 70, s: 110),
  ),
  cryogonal(
    string: "フリージオ",
    types: [Types.ice],
    abilities: [Abilities.levitate],
    stats: Stats(h: 80, a: 50, b: 50, c: 95, d: 135, s: 105),
  ),
  cetoddle(
    string: "アルクジラ",
    types: [Types.ice],
    abilities: [
      Abilities.thick_fat,
      Abilities.snow_cloak,
      Abilities.sheer_force
    ],
    stats: Stats(h: 108, a: 68, b: 45, c: 30, d: 40, s: 43),
  ),
  cetitan(
    string: "ハルクジラ",
    types: [Types.ice],
    abilities: [
      Abilities.thick_fat,
      Abilities.slush_rush,
      Abilities.sheer_force
    ],
    stats: Stats(h: 170, a: 113, b: 65, c: 45, d: 55, s: 73),
  ),
  bergmite(
    string: "カチコール",
    types: [Types.ice],
    abilities: [Abilities.own_tempo, Abilities.ice_body, Abilities.sturdy],
    stats: Stats(h: 55, a: 69, b: 85, c: 32, d: 35, s: 28),
  ),
  avalugg(
    string: "クレベース",
    types: [Types.ice],
    abilities: [Abilities.own_tempo, Abilities.ice_body, Abilities.sturdy],
    stats: Stats(h: 95, a: 117, b: 184, c: 44, d: 46, s: 28),
  ),
  rufflet(
    string: "ワシボン",
    types: [Types.normal, Types.flying],
    abilities: [Abilities.keen_eye, Abilities.sheer_force, Abilities.hustle],
    stats: Stats(h: 70, a: 83, b: 50, c: 37, d: 50, s: 60),
  ),
  braviary(
    string: "ウォーグル",
    types: [Types.normal, Types.flying],
    abilities: [Abilities.keen_eye, Abilities.sheer_force, Abilities.defiant],
    stats: Stats(h: 100, a: 123, b: 75, c: 57, d: 75, s: 80),
  ),
  pawniard(
    string: "コマタナ",
    types: [Types.dark, Types.steel],
    abilities: [Abilities.defiant, Abilities.inner_focus, Abilities.pressure],
    stats: Stats(h: 45, a: 85, b: 70, c: 40, d: 40, s: 60),
  ),
  bisharp(
    string: "キリキザン",
    types: [Types.dark, Types.steel],
    abilities: [Abilities.defiant, Abilities.inner_focus, Abilities.pressure],
    stats: Stats(h: 65, a: 125, b: 100, c: 60, d: 70, s: 70),
  ),
  kingambit(
    string: "ドドゲザン",
    types: [Types.dark, Types.steel],
    abilities: [
      Abilities.defiant,
      Abilities.supreme_overlord,
      Abilities.pressure
    ],
    stats: Stats(h: 100, a: 135, b: 120, c: 60, d: 85, s: 50),
  ),
  deino(
    string: "モノズ",
    types: [Types.dark, Types.dragon],
    abilities: [Abilities.hustle],
    stats: Stats(h: 52, a: 65, b: 50, c: 45, d: 50, s: 38),
  ),
  zweilous(
    string: "ジヘッド",
    types: [Types.dark, Types.dragon],
    abilities: [Abilities.hustle],
    stats: Stats(h: 72, a: 85, b: 70, c: 65, d: 70, s: 58),
  ),
  hydreigon(
    string: "サザンドラ",
    types: [Types.dark, Types.dragon],
    abilities: [Abilities.levitate],
    stats: Stats(h: 92, a: 105, b: 90, c: 125, d: 90, s: 98),
  ),
  veluza(
    string: "ミガルーサ",
    types: [Types.water, Types.psychic],
    abilities: [Abilities.mold_breaker, Abilities.sharpness],
    stats: Stats(h: 90, a: 102, b: 73, c: 78, d: 65, s: 70),
  ),
  dondozo(
    string: "ヘイラッシャ",
    types: [Types.water],
    abilities: [Abilities.unaware, Abilities.oblivious, Abilities.water_veil],
    stats: Stats(h: 150, a: 100, b: 115, c: 65, d: 65, s: 35),
  ),
  tatsugiri_curly(
    string: "シャリタツ(そったすがた)",
    types: [Types.dragon, Types.water],
    abilities: [Abilities.commander, Abilities.storm_drain],
    stats: Stats(h: 68, a: 50, b: 60, c: 120, d: 95, s: 82),
  ),
  tatsugiri_droopy(
    string: "シャリタツ(たれたすがた)",
    types: [Types.dragon, Types.water],
    abilities: [Abilities.commander, Abilities.storm_drain],
    stats: Stats(h: 68, a: 50, b: 60, c: 120, d: 95, s: 82),
  ),
  tatsugiri_stretchy(
    string: "シャリタツ(のびたすがた)",
    types: [Types.dragon, Types.water],
    abilities: [Abilities.commander, Abilities.storm_drain],
    stats: Stats(h: 68, a: 50, b: 60, c: 120, d: 95, s: 82),
  ),
  great_tusk(
    string: "イダイナキバ",
    types: [Types.ground, Types.fighting],
    abilities: [Abilities.protosynthesis],
    stats: Stats(h: 115, a: 131, b: 131, c: 53, d: 53, s: 87),
  ),
  scream_tail(
    string: "サケブシッポ",
    types: [Types.fairy, Types.psychic],
    abilities: [Abilities.protosynthesis],
    stats: Stats(h: 115, a: 65, b: 99, c: 65, d: 115, s: 111),
  ),
  brute_bonnet(
    string: "アラブルタケ",
    types: [Types.grass, Types.dark],
    abilities: [Abilities.protosynthesis],
    stats: Stats(h: 111, a: 127, b: 99, c: 79, d: 99, s: 55),
  ),
  flutter_mane(
    string: "ハバタクカミ",
    types: [Types.ghost, Types.fairy],
    abilities: [Abilities.protosynthesis],
    stats: Stats(h: 55, a: 55, b: 55, c: 135, d: 135, s: 135),
  ),
  slither_wing(
    string: "チヲハウハネ",
    types: [Types.bug, Types.fighting],
    abilities: [Abilities.protosynthesis],
    stats: Stats(h: 85, a: 135, b: 79, c: 85, d: 105, s: 81),
  ),
  sandy_shocks(
    string: "スナノケガワ",
    types: [Types.electric, Types.ground],
    abilities: [Abilities.protosynthesis],
    stats: Stats(h: 85, a: 81, b: 97, c: 121, d: 85, s: 101),
  ),
  iron_treads(
    string: "テツノワダチ",
    types: [Types.ground, Types.steel],
    abilities: [Abilities.quark_drive],
    stats: Stats(h: 90, a: 112, b: 120, c: 72, d: 70, s: 106),
  ),
  iron_bundle(
    string: "テツノツツミ",
    types: [Types.ice, Types.water],
    abilities: [Abilities.quark_drive],
    stats: Stats(h: 56, a: 80, b: 114, c: 124, d: 60, s: 136),
  ),
  iron_hands(
    string: "テツノカイナ",
    types: [Types.fighting, Types.electric],
    abilities: [Abilities.quark_drive],
    stats: Stats(h: 154, a: 140, b: 108, c: 50, d: 68, s: 50),
  ),
  iron_jugulis(
    string: "テツノコウベ",
    types: [Types.dark, Types.flying],
    abilities: [Abilities.quark_drive],
    stats: Stats(h: 94, a: 80, b: 86, c: 122, d: 80, s: 108),
  ),
  iron_moth(
    string: "テツノドクガ",
    types: [Types.fire, Types.poison],
    abilities: [Abilities.quark_drive],
    stats: Stats(h: 80, a: 70, b: 60, c: 140, d: 110, s: 110),
  ),
  iron_thorns(
    string: "テツノイバラ",
    types: [Types.rock, Types.electric],
    abilities: [Abilities.quark_drive],
    stats: Stats(h: 100, a: 134, b: 110, c: 70, d: 84, s: 72),
  ),
  frigibax(
    string: "セビエ",
    types: [Types.dragon, Types.ice],
    abilities: [Abilities.thermal_exchange, Abilities.ice_body],
    stats: Stats(h: 65, a: 75, b: 45, c: 35, d: 45, s: 55),
  ),
  arctibax(
    string: "セゴール",
    types: [Types.dragon, Types.ice],
    abilities: [Abilities.thermal_exchange, Abilities.ice_body],
    stats: Stats(h: 90, a: 95, b: 66, c: 45, d: 65, s: 62),
  ),
  baxcalibur(
    string: "セグレイブ",
    types: [Types.dragon, Types.ice],
    abilities: [Abilities.thermal_exchange, Abilities.ice_body],
    stats: Stats(h: 115, a: 145, b: 92, c: 75, d: 86, s: 87),
  ),
  gimmighoul(
    string: "コレクレー",
    types: [Types.ghost],
    abilities: [Abilities.rattled],
    stats: Stats(h: 45, a: 30, b: 70, c: 75, d: 70, s: 10),
  ),
  gholdengo(
    string: "サーフゴー",
    types: [Types.steel, Types.ghost],
    abilities: [Abilities.good_as_gold],
    stats: Stats(h: 87, a: 60, b: 95, c: 133, d: 91, s: 84),
  ),
  wo_chien(
    string: "チオンジェン",
    types: [Types.dark, Types.grass],
    abilities: [Abilities.tablets_of_ruin],
    stats: Stats(h: 85, a: 85, b: 100, c: 95, d: 135, s: 70),
  ),
  chien_pao(
    string: "パオジアン",
    types: [Types.dark, Types.ice],
    abilities: [Abilities.sword_of_ruin],
    stats: Stats(h: 80, a: 120, b: 80, c: 90, d: 65, s: 135),
  ),
  ting_lu(
    string: "ディンルー",
    types: [Types.dark, Types.ground],
    abilities: [Abilities.vessel_of_ruin],
    stats: Stats(h: 155, a: 110, b: 125, c: 55, d: 80, s: 45),
  ),
  chi_yu(
    string: "イーユイ",
    types: [Types.dark, Types.fire],
    abilities: [Abilities.beads_of_ruin],
    stats: Stats(h: 55, a: 80, b: 80, c: 135, d: 120, s: 100),
  ),
  roaring_moon(
    string: "トドロクツキ",
    types: [Types.dragon, Types.dark],
    abilities: [Abilities.protosynthesis],
    stats: Stats(h: 105, a: 139, b: 71, c: 55, d: 101, s: 119),
  ),
  iron_valiant(
    string: "テツノブジン",
    types: [Types.fairy, Types.fighting],
    abilities: [Abilities.quark_drive],
    stats: Stats(h: 74, a: 130, b: 90, c: 120, d: 60, s: 116),
  ),
  koraidon(
    string: "コライドン",
    types: [Types.fighting, Types.dragon],
    abilities: [Abilities.orichalcum_pulse],
    stats: Stats(h: 100, a: 135, b: 115, c: 85, d: 100, s: 135),
  ),
  miraidon(
    string: "ミライドン",
    types: [Types.electric, Types.dragon],
    abilities: [Abilities.hadron_engine],
    stats: Stats(h: 100, a: 85, b: 100, c: 135, d: 115, s: 135),
  ),

  charmander(
    string: "ヒトカゲ",
    types: [Types.fire],
    abilities: [Abilities.blaze, Abilities.solar_power],
    stats: Stats(h: 39, a: 51, b: 43, c: 60, d: 50, s: 65),
  ),
  charmeleon(
    string: "リザード",
    types: [Types.fire],
    abilities: [Abilities.blaze, Abilities.solar_power],
    stats: Stats(h: 58, a: 64, b: 58, c: 80, d: 65, s: 80),
  ),
  charizard(
    string: "リザードン",
    types: [Types.fire, Types.flying],
    abilities: [Abilities.blaze, Abilities.solar_power],
    stats: Stats(h: 78, a: 84, b: 78, c: 109, d: 85, s: 100),
  ),

  froakie(
    string: "ケロマツ",
    types: [Types.water],
    abilities: [Abilities.torrent, Abilities.protean],
    stats: Stats(h: 41, a: 56, b: 40, c: 62, d: 44, s: 71),
  ),
  frogadier(
    string: "ゲコガシラ",
    types: [Types.water],
    abilities: [Abilities.torrent, Abilities.protean],
    stats: Stats(h: 54, a: 63, b: 52, c: 83, d: 56, s: 97),
  ),
  greninja(
    string: "ゲッコウガ",
    types: [Types.water, Types.dark],
    abilities: [Abilities.torrent, Abilities.protean],
    stats: Stats(h: 72, a: 95, b: 67, c: 103, d: 71, s: 122),
  ),

  scorbunny(
    string: "ヒバニー",
    types: [Types.fire],
    abilities: [Abilities.blaze, Abilities.libero],
    stats: Stats(h: 50, a: 71, b: 40, c: 40, d: 40, s: 69),
  ),
  raboot(
    string: "ラビフット",
    types: [Types.fire],
    abilities: [Abilities.blaze, Abilities.libero],
    stats: Stats(h: 65, a: 86, b: 60, c: 55, d: 60, s: 94),
  ),
  cinderace(
    string: "エースバーン",
    types: [Types.fire],
    abilities: [Abilities.blaze, Abilities.libero],
    stats: Stats(h: 80, a: 116, b: 75, c: 65, d: 75, s: 119),
  ),
  walking_wake(
    string: "ウネルミナモ",
    types: [Types.water, Types.dragon],
    abilities: [Abilities.protosynthesis],
    stats: Stats(h: 99, a: 83, b: 91, c: 125, d: 83, s: 109),
  ),
  iron_leaves(
    string: "テツノイサハ",
    types: [Types.grass, Types.psychic],
    abilities: [Abilities.quark_drive],
    stats: Stats(h: 90, a: 130, b: 88, c: 70, d: 108, s: 104),
  ),
  ;

  const Pokedex({
    required this.string,
    required this.types,
    required this.abilities,
    required this.stats,
  });

  @override
  final String string;
  final List<Types> types;
  final List<Abilities> abilities;
  final Stats stats;
  String get icon => 'assets/pokedex/${name.replaceAll('_', '-')}.png';
}
