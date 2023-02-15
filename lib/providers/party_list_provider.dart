import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../models/party_model.dart';

const _uuid = Uuid();

class PartyListProvider extends StateNotifier<List<Party>> {
  PartyListProvider() : super([]);

  Party addParty({Party? party}) {
    final newParty = party ?? Party(id: _uuid.v4());
    state = [...state, party ?? newParty];
    return newParty;
  }

  void delete(Party party) {
    state = state.where((e) => e.id != party.id).toList();
  }

  void update(Party party) {
    state = state.map((e) => e.id == party.id ? party : e).toList();
  }
}

final partyListProvider = StateNotifierProvider<PartyListProvider, List<Party>>(
  (_) => PartyListProvider(),
);
