import '../models/stats.dart';

enum Natures {
  lonely(
    string: 'さみしがり',
    buff: Stats(h: 0, a: 1, b: -1, c: 0, d: 0, s: 0),
  ),
  adamant(
    string: 'いじっぱり',
    buff: Stats(h: 0, a: 1, b: 0, c: -1, d: 0, s: 0),
  ),
  naughty(
    string: 'やんちゃ',
    buff: Stats(h: 0, a: 1, b: 0, c: 0, d: -1, s: 0),
  ),
  brave(
    string: 'ゆうかん',
    buff: Stats(h: 0, a: 1, b: 0, c: 0, d: 0, s: -1),
  ),

  bold(
    string: 'ずぶとい',
    buff: Stats(h: 0, a: -1, b: 1, c: 0, d: 0, s: 0),
  ),
  impish(
    string: 'わんぱく',
    buff: Stats(h: 0, a: 0, b: 1, c: -1, d: 0, s: 0),
  ),
  lax(
    string: 'のうてんき',
    buff: Stats(h: 0, a: 0, b: 1, c: 0, d: -1, s: 0),
  ),
  relaxed(
    string: 'のんき',
    buff: Stats(h: 0, a: 0, b: 1, c: 0, d: 0, s: -1),
  ),

  modest(
    string: 'ひかえめ',
    buff: Stats(h: 0, a: -1, b: 0, c: 1, d: 0, s: 0),
  ),
  mild(
    string: 'おっとり',
    buff: Stats(h: 0, a: 0, b: -1, c: 1, d: 0, s: 0),
  ),
  rash(
    string: 'うっかりや',
    buff: Stats(h: 0, a: 0, b: 0, c: 1, d: -1, s: 0),
  ),
  quiet(
    string: 'れいせい',
    buff: Stats(h: 0, a: 0, b: 0, c: 1, d: 0, s: -1),
  ),

  calm(
    string: 'おだやか',
    buff: Stats(h: 0, a: -1, b: 0, c: 0, d: 1, s: 0),
  ),
  gentle(
    string: 'おとなしい',
    buff: Stats(h: 0, a: 0, b: -1, c: 0, d: 1, s: 0),
  ),
  careful(
    string: 'しんちょう',
    buff: Stats(h: 0, a: 0, b: 0, c: -1, d: 1, s: 0),
  ),
  sassy(
    string: 'なまいき',
    buff: Stats(h: 0, a: 0, b: 0, c: 0, d: 1, s: -1),
  ),

  timid(
    string: 'おくびょう',
    buff: Stats(h: 0, a: -1, b: 0, c: 0, d: 0, s: 1),
  ),
  hasty(
    string: 'せっかち',
    buff: Stats(h: 0, a: 0, b: -1, c: 0, d: 0, s: 1),
  ),
  jolly(
    string: 'ようき',
    buff: Stats(h: 0, a: 0, b: 0, c: -1, d: 0, s: 1),
  ),
  naive(
    string: 'むじゃき',
    buff: Stats(h: 0, a: 0, b: 0, c: 0, d: -1, s: 1),
  ),

  hardy(
    string: 'がんばりや',
    buff: Stats(h: 0, a: 0, b: 0, c: 0, d: 0, s: 0),
  ),
  docile(
    string: 'すなお',
    buff: Stats(h: 0, a: 0, b: 0, c: 0, d: 0, s: 0),
  ),
  serious(
    string: 'まじめ',
    buff: Stats(h: 0, a: 0, b: 0, c: 0, d: 0, s: 0),
  ),
  bashful(
    string: 'てれや',
    buff: Stats(h: 0, a: 0, b: 0, c: 0, d: 0, s: 0),
  ),
  quirky(
    string: 'きまぐれ',
    buff: Stats(h: 0, a: 0, b: 0, c: 0, d: 0, s: 0),
  );

  const Natures({required this.string, required this.buff});

  final String string;
  final Stats buff;
}
