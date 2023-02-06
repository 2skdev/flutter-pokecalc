import 'theory.dart';

class Party {
  Party({List<TheoryKey>? data})
      : _data = data ?? List<TheoryKey>.generate(maxLength, (index) => null);

  final List<TheoryKey> _data;

  TheoryKey operator [](int index) {
    assert(index < maxLength);
    return _data[index];
  }

  Party update(int index, TheoryKey key) {
    final newData = [..._data];
    newData[index] = key;
    return Party(data: newData);
  }

  Party delete(int index) {
    final newData = [..._data];
    newData[index] = null;
    return Party(data: newData);
  }

  int length() {
    return _data.length;
  }

  static int get maxLength => 6;
}
