import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/condition_model.dart';

class ConditionProvider extends StateNotifier<Conditions> {
  ConditionProvider() : super(const Conditions());

  void setState(Conditions conditions) {
    state = conditions;
  }

  void reset() {
    state = const Conditions();
  }
}

final conditionProvider = StateNotifierProvider<ConditionProvider, Conditions>(
  (_) => ConditionProvider(),
);
