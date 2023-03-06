import 'package:flutter/material.dart';

import '../../models/theory_model.dart';
import '../widgets/hook_textfield_widget.dart';
import '../widgets/input_stats_widget.dart';
import '../widgets/select_tile_widget.dart';

class EditTheoryScreen extends StatelessWidget {
  const EditTheoryScreen({
    super.key,
    required this.theory,
    this.onChanged,
  });

  final Theory theory;
  final Function(Theory value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PokedexSelectWidget(
            pokedex: theory.pokemon,
            onChanged: (value) => onChanged?.call(
              theory.copyWith(pokemon: value),
            ),
          ),
          TeraTypeSelectWidget(
            teratype: theory.teratype,
            terastal: theory.terastal,
            onChanged: (value) => onChanged?.call(
              theory.copyWith(teratype: value),
            ),
            onTerastalChanged: (value) => onChanged?.call(
              theory.copyWith(terastal: value),
            ),
          ),
          TypeSelectWidget(
            types: theory.types,
            onChanged: (value) => onChanged?.call(
              theory.copyWith(types: value),
            ),
            onReset: () => onChanged?.call(
              theory.copyWith(types: theory.pokemon.types),
            ),
          ),
          AbilitySelectWidget(
            ability: theory.ability.state,
            meta: theory.ability.meta,
            abilities: theory.pokemon.abilities,
            onChanged: (value) => onChanged?.call(
              theory.copyWith(ability: theory.ability.copyWith(state: value)),
            ),
            onMetaChanged: (value) => onChanged?.call(
              theory.copyWith(ability: theory.ability.copyWith(meta: value)),
            ),
          ),
          ItemSelectWidget(
            item: theory.item.state,
            onChanged: (value) => onChanged?.call(
              theory.copyWith(item: theory.item.copyWith(state: value)),
            ),
          ),
          NatureSelectWidget(
            nature: theory.nature,
            onChanged: (value) => onChanged?.call(
              theory.copyWith(nature: value),
            ),
            onTemplateSelected: (nature, effort) => onChanged?.call(
              theory.copyWith(nature: nature, effort: effort),
            ),
          ),
          InputStatsWidget(
            theory: theory,
            onChanged: (value) => onChanged?.call(value),
          ),
          for (var i = 0; i < 4; i++)
            MoveSelectWidget(
              leading: Text('技${i + 1}'),
              move: theory.moves[i].state,
              onChanged: (value) {
                var moves = [...theory.moves];
                moves[i] = moves[i].copyWith(state: value);
                onChanged?.call(
                  theory.copyWith(moves: moves),
                );
              },
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: HookTextFieldWidget(
              initialValue: theory.memo,
              onChanged: (value) =>
                  onChanged?.call(theory.copyWith(memo: value)),
              minLines: 4,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: 'メモ',
                filled: true,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
