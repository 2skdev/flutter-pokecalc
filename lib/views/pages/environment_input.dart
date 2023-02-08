import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants/size.dart';
import '../../enums/enums.dart';
import '../../models/condition.dart';
import '../../providers/providers.dart';
import '../widgets/rank_input.dart';

class EnvironmentInputPage extends ConsumerWidget {
  const EnvironmentInputPage({super.key});

  List<Widget> _buildCondition({
    required Condition condition,
    ValueChanged<Condition>? onChanged,
  }) {
    return [
      ListTile(
        leading: const Text('急所'),
        minLeadingWidth: kMinLeadingWidth,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Switch(
              value: condition.critical,
              onChanged: (value) => onChanged?.call(
                condition.copyWith(critical: value),
              ),
            ),
          ],
        ),
      ),
      ListTile(
        leading: const Text('状態異常'),
        minLeadingWidth: kMinLeadingWidth,
        title: DropdownButton(
          value: condition.ailment,
          underline: const SizedBox(),
          isExpanded: true,
          items: Ailments.values
              .map((e) => DropdownMenuItem(value: e, child: Text(e.string)))
              .toList(),
          onChanged: (value) {
            if (value != null) {
              onChanged?.call(condition.copyWith(ailment: value));
            }
          },
        ),
      ),
      ListTile(
        leading: const Text('壁'),
        minLeadingWidth: kMinLeadingWidth,
        title: DropdownButton(
          value: condition.shield,
          underline: const SizedBox(),
          isExpanded: true,
          items: Shields.values
              .map((e) => DropdownMenuItem(value: e, child: Text(e.string)))
              .toList(),
          onChanged: (value) {
            if (value != null) {
              onChanged?.call(condition.copyWith(shield: value));
            }
          },
        ),
      ),
      ...RankInput.buildListTiles(
        rank: condition.rank,
        onChanged: (value) => onChanged?.call(condition.copyWith(rank: value)),
      )
    ];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final environment = ref.watch(environmentNofifier);
    final condition = ref.watch(conditionNofifier);

    return Scaffold(
      appBar: AppBar(title: const Text('環境')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Text('天候'),
              minLeadingWidth: kMinLeadingWidth,
              title: DropdownButton(
                value: environment.weather,
                underline: const SizedBox(),
                isExpanded: true,
                items: Weathers.values
                    .map((e) =>
                        DropdownMenuItem(value: e, child: Text(e.string)))
                    .toList(),
                onChanged: (value) {
                  ref.read(environmentNofifier.notifier).setState(
                        environment.copyWith(weather: value as Weathers),
                      );
                },
              ),
            ),
            ListTile(
              leading: const Text('フィールド'),
              minLeadingWidth: kMinLeadingWidth,
              title: DropdownButton(
                value: environment.field,
                underline: const SizedBox(),
                isExpanded: true,
                items: Fields.values
                    .map((e) =>
                        DropdownMenuItem(value: e, child: Text(e.string)))
                    .toList(),
                onChanged: (value) {
                  ref.read(environmentNofifier.notifier).setState(
                        environment.copyWith(field: value as Fields),
                      );
                },
              ),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text('自分'),
            ),
            ..._buildCondition(
              condition: condition.self,
              onChanged: (value) =>
                  ref.read(conditionNofifier.notifier).setState(self: value),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text('相手'),
            ),
            ..._buildCondition(
              condition: condition.enemy,
              onChanged: (value) =>
                  ref.read(conditionNofifier.notifier).setState(enemy: value),
            ),
          ],
        ),
      ),
    );
  }
}
