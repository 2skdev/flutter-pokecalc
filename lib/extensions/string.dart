extension Kana on String {
  String toKatakana() {
    return replaceAllMapped(
      RegExp('[ぁ-ゔ]'),
      (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 0x60),
    );
  }

  bool containKana(String value) {
    // 入力文字 or 入力文字(カタカナ) を含むか
    return contains(value) || contains(value.toKatakana());
  }
}
