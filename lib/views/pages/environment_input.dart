import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants/size.dart';
import '../../enums/enums.dart';
import '../../providers/providers.dart';

class EnvironmentInputPage extends ConsumerWidget {
  const EnvironmentInputPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final environment = ref.watch(environmentNofifier);
    final condition = ref.watch(conditionNofifier);

    return Scaffold(
      appBar: AppBar(title: const Text('環境')),
      body: Column(
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
                  .map((e) => DropdownMenuItem(value: e, child: Text(e.string)))
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
                  .map((e) => DropdownMenuItem(value: e, child: Text(e.string)))
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
          ListTile(
            leading: const Text('急所'),
            minLeadingWidth: kMinLeadingWidth,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Switch(
                  value: false,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Text('状態異常'),
            minLeadingWidth: kMinLeadingWidth,
            title: DropdownButton(
              value: condition.self.ailment,
              underline: const SizedBox(),
              isExpanded: true,
              items: Ailments.values
                  .map((e) => DropdownMenuItem(value: e, child: Text(e.string)))
                  .toList(),
              onChanged: (value) {
                ref.read(conditionNofifier.notifier).setState(
                      self: condition.self.copyWith(ailment: value as Ailments),
                    );
              },
            ),
          ),
          ListTile(
            leading: const Text('壁'),
            minLeadingWidth: kMinLeadingWidth,
            title: DropdownButton(
              value: condition.self.shield,
              underline: const SizedBox(),
              isExpanded: true,
              items: Shields.values
                  .map((e) => DropdownMenuItem(value: e, child: Text(e.string)))
                  .toList(),
              onChanged: (value) {
                ref.read(conditionNofifier.notifier).setState(
                      self: condition.self.copyWith(shield: value as Shields),
                    );
              },
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text('相手'),
          ),
        ],
      ),
    );
  }
}
