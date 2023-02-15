import 'package:collection/collection.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/party_model.dart';
import '../../models/theory_model.dart';
import '../../providers/providers.dart';
import '../constants/dimens.dart';
import '../widgets/modal_widget.dart';
import '../widgets/theory_card_widget.dart';
import 'theory_screen.dart';

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
    final theories = ref.read(theoryListProvider);
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
                (e) => TheoryCardWidget(
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
    final theories = ref.read(theoryListProvider);
    final member = _getPartyMember(theories, party);

    for (var theory in member) {
      children.add(
        InkWell(
          child: Image.asset(
            theory.pokemon.icon,
            width: Dimens.kLargeIconSize,
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TheoryScreen(theoryKey: theory.key!),
            ),
          ),
        ),
      );
    }

    for (var i = children.length; i < 6; i++) {
      // strokeの分、widthとheightを引く(-4)
      children.add(
        DottedBorder(
          child: const SizedBox(
            width: Dimens.kLargeIconSize - 4,
            height: Dimens.kLargeIconSize - 4,
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
                            ref.read(partyListProvider.notifier).update(value),
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

class PartiesScreen extends ConsumerWidget {
  const PartiesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parties = ref.watch(partyListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('パーティ'),
        actions: [
          IconButton(
            onPressed: () {
              final party = ref.read(partyListProvider.notifier).addParty();
              showFullHeightModalSheet(
                context: context,
                builder: (context) => SelectPartyMember(
                  party: party,
                  onChanged: (value) =>
                      ref.read(partyListProvider.notifier).update(value),
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
