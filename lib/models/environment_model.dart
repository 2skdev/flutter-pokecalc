import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/enums.dart';

part 'environment_model.freezed.dart';

@freezed
abstract class Environment with _$Environment {
  const Environment._();

  const factory Environment({
    @Default(Weathers.none) Weathers weather,
    @Default(Fields.none) Fields field,
  }) = _Environment;

  bool get isDefault => weather == Weathers.none && field == Fields.none;
}
