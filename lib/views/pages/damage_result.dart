import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokecalc/extensions/theory.dart';

import '../../models/theory.dart';
import '../../providers/providers.dart';
import '../widgets/damage_bar.dart';
import '../widgets/type_chip.dart';
import 'theory_view.dart';

class DamageResultPage extends ConsumerWidget {
  const DamageResultPage({
    super.key,
    required this.theory,
  });

  final Theory theory;

  Widget damageCard(BuildContext context, Theory enemy) {
    final statsSpans = <TextSpan>[];
    final effortList = enemy.effort.toArray();
    final actualList = enemy.actual.toArray();
    final buffList = enemy.nature.buff.toArray();

    for (var index = 0; index < 6; index++) {
      statsSpans.add(
        TextSpan(
          text: '${actualList[index]}(${effortList[index]})',
          style: TextStyle(
            color: buffList[index] > 0
                ? Colors.red
                : buffList[index] < 0
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

    List<Widget> listDamages(Theory attacker, Theory defence) {
      final damages = <Widget>[];

      for (var index = 0; index < 4; index++) {
        if (attacker.moves[index] != null &&
            attacker.moves[index]!.power != null) {
          final damageMin = attacker.damage(
            move: attacker.moves[index]!,
            enemy: defence,
            rand: 0.85,
          );

          final damageMax = attacker.damage(
            move: attacker.moves[index]!,
            enemy: defence,
            rand: 1.00,
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
            DamageBarWidget(
              damageMin: damageMin / defence.actual.h,
              damageMax: damageMax / defence.actual.h,
            ),
          ]);
        }
      }

      return damages;
    }

    final attackDamages = listDamages(theory, enemy);
    final defenceDamages = listDamages(enemy, theory);

    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TheoryViewPage(
            theoryKey: enemy.key!,
            enemy: true,
          ),
        ),
      ),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(enemy.pokemon.icon, width: 64),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ...enemy.currentTypes
                            .map(
                              (e) => TypeChip(type: e),
                            )
                            .toList(),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          enemy.item.icon,
                          width: 20,
                        ),
                        Text(enemy.item.string),
                      ],
                    ),
                    Text(enemy.ability.string),
                    RichText(
                      text: TextSpan(
                          children: statsSpans,
                          style: const TextStyle(fontSize: 12)),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(),
            const Text('与ダメージ'),
            ...attackDamages,
            const Divider(),
            const Text('被ダメージ'),
            ...defenceDamages,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enemies = ref.watch(enemiesNotifier);

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
                (e) => damageCard(context, e),
              )
              .toList(),
        ),
      ),
    );
  }
}
