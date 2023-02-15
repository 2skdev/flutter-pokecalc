import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/condition_model.dart';

class ConditionProvider extends StateNotifier<Conditions> {
  ConditionProvider() : super(const Conditions());

  void setState({Condition? self, Condition? enemy}) {
    state = state.copyWith(self: self, enemy: enemy);
  }
}

final conditionProvider = StateNotifierProvider<ConditionProvider, Conditions>(
  (_) => ConditionProvider(),
);
