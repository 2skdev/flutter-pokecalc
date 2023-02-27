import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokecalc/models/theory_model.dart';
import 'package:pokecalc/screens/edit_party_screen.dart';
import 'package:pokecalc/screens/theory_screen.dart';

import '../../providers/providers.dart';
import '../models/party_model.dart';
import '../widgets/delete_dismiss_widget.dart';
import '../widgets/party_member_widget.dart';
import '../widgets/space_widget.dart';

class PartyCard extends StatelessWidget {
  const PartyCard({
    super.key,
    required this.party,
    required this.theories,
  });

  final Party party;
  final List<Theory> theories;

  @override
  Widget build(BuildContext context) {
    final member = party.getMember(theories);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                const SpaceWidget(
                  width: 16,
                ),
                Text(
                  party.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EditPartyScreen(partyId: party.id),
                      ),
                    );
                  },
                  icon: const Icon(Icons.edit),
                ),
              ],
            ),
            PartyGridWidget(
              member: member,
              onTap: (index) {
                if (member[index] != null) {
                  // 登録済みの場合、Theoryのページへ遷移
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          TheoryScreen(theoryId: member[index]!.id),
                    ),
                  );
                } else {
                  // 未登録の場合、パーティ編集ページへ遷移
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditPartyScreen(partyId: party.id),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PartiesScreen extends ConsumerWidget {
  const PartiesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parties = ref.watch(partyListProvider);
    final theories = ref.read(theoryListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('パーティ'),
        actions: [
          IconButton(
            onPressed: () {
              final party = ref.read(partyListProvider.notifier).addParty();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditPartyScreen(partyId: party.id),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: parties
              .map(
                (e) => DeleteDismissWidget(
                  key: Key(e.id),
                  child: PartyCard(
                    theories: theories,
                    party: e,
                  ),
                  onDelete: () =>
                      ref.read(partyListProvider.notifier).delete(e),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
