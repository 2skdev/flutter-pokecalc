import 'package:flutter/material.dart';

import '../../models/theory_model.dart';
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
            ability: theory.ability,
            meta: theory.abilityMeta,
            abilities: theory.pokemon.abilities,
            onChanged: (value) => onChanged?.call(
              theory.copyWith(ability: value),
            ),
            onMetaChanged: (value) => onChanged?.call(
              theory.copyWith(abilityMeta: value),
            ),
          ),
          ItemSelectWidget(
            item: theory.item,
            onChanged: (value) => onChanged?.call(
              theory.copyWith(item: value),
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
              move: theory.moves[i],
              onChanged: (value) {
                var moves = [...theory.moves];
                moves[i] = value;
                onChanged?.call(
                  theory.copyWith(moves: moves),
                );
              },
            ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              minLines: 4,
              maxLines: 4,
              decoration: InputDecoration(
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
