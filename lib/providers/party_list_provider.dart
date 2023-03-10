import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../misc/preferences.dart';
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
    final newParty = party ?? Party(id: _uuid.v4(), name: '新しいパーティ');
    state = [party ?? newParty, ...state];
    return newParty;
  }

  Party clone(Party party) {
    party = party.copyWith(id: _uuid.v4());
    addParty(party: party);
    return party;
  }

  void delete(Party party) {
    state = state.where((e) => e.id != party.id).toList();
  }

  void update(Party party) {
    state = state.map((e) => e.id == party.id ? party : e).toList();
  }

  void reorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      // 後ろに追加する場合、削除を先に行うためインデックスをひとつ前にする
      newIndex -= 1;
    }

    final party = state[oldIndex];
    state = [...state]
      ..removeAt(oldIndex)
      ..insert(newIndex, party);
  }
}

final partyListProvider = StateNotifierProvider<PartyListProvider, List<Party>>(
  (_) => PartyListProvider(),
);
