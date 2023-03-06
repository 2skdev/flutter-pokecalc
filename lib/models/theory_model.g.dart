// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Theory _$$_TheoryFromJson(Map<String, dynamic> json) => _$_Theory(
      id: json['id'] as String,
      pokemon: $enumDecodeNullable(_$PokedexEnumMap, json['pokemon']) ??
          Pokedex.sprigatito,
      types: (json['types'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$TypesEnumMap, e))
              .toList() ??
          const <Types>[],
      teratype:
          $enumDecodeNullable(_$TypesEnumMap, json['teratype']) ?? Types.grass,
      terastal: json['terastal'] as bool? ?? false,
      ability: json['ability'] == null
          ? const AbilityModel()
          : AbilityModel.fromJson(json['ability'] as Map<String, dynamic>),
      item: $enumDecodeNullable(_$ItemsEnumMap, json['item']) ??
          Items.sitrusberry,
      nature: $enumDecodeNullable(_$NaturesEnumMap, json['nature']) ??
          Natures.jolly,
      moves: (json['moves'] as List<dynamic>?)
              ?.map((e) => MoveModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [MoveModel(), MoveModel(), MoveModel(), MoveModel()],
      effort: json['effort'] == null
          ? const Stats(h: 0, a: 0, b: 0, c: 0, d: 0, s: 0)
          : Stats.fromJson(json['effort'] as Map<String, dynamic>),
      individual: json['individual'] == null
          ? const Stats(h: 31, a: 31, b: 31, c: 31, d: 31, s: 31)
          : Stats.fromJson(json['individual'] as Map<String, dynamic>),
      memo: json['memo'] as String? ?? '',
    );

Map<String, dynamic> _$$_TheoryToJson(_$_Theory instance) => <String, dynamic>{
      'id': instance.id,
      'pokemon': _$PokedexEnumMap[instance.pokemon]!,
      'types': instance.types.map((e) => _$TypesEnumMap[e]!).toList(),
      'teratype': _$TypesEnumMap[instance.teratype]!,
      'terastal': instance.terastal,
      'ability': instance.ability,
      'item': _$ItemsEnumMap[instance.item]!,
      'nature': _$NaturesEnumMap[instance.nature]!,
      'moves': instance.moves,
      'effort': instance.effort,
      'individual': instance.individual,
      'memo': instance.memo,
    };

