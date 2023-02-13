import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokecalc/extensions/theory.dart';
import 'package:pokecalc/views/widgets/theory_card.dart';

import '../../models/condition.dart';
import '../../models/environment.dart';
import '../../models/theory.dart';
import '../../providers/providers.dart';
import '../widgets/damage_bar.dart';
import 'theory_view.dart';

class DamageResultPage extends ConsumerWidget {
  const DamageResultPage({
    super.key,
    required this.theory,
  });

  final Theory theory;

  Widget damageCard({
    required BuildContext context,
    required Theory enemy,
    required ConditionState condition,
    required Environment environment,
  }) {
    final statsSpans = <TextSpan>[];

    for (var index = 0; index < 6; index++) {
      statsSpans.add(
        TextSpan(
          text: '${enemy.actual[index]}(${enemy.effort[index]})',
          style: TextStyle(
            color: enemy.nature.buff[index] > 0
                ? Colors.red
                : enemy.nature.buff[index] < 0
                    ? Colors.blue
                    : Colors.grey,
          ),
        ),
      );
      if (index < 5) {
        statsSpans.add(
          const TextSpan(
            text: '-',
            style: TextStyle(color: Colors.grey),
          ),
        );
      }
    }

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
                  width: 20,
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

    return TheoryCard(
      key: Key(enemy.key!),
      theory: enemy,
      terastal: enemy.terastal,
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TheoryViewPage(
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
    final enemies = ref.watch(enemiesNotifier);
    final condition = ref.watch(conditionNofifier);
    final environment = ref.watch(environmentNofifier);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final enemy = ref.read(enemiesNotifier.notifier).create();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TheoryViewPage(
                theoryKey: enemy.key!,
                enemy: true,
              ),
            ),
          );
        },
        child: const Icon(Icons.calculate),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: enemies
              .map(
                (e) => damageCard(
                  context: context,
                  enemy: e,
                  condition: condition,
                  environment: environment,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
