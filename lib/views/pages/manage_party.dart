import 'package:collection/collection.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/string.dart';
import '../../models/party.dart';
import '../../models/theory.dart';
import '../../providers/providers.dart';
import '../../views/widgets/theory_card.dart';
import '../widgets/modal_select.dart';

class ManagePartyPage extends HookConsumerWidget {
  const ManagePartyPage({super.key});

  Widget _buildPartyCard({
    required List<Theory> theories,
    required Party party,
    required Function(int, Theory) onSelect,
  }) {
    final deleteMode = useState(false);

    Widget _buildTheoryImage(int index) {
      final key = party[index];
      final theory = theories.firstWhereOrNull((e) => e.key == key);

      Widget? child;

      if (theory == null) {
        child = DottedBorder(
          color: Colors.grey,
          child: const SizedBox(
            width: 64,
            height: 64,
          ),
        );
      } else {
        child = Image.asset(
          theory.pokemon.icon,
          width: 64,
        );
      }

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ModalSelectWidget(
          initList: theories,
          child: child,
          itemBuilder: (context, item) => TheoryCard(
            key: Key(item.key!),
            theory: item,
            onTap: () {
              onSelect(index, item);
              Navigator.pop(context);
            },
          ),
          onSort: (target, value) => target.pokemon.string.containKana(value),
        ),
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTheoryImage(0),
                _buildTheoryImage(1),
                _buildTheoryImage(2),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTheoryImage(3),
                _buildTheoryImage(4),
                _buildTheoryImage(5),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theories = ref.watch(theoriesNotifier);
    final parties = ref.watch(partiesNotifier);

    return Scaffold(
      appBar: AppBar(title: const Text('パーティ')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(partiesNotifier.notifier).create();
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var partyIndex = 0; partyIndex < parties.length; partyIndex++)
              _buildPartyCard(
                theories: theories,
                party: parties[partyIndex],
                onSelect: (index, value) {
                  ref.read(partiesNotifier.notifier).update(
                        index: partyIndex,
                        inPartyIndex: index,
                        key: value.key,
                      );
                },
              ),
          ],
        ),
      ),
    );
  }
}
