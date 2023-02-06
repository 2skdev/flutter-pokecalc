import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/environment.dart';

class EnvironmentNotifier extends StateNotifier<Environment> {
  EnvironmentNotifier() : super(const Environment());

  void setState(Environment env) {
    state = env;
  }
}

final environmentNofifier =
    StateNotifierProvider<EnvironmentNotifier, Environment>(
  (_) => EnvironmentNotifier(),
);
