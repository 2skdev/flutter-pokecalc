extension Imutable<T> on Iterable<T> {
  Iterable<T> clone() {
    return [...this];
  }

  Iterable<T> update(int index, T value) {
    final ret = clone().toList();
    assert(index < ret.length);
    ret[index] = value;
    return ret;
  }

  Iterable<T> append(T value) {
    final ret = clone().toList();
    ret.add(value);
    return ret;
  }

  Iterable<T> delete(T value) {
    return where((e) => e != value);
  }

  int? firstWhereIndexOrNull(bool Function(T element) test) {
    var index = 0;
    for (var element in this) {
      if (test(element)) return index;
      index++;
    }
    return null;
  }
}
