import 'package:collection/collection.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/party.dart';
import '../../models/theory.dart';
import '../../providers/providers.dart';
import '../../views/pages/theory_view.dart';
import '../../views/widgets/modals.dart';
import '../../views/widgets/theory_card.dart';

List<Theory> _getPartyMember(List<Theory> theories, Party party) {
  final member = <Theory>[];

  for (final theoryKey in party.member) {
    final theory = theories.firstWhereOrNull((e) => e.key == theoryKey);

    if (theory != null) member.add(theory);
  }

  return member;
}

class SelectPartyMember extends HookConsumerWidget {
  const SelectPartyMember({
    super.key,
    required this.party,
    this.onChanged,
  });

  final Party party;
  final ValueChanged<Party>? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theories = ref.read(theoriesNotifier);
    final member = useState(_getPartyMember(theories, party));

    member.addListener(() {
      onChanged?.call(
        party.copyWith(
          member: member.value.map((e) => e.key).toList(),
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('ポケモンを選択'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: theories
              .map(
                (e) => TheoryCard(
                  theory: e,
                  onTap: () {
                    if (member.value.contains(e)) {
                      member.value =
                          member.value.where((theory) => theory != e).toList();
                    } else {
                      if (member.value.length < 6) {
                        member.value = [...member.value, e];
                      }
                    }
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class PartyCard extends ConsumerWidget {
  const PartyCard({
    super.key,
    required this.party,
  });

  final Party party;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> children = [];
    final theories = ref.read(theoriesNotifier);
    final member = _getPartyMember(theories, party);

    for (var theory in member) {
      children.add(
        InkWell(
          child: Image.asset(
            theory.pokemon.icon,
            width: 64,
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TheoryViewPage(theoryKey: theory.key!),
            ),
          ),
        ),
      );
    }

    for (var i = children.length; i < 6; i++) {
      // strokeの分、widthとheightを引く(64 - 4 = 60)
      children.add(
        DottedBorder(
          child: const SizedBox(
            width: 60,
            height: 60,
          ),
        ),
      );
    }

    return Card(
      child: Column(
        children: [
          Row(
            children: [
              Text(party.name),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    showFullHeightModalSheet(
                      context: context,
                      builder: (context) => SelectPartyMember(
                        party: party,
                        onChanged: (value) =>
                            ref.read(partiesNotifier.notifier).update(value),
                      ),
                    );
                  },
                  icon: const Icon(Icons.edit)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: children.getRange(0, 3).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: children.getRange(3, 6).toList(),
          ),
        ],
      ),
    );
  }
}

class ManagePartiesPage extends ConsumerWidget {
  const ManagePartiesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parties = ref.watch(partiesNotifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('パーティ'),
        actions: [
          IconButton(
            onPressed: () {
              final party = ref.read(partiesNotifier.notifier).addParty();
              showFullHeightModalSheet(
                context: context,
                builder: (context) => SelectPartyMember(
                  party: party,
                  onChanged: (value) =>
                      ref.read(partiesNotifier.notifier).update(value),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: parties.map((e) => PartyCard(party: e)).toList(),
        ),
      ),
    );
  }
}