const _$PokedexEnumMap = {
  Pokedex.sprigatito: 'sprigatito',
  Pokedex.floragato: 'floragato',
  Pokedex.meowscarada: 'meowscarada',
  Pokedex.fuecoco: 'fuecoco',
  Pokedex.crocalor: 'crocalor',
  Pokedex.skeledirge: 'skeledirge',
  Pokedex.quaxly: 'quaxly',
  Pokedex.quaxwell: 'quaxwell',
  Pokedex.quaquaval: 'quaquaval',
  Pokedex.lechonk: 'lechonk',
  Pokedex.oinkologne_male: 'oinkologne_male',
  Pokedex.oinkologne_female: 'oinkologne_female',
  Pokedex.tarountula: 'tarountula',
  Pokedex.spidops: 'spidops',
  Pokedex.nymble: 'nymble',
  Pokedex.lokix: 'lokix',
  Pokedex.hoppip: 'hoppip',
  Pokedex.skiploom: 'skiploom',
  Pokedex.jumpluff: 'jumpluff',
  Pokedex.fletchling: 'fletchling',
  Pokedex.fletchinder: 'fletchinder',
  Pokedex.talonflame: 'talonflame',
  Pokedex.pawmi: 'pawmi',
  Pokedex.pawmo: 'pawmo',
  Pokedex.pawmot: 'pawmot',
  Pokedex.houndour: 'houndour',
  Pokedex.houndoom: 'houndoom',
  Pokedex.yungoos: 'yungoos',
  Pokedex.gumshoos: 'gumshoos',
  Pokedex.skwovet: 'skwovet',
  Pokedex.greedent: 'greedent',
  Pokedex.sunkern: 'sunkern',
  Pokedex.sunflora: 'sunflora',
  Pokedex.kricketot: 'kricketot',
  Pokedex.kricketune: 'kricketune',
  Pokedex.scatterbug: 'scatterbug',
  Pokedex.spewpa: 'spewpa',
  Pokedex.vivillon: 'vivillon',
  Pokedex.combee: 'combee',
  Pokedex.vespiquen: 'vespiquen',
  Pokedex.rookidee: 'rookidee',
  Pokedex.corvisquire: 'corvisquire',
  Pokedex.corviknight: 'corviknight',
  Pokedex.happiny: 'happiny',
  Pokedex.chansey: 'chansey',
  Pokedex.blissey: 'blissey',
  Pokedex.azurill: 'azurill',
  Pokedex.marill: 'marill',
  Pokedex.azumarill: 'azumarill',
  Pokedex.surskit: 'surskit',
  Pokedex.masquerain: 'masquerain',
  Pokedex.buizel: 'buizel',
  Pokedex.floatzel: 'floatzel',
  Pokedex.wooper: 'wooper',
  Pokedex.wooper_paldean: 'wooper_paldean',
  Pokedex.quagsire: 'quagsire',
  Pokedex.clodsire: 'clodsire',
  Pokedex.psyduck: 'psyduck',
  Pokedex.golduck: 'golduck',
  Pokedex.chewtle: 'chewtle',
  Pokedex.drednaw: 'drednaw',
  Pokedex.igglybuff: 'igglybuff',
  Pokedex.jigglypuff: 'jigglypuff',
  Pokedex.wigglytuff: 'wigglytuff',
  Pokedex.ralts: 'ralts',
  Pokedex.kirlia: 'kirlia',
  Pokedex.gardevoir: 'gardevoir',
  Pokedex.gallade: 'gallade',
  Pokedex.drowzee: 'drowzee',
  Pokedex.hypno: 'hypno',
  Pokedex.gastly: 'gastly',
  Pokedex.haunter: 'haunter',
  Pokedex.gengar: 'gengar',
  Pokedex.tandemaus: 'tandemaus',
  Pokedex.maushold: 'maushold',
  Pokedex.pichu: 'pichu',
  Pokedex.pikachu: 'pikachu',
  Pokedex.raichu: 'raichu',
  Pokedex.fidough: 'fidough',
  Pokedex.dachsbun: 'dachsbun',
  Pokedex.slakoth: 'slakoth',
  Pokedex.vigoroth: 'vigoroth',
  Pokedex.slaking: 'slaking',
  Pokedex.bounsweet: 'bounsweet',
  Pokedex.steenee: 'steenee',
  Pokedex.tsareena: 'tsareena',
  Pokedex.smoliv: 'smoliv',
  Pokedex.dolliv: 'dolliv',
  Pokedex.arboliva: 'arboliva',
  Pokedex.bonsly: 'bonsly',
  Pokedex.sudowoodo: 'sudowoodo',
  Pokedex.rockruff: 'rockruff',
  Pokedex.lycanroc: 'lycanroc',
  Pokedex.lycanroc_midnight: 'lycanroc_midnight',
  Pokedex.lycanroc_dusk: 'lycanroc_dusk',
  Pokedex.rolycoly: 'rolycoly',
  Pokedex.carkol: 'carkol',
  Pokedex.coalossal: 'coalossal',
  Pokedex.shinx: 'shinx',
  Pokedex.luxio: 'luxio',
  Pokedex.luxray: 'luxray',
  Pokedex.starly: 'starly',
  Pokedex.staravia: 'staravia',
  Pokedex.staraptor: 'staraptor',
  Pokedex.oricorio: 'oricorio',
  Pokedex.oricorio_pom_pom: 'oricorio_pom_pom',
  Pokedex.oricorio_pau: 'oricorio_pau',
  Pokedex.oricorio_sensu: 'oricorio_sensu',
  Pokedex.mareep: 'mareep',
  Pokedex.flaaffy: 'flaaffy',
  Pokedex.ampharos: 'ampharos',
  Pokedex.petilil: 'petilil',
  Pokedex.lilligant: 'lilligant',
  Pokedex.shroomish: 'shroomish',
  Pokedex.breloom: 'breloom',
  Pokedex.applin: 'applin',
  Pokedex.flapple: 'flapple',
  Pokedex.appletun: 'appletun',
  Pokedex.spoink: 'spoink',
  Pokedex.grumpig: 'grumpig',
  Pokedex.squawkabilly: 'squawkabilly',
  Pokedex.misdreavus: 'misdreavus',
  Pokedex.mismagius: 'mismagius',
  Pokedex.makuhita: 'makuhita',
  Pokedex.hariyama: 'hariyama',
  Pokedex.crabrawler: 'crabrawler',
  Pokedex.crabominable: 'crabominable',
  Pokedex.salandit: 'salandit',
  Pokedex.salazzle: 'salazzle',
  Pokedex.phanpy: 'phanpy',
  Pokedex.donphan: 'donphan',
  Pokedex.cufant: 'cufant',
  Pokedex.copperajah: 'copperajah',
  Pokedex.gible: 'gible',
  Pokedex.gabite: 'gabite',
  Pokedex.garchomp: 'garchomp',
  Pokedex.nacli: 'nacli',
  Pokedex.naclstack: 'naclstack',
  Pokedex.garganacl: 'garganacl',
  Pokedex.wingull: 'wingull',
  Pokedex.pelipper: 'pelipper',
  Pokedex.magikarp: 'magikarp',
  Pokedex.gyarados: 'gyarados',
  Pokedex.arrokuda: 'arrokuda',
  Pokedex.barraskewda: 'barraskewda',
  Pokedex.basculin_white_striped: 'basculin_white_striped',
  Pokedex.basculin_red_striped: 'basculin_red_striped',
  Pokedex.basculin_blue_striped: 'basculin_blue_striped',
  Pokedex.gulpin: 'gulpin',
  Pokedex.swalot: 'swalot',
  Pokedex.meowth: 'meowth',
  Pokedex.meowth_galarian: 'meowth_galarian',
  Pokedex.persian: 'persian',
  Pokedex.perrserker: 'perrserker',
  Pokedex.drifloon: 'drifloon',
  Pokedex.drifblim: 'drifblim',
  Pokedex.flabebe: 'flabebe',
  Pokedex.floette: 'floette',
  Pokedex.florges: 'florges',
  Pokedex.diglett: 'diglett',
  Pokedex.dugtrio: 'dugtrio',
  Pokedex.torkoal: 'torkoal',
  Pokedex.numel: 'numel',
  Pokedex.camerupt: 'camerupt',
  Pokedex.bronzor: 'bronzor',
  Pokedex.bronzong: 'bronzong',
  Pokedex.axew: 'axew',
  Pokedex.fraxure: 'fraxure',
  Pokedex.haxorus: 'haxorus',
  Pokedex.mankey: 'mankey',
  Pokedex.primeape: 'primeape',
  Pokedex.annihilape: 'annihilape',
  Pokedex.meditite: 'meditite',
  Pokedex.medicham: 'medicham',
  Pokedex.riolu: 'riolu',
  Pokedex.lucario: 'lucario',
  Pokedex.charcadet: 'charcadet',
  Pokedex.armarouge: 'armarouge',
  Pokedex.ceruledge: 'ceruledge',
  Pokedex.barboach: 'barboach',
  Pokedex.whiscash: 'whiscash',
  Pokedex.tadbulb: 'tadbulb',
  Pokedex.bellibolt: 'bellibolt',
  Pokedex.goomy: 'goomy',
  Pokedex.sliggoo: 'sliggoo',
  Pokedex.goodra: 'goodra',
  Pokedex.croagunk: 'croagunk',
  Pokedex.toxicroak: 'toxicroak',
  Pokedex.wattrel: 'wattrel',
  Pokedex.kilowattrel: 'kilowattrel',
  Pokedex.eevee: 'eevee',
  Pokedex.vaporeon: 'vaporeon',
  Pokedex.jolteon: 'jolteon',
  Pokedex.flareon: 'flareon',
  Pokedex.espeon: 'espeon',
  Pokedex.umbreon: 'umbreon',
  Pokedex.leafeon: 'leafeon',
  Pokedex.glaceon: 'glaceon',
  Pokedex.sylveon: 'sylveon',
  Pokedex.dunsparce: 'dunsparce',
  Pokedex.dudunsparce: 'dudunsparce',
  Pokedex.deerling_spring: 'deerling_spring',
  Pokedex.deerling_summer: 'deerling_summer',
  Pokedex.deerling_autumn: 'deerling_autumn',
  Pokedex.deerling_winter: 'deerling_winter',
  Pokedex.sawsbuck_spring: 'sawsbuck_spring',
  Pokedex.sawsbuck_summer: 'sawsbuck_summer',
  Pokedex.sawsbuck_autumn: 'sawsbuck_autumn',
  Pokedex.sawsbuck_winter: 'sawsbuck_winter',
  Pokedex.girafarig: 'girafarig',
  Pokedex.farigiraf: 'farigiraf',
  Pokedex.grimer: 'grimer',
  Pokedex.muk: 'muk',
  Pokedex.maschiff: 'maschiff',
  Pokedex.mabosstiff: 'mabosstiff',
  Pokedex.toxel: 'toxel',
  Pokedex.toxtricity_amped: 'toxtricity_amped',
  Pokedex.toxtricity_low_key: 'toxtricity_low_key',
  Pokedex.dedenne: 'dedenne',
  Pokedex.pachirisu: 'pachirisu',
  Pokedex.shroodle: 'shroodle',
  Pokedex.grafaiai: 'grafaiai',
  Pokedex.stantler: 'stantler',
  Pokedex.foongus: 'foongus',
  Pokedex.amoonguss: 'amoonguss',
  Pokedex.voltorb: 'voltorb',
  Pokedex.electrode: 'electrode',
  Pokedex.magnemite: 'magnemite',
  Pokedex.magneton: 'magneton',
  Pokedex.magnezone: 'magnezone',
  Pokedex.ditto: 'ditto',
  Pokedex.growlithe: 'growlithe',
  Pokedex.arcanine: 'arcanine',
  Pokedex.teddiursa: 'teddiursa',
  Pokedex.ursaring: 'ursaring',
  Pokedex.zangoose: 'zangoose',
  Pokedex.seviper: 'seviper',
  Pokedex.swablu: 'swablu',
  Pokedex.altaria: 'altaria',
  Pokedex.skiddo: 'skiddo',
  Pokedex.gogoat: 'gogoat',
  Pokedex.tauros_paldean: 'tauros_paldean',
  Pokedex.tauros_paldean_blaze: 'tauros_paldean_blaze',
  Pokedex.tauros_paldean_aqua: 'tauros_paldean_aqua',
  Pokedex.litleo: 'litleo',
  Pokedex.pyroar_male: 'pyroar_male',
  Pokedex.pyroar_female: 'pyroar_female',
  Pokedex.stunky: 'stunky',
  Pokedex.skuntank: 'skuntank',
  Pokedex.zorua: 'zorua',
  Pokedex.zoroark: 'zoroark',
  Pokedex.zoroark_hisuian: 'zoroark_hisuian',
  Pokedex.sneasel: 'sneasel',
  Pokedex.weavile: 'weavile',
  Pokedex.murkrow: 'murkrow',
  Pokedex.honchkrow: 'honchkrow',
  Pokedex.gothita: 'gothita',
  Pokedex.gothorita: 'gothorita',
  Pokedex.gothitelle: 'gothitelle',
  Pokedex.sinistea: 'sinistea',
  Pokedex.polteageist: 'polteageist',
  Pokedex.mimikyu: 'mimikyu',
  Pokedex.klefki: 'klefki',
  Pokedex.indeedee_male: 'indeedee_male',
  Pokedex.indeedee_female: 'indeedee_female',
  Pokedex.bramblin: 'bramblin',
  Pokedex.brambleghast: 'brambleghast',
  Pokedex.toedscool: 'toedscool',
  Pokedex.toedscruel: 'toedscruel',
  Pokedex.tropius: 'tropius',
  Pokedex.fomantis: 'fomantis',
  Pokedex.lurantis: 'lurantis',
  Pokedex.klawf: 'klawf',
  Pokedex.capsakid: 'capsakid',
  Pokedex.scovillain: 'scovillain',
  Pokedex.cacnea: 'cacnea',
  Pokedex.cacturne: 'cacturne',
  Pokedex.rellor: 'rellor',
  Pokedex.rabsca: 'rabsca',
  Pokedex.venonat: 'venonat',
  Pokedex.venomoth: 'venomoth',
  Pokedex.pineco: 'pineco',
  Pokedex.forretress: 'forretress',
  Pokedex.scyther: 'scyther',
  Pokedex.scizor: 'scizor',
  Pokedex.heracross: 'heracross',
  Pokedex.flittle: 'flittle',
  Pokedex.espathra: 'espathra',
  Pokedex.hippopotas: 'hippopotas',
  Pokedex.hippowdon: 'hippowdon',
  Pokedex.sandile: 'sandile',
  Pokedex.krokorok: 'krokorok',
  Pokedex.krookodile: 'krookodile',
  Pokedex.silicobra: 'silicobra',
  Pokedex.sandaconda: 'sandaconda',
  Pokedex.mudbray: 'mudbray',
  Pokedex.mudsdale: 'mudsdale',
  Pokedex.larvesta: 'larvesta',
  Pokedex.volcarona: 'volcarona',
  Pokedex.bagon: 'bagon',
  Pokedex.shelgon: 'shelgon',
  Pokedex.salamence: 'salamence',
  Pokedex.tinkatink: 'tinkatink',
  Pokedex.tinkatuff: 'tinkatuff',
  Pokedex.tinkaton: 'tinkaton',
  Pokedex.hatenna: 'hatenna',
  Pokedex.hattrem: 'hattrem',
  Pokedex.hatterene: 'hatterene',
  Pokedex.impidimp: 'impidimp',
  Pokedex.morgrem: 'morgrem',
  Pokedex.grimmsnarl: 'grimmsnarl',
  Pokedex.wiglett: 'wiglett',
  Pokedex.wugtrio: 'wugtrio',
  Pokedex.bombirdier: 'bombirdier',
  Pokedex.finizen: 'finizen',
  Pokedex.palafin: 'palafin',
  Pokedex.palafin_hero: 'palafin_hero',
  Pokedex.varoom: 'varoom',
  Pokedex.revavroom: 'revavroom',
  Pokedex.cyclizar: 'cyclizar',
  Pokedex.orthworm: 'orthworm',
  Pokedex.sableye: 'sableye',
  Pokedex.shuppet: 'shuppet',
  Pokedex.banette: 'banette',
  Pokedex.falinks: 'falinks',
  Pokedex.hawlucha: 'hawlucha',
  Pokedex.spiritomb: 'spiritomb',
  Pokedex.noibat: 'noibat',
  Pokedex.noivern: 'noivern',
  Pokedex.dreepy: 'dreepy',
  Pokedex.drakloak: 'drakloak',
  Pokedex.dragapult: 'dragapult',
  Pokedex.glimmet: 'glimmet',
  Pokedex.glimmora: 'glimmora',
  Pokedex.rotom: 'rotom',
  Pokedex.rotom_heat: 'rotom_heat',
  Pokedex.rotom_wash: 'rotom_wash',
  Pokedex.rotom_frost: 'rotom_frost',
  Pokedex.rotom_fan: 'rotom_fan',
  Pokedex.rotom_mow: 'rotom_mow',
  Pokedex.greavard: 'greavard',
  Pokedex.houndstone: 'houndstone',
  Pokedex.oranguru: 'oranguru',
  Pokedex.passimian: 'passimian',
  Pokedex.komala: 'komala',
  Pokedex.larvitar: 'larvitar',
  Pokedex.pupitar: 'pupitar',
  Pokedex.tyranitar: 'tyranitar',
  Pokedex.stonjourner: 'stonjourner',
  Pokedex.eiscue: 'eiscue',
  Pokedex.eiscue_noice: 'eiscue_noice',
  Pokedex.pincurchin: 'pincurchin',
  Pokedex.sandygast: 'sandygast',
  Pokedex.palossand: 'palossand',
  Pokedex.slowpoke: 'slowpoke',
  Pokedex.slowbro: 'slowbro',
  Pokedex.slowking: 'slowking',
  Pokedex.shellos_west: 'shellos_west',
  Pokedex.shellos_east: 'shellos_east',
  Pokedex.gastrodon_west: 'gastrodon_west',
  Pokedex.gastrodon_east: 'gastrodon_east',
  Pokedex.shellder: 'shellder',
  Pokedex.cloyster: 'cloyster',
  Pokedex.qwilfish: 'qwilfish',
  Pokedex.luvdisc: 'luvdisc',
  Pokedex.finneon: 'finneon',
  Pokedex.lumineon: 'lumineon',
  Pokedex.bruxish: 'bruxish',
  Pokedex.alomomola: 'alomomola',
  Pokedex.skrelp: 'skrelp',
  Pokedex.dragalge: 'dragalge',
  Pokedex.clauncher: 'clauncher',
  Pokedex.clawitzer: 'clawitzer',
  Pokedex.tynamo: 'tynamo',
  Pokedex.eelektrik: 'eelektrik',
  Pokedex.eelektross: 'eelektross',
  Pokedex.mareanie: 'mareanie',
  Pokedex.toxapex: 'toxapex',
  Pokedex.flamigo: 'flamigo',
  Pokedex.dratini: 'dratini',
  Pokedex.dragonair: 'dragonair',
  Pokedex.dragonite: 'dragonite',
  Pokedex.snom: 'snom',
  Pokedex.frosmoth: 'frosmoth',
  Pokedex.snover: 'snover',
  Pokedex.abomasnow: 'abomasnow',
  Pokedex.delibird: 'delibird',
  Pokedex.cubchoo: 'cubchoo',
  Pokedex.beartic: 'beartic',
  Pokedex.snorunt: 'snorunt',
  Pokedex.glalie: 'glalie',
  Pokedex.froslass: 'froslass',
  Pokedex.cryogonal: 'cryogonal',
  Pokedex.cetoddle: 'cetoddle',
  Pokedex.cetitan: 'cetitan',
  Pokedex.bergmite: 'bergmite',
  Pokedex.avalugg: 'avalugg',
  Pokedex.rufflet: 'rufflet',
  Pokedex.braviary: 'braviary',
  Pokedex.pawniard: 'pawniard',
  Pokedex.bisharp: 'bisharp',
  Pokedex.kingambit: 'kingambit',
  Pokedex.deino: 'deino',
  Pokedex.zweilous: 'zweilous',
  Pokedex.hydreigon: 'hydreigon',
  Pokedex.veluza: 'veluza',
  Pokedex.dondozo: 'dondozo',
  Pokedex.tatsugiri_curly: 'tatsugiri_curly',
  Pokedex.tatsugiri_droopy: 'tatsugiri_droopy',
  Pokedex.tatsugiri_stretchy: 'tatsugiri_stretchy',
  Pokedex.great_tusk: 'great_tusk',
  Pokedex.scream_tail: 'scream_tail',
  Pokedex.brute_bonnet: 'brute_bonnet',
  Pokedex.flutter_mane: 'flutter_mane',
  Pokedex.slither_wing: 'slither_wing',
  Pokedex.sandy_shocks: 'sandy_shocks',
  Pokedex.iron_treads: 'iron_treads',
  Pokedex.iron_bundle: 'iron_bundle',
  Pokedex.iron_hands: 'iron_hands',
  Pokedex.iron_jugulis: 'iron_jugulis',
  Pokedex.iron_moth: 'iron_moth',
  Pokedex.iron_thorns: 'iron_thorns',
  Pokedex.frigibax: 'frigibax',
  Pokedex.arctibax: 'arctibax',
  Pokedex.baxcalibur: 'baxcalibur',
  Pokedex.gimmighoul: 'gimmighoul',
  Pokedex.gholdengo: 'gholdengo',
  Pokedex.wo_chien: 'wo_chien',
  Pokedex.chien_pao: 'chien_pao',
  Pokedex.ting_lu: 'ting_lu',
  Pokedex.chi_yu: 'chi_yu',
  Pokedex.roaring_moon: 'roaring_moon',
  Pokedex.iron_valiant: 'iron_valiant',
  Pokedex.koraidon: 'koraidon',
  Pokedex.miraidon: 'miraidon',
  Pokedex.charmander: 'charmander',
  Pokedex.charmeleon: 'charmeleon',
  Pokedex.charizard: 'charizard',
  Pokedex.froakie: 'froakie',
  Pokedex.frogadier: 'frogadier',
  Pokedex.greninja: 'greninja',
  Pokedex.scorbunny: 'scorbunny',
  Pokedex.raboot: 'raboot',
  Pokedex.cinderace: 'cinderace',
  Pokedex.walking_wake: 'walking_wake',
  Pokedex.iron_leaves: 'iron_leaves',
};

