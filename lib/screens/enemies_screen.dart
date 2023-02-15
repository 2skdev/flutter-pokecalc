import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants/dimens.dart';
import '../extensions/theory.dart';
import '../models/condition_model.dart';
import '../models/environment_model.dart';
import '../models/theory_model.dart';
import '../providers/providers.dart';
import '../screens/theory_screen.dart';
import '../widgets/ad_container_widget.dart';
import '../widgets/damage_bar_widget.dart';
import '../widgets/theory_card_widget.dart';

class EnemiesScreen extends ConsumerWidget {
  const EnemiesScreen({
    super.key,
    required this.theory,
  });

  /// ダメージ計算する対象のポケモン
  final Theory theory;

  Widget damageCard({
    required BuildContext context,
    required Theory enemy,
    required Conditions condition,
    required Environment environment,
  }) {
    List<Widget> listDamages(
      Theory attacker,
      Condition attackerCondition,
      Theory defence,
      Condition defenceCondition,
    ) {
      final damages = <Widget>[];

      for (var index = 0; index < 4; index++) {
        if (attacker.moves[index] != null &&
            attacker.moves[index]!.power != null) {
          final damageMin = attacker.damage(
            move: attacker.moves[index]!,
            enemy: defence,
            condition: attackerCondition,
            enemyCondition: defenceCondition,
            environment: environment,
            rand: 0.85,
          );

          final damageMax = attacker.damage(
            move: attacker.moves[index]!,
            enemy: defence,
            rand: 1.00,
            condition: attackerCondition,
            enemyCondition: defenceCondition,
            environment: environment,
          );

          damages.addAll([
            Row(
              children: [
                Image.asset(
                  attacker.moves[index]!.type.icon,
                  width: Dimens.kSmallIconSize,
                ),
                Text(attacker.moves[index]!.string),
                Text(
                    ' $damageMin ~ $damageMax (${(100 * damageMin / defence.actual.h).toStringAsFixed(1)}% ~ ${(100 * damageMax / defence.actual.h).toStringAsFixed(1)}%)'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
              child: DamageBarWidget(
                damageMin: damageMin / defence.actual.h,
                damageMax: damageMax / defence.actual.h,
              ),
            ),
          ]);
        }
      }

      return damages;
    }

    final attackDamages = listDamages(
      theory,
      condition.self,
      enemy,
      condition.enemy,
    );
    final defenceDamages = listDamages(
      enemy,
      condition.enemy,
      theory,
      condition.self,
    );

    return TheoryCardWidget(
      key: Key(enemy.key!),
      theory: enemy,
      terastal: enemy.terastal,
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TheoryScreen(
            theoryKey: enemy.key!,
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
            enemy: e,
            condition: condition,
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
