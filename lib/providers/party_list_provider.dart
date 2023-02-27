import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokecalc/misc/preferences.dart';
import 'package:uuid/uuid.dart';

import '../models/party_model.dart';

const _uuid = Uuid();

class PartyListProvider extends StateNotifier<List<Party>> {
  PartyListProvider() : super([]);

  Future init() async {
    final list = await Preference.getParties();

    if (list != null) {
      final initState = <Party>[];
      for (var e in list) {
        initState.add(e);
      }
      state = initState;
    }

    addListener((state) async {
      await Preference.saveParties(state);
    });
  }

  Party addParty({Party? party}) {
    final newParty = party ?? Party(id: _uuid.v4());
    state = [party ?? newParty, ...state];
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
