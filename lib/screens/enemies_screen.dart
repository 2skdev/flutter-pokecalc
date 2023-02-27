import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokecalc/extensions/theory.dart';

import '../misc/calculator.dart';
import '../models/environment_model.dart';
import '../models/theory_model.dart';
import '../providers/providers.dart';
import '../screens/theory_screen.dart';
import '../widgets/ad_container_widget.dart';
import '../widgets/damage_bar_widget.dart';
import '../widgets/theory_card_widget.dart';
import '../widgets/type_chip_widget.dart';

class EnemiesScreen extends ConsumerWidget {
  const EnemiesScreen({
    super.key,
    required this.theory,
  });

  /// ダメージ計算する対象のポケモン
  final Theory theory;

  Widget damageCard({
    required BuildContext context,
    required TheoryCondition self,
    required TheoryCondition enemy,
    required Environment environment,
  }) {
    List<Widget> listDamages(
      TheoryCondition attacker,
      TheoryCondition defence,
    ) {
      final damages = <Widget>[];

      for (var index = 0; index < 4; index++) {
        // 攻撃技以外は表示しない
        if (attacker.theory.moves[index] != null &&
            attacker.theory.moves[index]!.power != null) {
          // 最小乱数のダメージ
          final damageMin = attacker.calcDamage(
            move: attacker.theory.moves[index]!,
            enemy: defence,
            environment: environment,
            rand: 0.85,
          );

          // 最大乱数のダメージ
          final damageMax = attacker.calcDamage(
            move: attacker.theory.moves[index]!,
            enemy: defence,
            environment: environment,
            rand: 1.00,
          );

          // HPに対する割合を計算
          final damageMinPer = damageMin / defence.theory.actual.h;
          final damageMaxPer = damageMax / defence.theory.actual.h;

          damages.addAll([
            Row(
              children: [
                TypeChipWidget(
                  type: attacker.theory.moves[index]!.type,
                  text:
                      '${attacker.theory.moves[index]!.string} $damageMin ~ $damageMax (${(100 * damageMinPer).toStringAsFixed(1)}% ~ ${(100 * damageMaxPer).toStringAsFixed(1)}%)',
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
              child: DamageBarWidget(
                damageMin: damageMinPer,
                damageMax: damageMaxPer,
              ),
            ),
          ]);
        }
      }

      return damages;
    }

    // ダメージ一覧のウィジェットを生成する
    final attackDamages = listDamages(self, enemy);
    final defenceDamages = listDamages(enemy, self);

    return TheoryCardWidget(
      key: Key(enemy.theory.key!),
      theory: enemy.theory,
      terastal: enemy.theory.terastal,
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TheoryScreen(
            theoryKey: enemy.theory.key!,
            enemy: true,
          ),
        ),
      ),
      children: [
        const Divider(),
        const Text('与ダメージ'),
        const SizedBox(height: 8.0),
        ...attackDamages,
        const Divider(),
        const Text('被ダメージ'),
        const SizedBox(height: 8.0),
        ...defenceDamages,
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enemies = ref.watch(enemyListProvider);
    final condition = ref.watch(conditionProvider);
    final environment = ref.watch(environmentProvider);

    final List<Widget> cards = enemies
        .map(
          (e) => damageCard(
            context: context,
            self: TheoryCondition(theory: theory, condition: condition.self),
            enemy: TheoryCondition(theory: e, condition: condition.enemy),
            environment: environment,
          ),
        )
        .toList();

    for (var i = 3; i < cards.length; i += 4) {
      cards.insert(
        i,
        const AdContainerWidget(
          adSize: AdSize.largeBanner,
        ),
      );
    }
    cards.add(
      const AdContainerWidget(
        adSize: AdSize.mediumRectangle,
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: cards,
        ),
      ),
    );
  }
}
