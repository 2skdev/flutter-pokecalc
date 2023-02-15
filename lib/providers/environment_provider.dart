import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/environment_model.dart';

class EnvironmentProvider extends StateNotifier<Environment> {
  EnvironmentProvider() : super(const Environment());

  void setState(Environment env) {
    state = env;
  }
}

final environmentProvider =
    StateNotifierProvider<EnvironmentProvider, Environment>(
  (_) => EnvironmentProvider(),
);
