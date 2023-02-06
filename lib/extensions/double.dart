// 五捨五超入の拡張
extension Math on double {
  int round6() {
    return (this - 0.5).ceil();
  }

  int to12bit() {
    return (this * (1 << 12)).round();
  }
}
