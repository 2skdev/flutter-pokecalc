import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/enums.dart';

part 'environment.freezed.dart';
// part 'environment.g.dart';

@freezed
abstract class Environment with _$Environment {
  const Environment._();

  const factory Environment({
    @Default(Weathers.none) Weathers weather,
    @Default(Fields.none) Fields field,
  }) = _Environment;
}
