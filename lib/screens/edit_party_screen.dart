import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants/dimens.dart';
import '../enums/types.dart';
import '../extensions/iterable.dart';
import '../models/theory_model.dart';
import '../providers/providers.dart';
import '../widgets/grid_moves_widget.dart';
import '../widgets/hook_textfield_widget.dart';
import '../widgets/modal_widget.dart';
import '../widgets/party_member_widget.dart';
import '../widgets/theory_card_widget.dart';
import '../widgets/type_icon_widget.dart';

class TypeEfficacyWidget extends StatelessWidget {
  const TypeEfficacyWidget({
    super.key,
    required this.member,
  });

  final List<Theory?> member;

  Widget typeEfficacyIcon(Types target, Theory theory) {
    var efficacy = 1.0;
    for (final type in theory.pokemon.types) {
      efficacy = efficacy * target.efficacy(type);
    }

    if (efficacy == 0.0) {
      return const Icon(
        Icons.star,
        color: Colors.red,
        size: Dimens.kSmallIconSize,
      );
    } else if (efficacy >= 4.0) {
      return Transform.rotate(
        angle: 90 * pi / 180,
        child: const Icon(
          Icons.keyboard_double_arrow_right,
          color: Colors.blue,
          size: Dimens.kSmallIconSize,
        ),
      );
    } else if (efficacy >= 2.0) {
      return Transform.rotate(
        angle: 90 * pi / 180,
        child: const Icon(
          Icons.keyboard_arrow_right,
          color: Colors.blue,
          size: Dimens.kSmallIconSize,
        ),
      );
    } else if (efficacy <= 0.25) {
      return Transform.rotate(
        angle: -90 * pi / 180,
        child: const Icon(
          Icons.keyboard_double_arrow_right,
          color: Colors.red,
          size: Dimens.kSmallIconSize,
        ),
      );
    } else if (efficacy <= 0.5) {
      return Transform.rotate(
        angle: -90 * pi / 180,
        child: const Icon(
          Icons.keyboard_arrow_right,
          color: Colors.red,
          size: Dimens.kSmallIconSize,
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Table(
        border: TableBorder.all(color: Theme.of(context).dividerColor),
        children: [
          TableRow(
            children: [
              const SizedBox(),
              ...member
                  .map(
                    (e) => e == null
                        ? const SizedBox()
                        : Image.asset(e.pokemon.icon),
                  )
                  .toList(),
            ],
          ),
          ...Types.values
              .map(
                (type) => TableRow(
                  children: [
                    TableCell(
                      child: SizedBox(
                        height: Dimens.kSmallIconSize,
                        width: Dimens.kSmallIconSize,
                        child: TypeIconWidget(type: type),
                      ),
                    ),
                    ...member
                        .map(
                          (e) => e == null
                              ? const SizedBox()
                              : TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: typeEfficacyIcon(type, e),
                                ),
                        )
                        .toList(),
                  ],
                ),
              )
              .toList()
        ],
      ),
    );
  }
}

class SelectMemberWidget extends ConsumerWidget {
  const SelectMemberWidget({
    super.key,
    required this.member,
    required this.index,
  });

  final List<Theory?> member;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theories = ref.read(theoryListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('?????????????????????'),
        actions: [
          // ?????????????????????????????????????????????????????????????????????????????????
          if (member[index] != null)
            TextButton(
              onPressed: () {
                // ???????????????????????????????????????????????????????????????
                Navigator.pop(context, member.update(index, null).toList());
              },
              child: const Text('?????????'),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: theories
              .map(
                (e) => TheoryCardWidget(
                  theory: e,
                  children: [
                    const Divider(),
                    GridMovesWidget(moves: e.moves),
                  ],
                  onTap: () {
                    final searchIndex = member.firstWhereIndexOrNull(
                      (element) => element == e,
                    );
                    if (searchIndex == null) {
                      // ????????????????????????
                      Navigator.pop(context, member.update(index, e).toList());
                    } else if (searchIndex == index) {
                      // ???????????????????????????????????????????????????????????????
                      Navigator.pop(
                          context, member.update(searchIndex, null).toList());
                    } else {
                      // ?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
                      Navigator.pop(
                          context,
                          member
                              .update(searchIndex, null)
                              .update(index, e)
                              .toList());
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

class EditPartyScreen extends ConsumerWidget {
  const EditPartyScreen({
    super.key,
    required this.partyId,
  });

  final String partyId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final party =
        ref.watch(partyListProvider).firstWhereOrNull((e) => e.id == partyId);

    // ??????????????????watch???null????????????????????????????????????????????????
    if (party == null) {
      return const Scaffold();
    }

    final theories = ref.read(theoryListProvider);
    final member = party.getMember(theories);

    return Scaffold(
      appBar: AppBar(
        title: const Text('?????????????????????'),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_horiz),
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: () {
                  // ??????
                  ref.read(partyListProvider.notifier).clone(party);
                  // ??????????????????
                  Navigator.pop(context);
                },
                child: const Text('??????'),
              ),
              PopupMenuItem(
                textStyle: const TextStyle(color: Colors.red),
                onTap: () {
                  // ??????
                  ref.read(partyListProvider.notifier).delete(party);
                  // ??????????????????
                  Navigator.pop(context);
                },
                child: const Text('??????'),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HookTextFieldWidget(
              initialValue: party.name,
              onChanged: (value) {
                ref
                    .read(partyListProvider.notifier)
                    .update(party.copyWith(name: value));
              },
              decoration: const InputDecoration(labelText: '???????????????'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 16),
              child: Text(
                '??????????????????',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            PartyGridWidget(
              member: member,
              onTap: (index) async {
                final List<Theory?>? result = await showFullHeightModalSheet(
                  context: context,
                  builder: (context) => SelectMemberWidget(
                    member: member,
                    index: index,
                  ),
                );
                if (result != null) {
                  // Key????????????Party?????????
                  ref.read(partyListProvider.notifier).update(
                        party.copyWith(
                          member: result.map((e) => e?.id).toList(),
                        ),
                      );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 16),
              child: Text(
                '???????????????',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            TypeEfficacyWidget(
              member: member,
            ),
          ],
        ),
      ),
    );
  }
}