const _$TypesEnumMap = {
  Types.normal: 'normal',
  Types.fire: 'fire',
  Types.water: 'water',
  Types.electric: 'electric',
  Types.grass: 'grass',
  Types.ice: 'ice',
  Types.fighting: 'fighting',
  Types.poison: 'poison',
  Types.ground: 'ground',
  Types.flying: 'flying',
  Types.psychic: 'psychic',
  Types.bug: 'bug',
  Types.rock: 'rock',
  Types.ghost: 'ghost',
  Types.dragon: 'dragon',
  Types.dark: 'dark',
  Types.steel: 'steel',
  Types.fairy: 'fairy',
};

const _$ItemsEnumMap = {
  Items.abilityshield: 'abilityshield',
  Items.absorbbulb: 'absorbbulb',
  Items.adamantorb: 'adamantorb',
  Items.airballoon: 'airballoon',
  Items.amuletcoin: 'amuletcoin',
  Items.assaultvest: 'assaultvest',
  Items.bigroot: 'bigroot',
  Items.bindingband: 'bindingband',
  Items.blackbelt: 'blackbelt',
  Items.blackglasses: 'blackglasses',
  Items.blacksludge: 'blacksludge',
  Items.blunderpolicy: 'blunderpolicy',
  Items.boosterenergy: 'boosterenergy',
  Items.brightpowder: 'brightpowder',
  Items.cellbattery: 'cellbattery',
  Items.charcoal: 'charcoal',
  Items.choiceband: 'choiceband',
  Items.choicescarf: 'choicescarf',
  Items.choicespecs: 'choicespecs',
  Items.clearamulet: 'clearamulet',
  Items.covertcloak: 'covertcloak',
  Items.damprock: 'damprock',
  Items.destinyknot: 'destinyknot',
  Items.dracoplate: 'dracoplate',
  Items.dragonfang: 'dragonfang',
  Items.dreadplate: 'dreadplate',
  Items.earthplate: 'earthplate',
  Items.ejectbutton: 'ejectbutton',
  Items.ejectpack: 'ejectpack',
  Items.electricseed: 'electricseed',
  Items.everstone: 'everstone',
  Items.eviolite: 'eviolite',
  Items.expertbelt: 'expertbelt',
  Items.fistplate: 'fistplate',
  Items.flameorb: 'flameorb',
  Items.flameplate: 'flameplate',
  Items.floatstone: 'floatstone',
  Items.focusband: 'focusband',
  Items.focussash: 'focussash',
  Items.grassyseed: 'grassyseed',
  Items.gripclaw: 'gripclaw',
  Items.griseouscore: 'griseouscore',
  Items.griseousorb: 'griseousorb',
  Items.hardstone: 'hardstone',
  Items.heatrock: 'heatrock',
  Items.heavy_dutyboots: 'heavy_dutyboots',
  Items.icicleplate: 'icicleplate',
  Items.icyrock: 'icyrock',
  Items.insectplate: 'insectplate',
  Items.ironball: 'ironball',
  Items.ironplate: 'ironplate',
  Items.kingsrock: 'kingsrock',
  Items.laggingtail: 'laggingtail',
  Items.leftovers: 'leftovers',
  Items.lifeorb: 'lifeorb',
  Items.lightball: 'lightball',
  Items.lightclay: 'lightclay',
  Items.loadeddice: 'loadeddice',
  Items.luckyegg: 'luckyegg',
  Items.luminousmoss: 'luminousmoss',
  Items.lustrousorb: 'lustrousorb',
  Items.magnet: 'magnet',
  Items.meadowplate: 'meadowplate',
  Items.mentalherb: 'mentalherb',
  Items.metalcoat: 'metalcoat',
  Items.metronome: 'metronome',
  Items.mindplate: 'mindplate',
  Items.miracleseed: 'miracleseed',
  Items.mirrorherb: 'mirrorherb',
  Items.mistyseed: 'mistyseed',
  Items.muscleband: 'muscleband',
  Items.mysticwater: 'mysticwater',
  Items.never_meltice: 'never_meltice',
  Items.normalgem: 'normalgem',
  Items.pixieplate: 'pixieplate',
  Items.poisonbarb: 'poisonbarb',
  Items.poweranklet: 'poweranklet',
  Items.powerband: 'powerband',
  Items.powerbelt: 'powerbelt',
  Items.powerbracer: 'powerbracer',
  Items.powerherb: 'powerherb',
  Items.powerlens: 'powerlens',
  Items.powerweight: 'powerweight',
  Items.protectivepads: 'protectivepads',
  Items.psychicseed: 'psychicseed',
  Items.punchingglove: 'punchingglove',
  Items.quickclaw: 'quickclaw',
  Items.razorclaw: 'razorclaw',
  Items.redcard: 'redcard',
  Items.ringtarget: 'ringtarget',
  Items.rockyhelmet: 'rockyhelmet',
  Items.roomservice: 'roomservice',
  Items.rustedshield: 'rustedshield',
  Items.rustedsword: 'rustedsword',
  Items.scopelens: 'scopelens',
  Items.sharpbeak: 'sharpbeak',
  Items.shedshell: 'shedshell',
  Items.shellbell: 'shellbell',
  Items.silkscarf: 'silkscarf',
  Items.silverpowder: 'silverpowder',
  Items.skyplate: 'skyplate',
  Items.smokeball: 'smokeball',
  Items.smoothrock: 'smoothrock',
  Items.snowball: 'snowball',
  Items.softsand: 'softsand',
  Items.soothebell: 'soothebell',
  Items.spelltag: 'spelltag',
  Items.splashplate: 'splashplate',
  Items.spookyplate: 'spookyplate',
  Items.stickybarb: 'stickybarb',
  Items.stoneplate: 'stoneplate',
  Items.terrainextender: 'terrainextender',
  Items.throatspray: 'throatspray',
  Items.toxicorb: 'toxicorb',
  Items.toxicplate: 'toxicplate',
  Items.twistedspoon: 'twistedspoon',
  Items.utilityumbrella: 'utilityumbrella',
  Items.weaknesspolicy: 'weaknesspolicy',
  Items.whiteherb: 'whiteherb',
  Items.widelens: 'widelens',
  Items.wiseglasses: 'wiseglasses',
  Items.zapplate: 'zapplate',
  Items.zoomlens: 'zoomlens',
  Items.aguavberry: 'aguavberry',
  Items.apicotberry: 'apicotberry',
  Items.aspearberry: 'aspearberry',
  Items.babiriberry: 'babiriberry',
  Items.chartiberry: 'chartiberry',
  Items.cheriberry: 'cheriberry',
  Items.chestoberry: 'chestoberry',
  Items.chilanberry: 'chilanberry',
  Items.chopleberry: 'chopleberry',
  Items.cobaberry: 'cobaberry',
  Items.colburberry: 'colburberry',
  Items.custapberry: 'custapberry',
  Items.enigmaberry: 'enigmaberry',
  Items.figyberry: 'figyberry',
  Items.ganlonberry: 'ganlonberry',
  Items.grepaberry: 'grepaberry',
  Items.habanberry: 'habanberry',
  Items.hondewberry: 'hondewberry',
  Items.iapapaberry: 'iapapaberry',
  Items.jabocaberry: 'jabocaberry',
  Items.kasibberry: 'kasibberry',
  Items.kebiaberry: 'kebiaberry',
  Items.keeberry: 'keeberry',
  Items.kelpsyberry: 'kelpsyberry',
  Items.lansatberry: 'lansatberry',
  Items.leppaberry: 'leppaberry',
  Items.liechiberry: 'liechiberry',
  Items.lumberry: 'lumberry',
  Items.magoberry: 'magoberry',
  Items.marangaberry: 'marangaberry',
  Items.micleberry: 'micleberry',
  Items.occaberry: 'occaberry',
  Items.oranberry: 'oranberry',
  Items.passhoberry: 'passhoberry',
  Items.payapaberry: 'payapaberry',
  Items.pechaberry: 'pechaberry',
  Items.persimberry: 'persimberry',
  Items.petayaberry: 'petayaberry',
  Items.pomegberry: 'pomegberry',
  Items.qualotberry: 'qualotberry',
  Items.rawstberry: 'rawstberry',
  Items.rindoberry: 'rindoberry',
  Items.roseliberry: 'roseliberry',
  Items.rowapberry: 'rowapberry',
  Items.salacberry: 'salacberry',
  Items.shucaberry: 'shucaberry',
  Items.sitrusberry: 'sitrusberry',
  Items.starfberry: 'starfberry',
  Items.tamatoberry: 'tamatoberry',
  Items.tangaberry: 'tangaberry',
  Items.wacanberry: 'wacanberry',
  Items.wikiberry: 'wikiberry',
  Items.yacheberry: 'yacheberry',
};

const _$NaturesEnumMap = {
  Natures.lonely: 'lonely',
  Natures.adamant: 'adamant',
  Natures.naughty: 'naughty',
  Natures.brave: 'brave',
  Natures.bold: 'bold',
  Natures.impish: 'impish',
  Natures.lax: 'lax',
  Natures.relaxed: 'relaxed',
  Natures.modest: 'modest',
  Natures.mild: 'mild',
  Natures.rash: 'rash',
  Natures.quiet: 'quiet',
  Natures.calm: 'calm',
  Natures.gentle: 'gentle',
  Natures.careful: 'careful',
  Natures.sassy: 'sassy',
  Natures.timid: 'timid',
  Natures.hasty: 'hasty',
  Natures.jolly: 'jolly',
  Natures.naive: 'naive',
  Natures.hardy: 'hardy',
  Natures.docile: 'docile',
  Natures.serious: 'serious',
  Natures.bashful: 'bashful',
  Natures.quirky: 'quirky',
};
