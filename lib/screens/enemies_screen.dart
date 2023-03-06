import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../extensions/theory.dart';
import '../misc/calculator.dart';
import '../models/condition_model.dart';
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

  List<Widget> listDamages(
    Theory attacker,
    Theory defence,
    Conditions conditions,
    Environment environment,
  ) {
    final damages = <Widget>[];

    for (var index = 0; index < 4; index++) {
      // 攻撃技以外は表示しない
      if (attacker.moves[index].state != null &&
          attacker.moves[index].state!.power != null) {
        final damage = Damage(
          attacker: attacker,
          defence: defence,
          conditions: conditions,
          move: attacker.moves[index],
          environment: environment,
        );
        // 最小乱数のダメージ
        final damageMin = damage.calc(0.85);

        // 最大乱数のダメージ
        final damageMax = damage.calc(1.00);

        // HPに対する割合を計算
        final damageMinPer = damageMin / defence.actual.h;
        final damageMaxPer = damageMax / defence.actual.h;

        damages.addAll([
          Row(
            children: [
              TypeChipWidget(
                type: attacker.moves[index].state!.type,
                text:
                    '${attacker.moves[index].state!.string} $damageMin ~ $damageMax'
                    '(${(100 * damageMinPer).toStringAsFixed(1)}% ~ ${(100 * damageMaxPer).toStringAsFixed(1)}%)',
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

  Widget damageCard({
    required BuildContext context,
    required Theory self,
    required Theory enemy,
    required Conditions conditions,
    required Environment environment,
  }) {
    // ダメージ一覧のウィジェットを生成する
    final attackDamages = listDamages(self, enemy, conditions, environment);
    final defenceDamages =
        listDamages(enemy, self, conditions.swap, environment);

    return TheoryCardWidget(
      key: Key(enemy.id),
      theory: enemy,
      terastal: enemy.terastal,
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TheoryScreen(theoryId: enemy.id, enemy: true),
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
            self: theory,
            enemy: e,
            conditions: condition,
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
