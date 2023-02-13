import 'package:flutter/material.dart';

import '../../models/theory.dart';
import '../widgets/select_tiles.dart';
import '../widgets/stats_inputs.dart';

class TheoryInputPage extends StatelessWidget {
  const TheoryInputPage({
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
          DetailSelectTile.pokedex(
            pokedex: theory.pokemon,
            onChanged: (value) => onChanged?.call(
              theory.copyWith(pokemon: value),
            ),
          ),
          DetailSelectTile.teraType(
            teratype: theory.teratype,
            terastal: theory.terastal,
            onChanged: (value) => onChanged?.call(
              theory.copyWith(teratype: value),
            ),
            onTerastalChanged: (value) => onChanged?.call(
              theory.copyWith(terastal: value),
            ),
          ),
          TypeSelectTile(
            types: theory.types,
            onChanged: (value) => onChanged?.call(
              theory.copyWith(types: value),
            ),
            onReset: () => onChanged?.call(
              theory.copyWith(types: theory.pokemon.types),
            ),
          ),
          DetailSelectTile.ability(
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
          DetailSelectTile.item(
            item: theory.item,
            onChanged: (value) => onChanged?.call(
              theory.copyWith(item: value),
            ),
          ),
          NatureSelectTile(
            nature: theory.nature,
            onChanged: (value) => onChanged?.call(
              theory.copyWith(nature: value),
            ),
            onTemplateSelected: (nature, effort) => onChanged?.call(
              theory.copyWith(nature: nature, effort: effort),
            ),
          ),
          StatsInputs(
            theory: theory,
            onChanged: (value) => onChanged?.call(value),
          ),
          for (var i = 0; i < 4; i++)
            DetailSelectTile.move(
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
          )
        ],
      ),
    );
  }
}
