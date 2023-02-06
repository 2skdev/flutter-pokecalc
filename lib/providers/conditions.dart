import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/condition.dart';

@immutable
class ConditionState {
  const ConditionState({
    this.self = const Condition(),
    this.enemy = const Condition(),
  });

  final Condition self;
  final Condition enemy;

  ConditionState copyWith({Condition? self, Condition? enemy}) {
    return ConditionState(self: self ?? this.self, enemy: enemy ?? this.enemy);
  }
}

class ConditionNotifier extends StateNotifier<ConditionState> {
  ConditionNotifier() : super(const ConditionState());

  void setState({Condition? self, Condition? enemy}) {
    state = state.copyWith(self: self, enemy: enemy);
  }
}

final conditionNofifier =
    StateNotifierProvider<ConditionNotifier, ConditionState>(
  (_) => ConditionNotifier(),
);
