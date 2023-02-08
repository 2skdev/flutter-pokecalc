import 'package:flutter/material.dart';

import '../../models/theory.dart';
import '../widgets/select_tiles.dart';
import '../widgets/stats_input_list_tile.dart';

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
            type: theory.teratype,
            onChanged: (value) => onChanged?.call(
              theory.copyWith(teratype: value),
            ),
          ),
          DetailSelectTile.ability(
            ability: theory.ability,
            abilities: theory.pokemon.abilities,
            onChanged: (value) => onChanged?.call(
              theory.copyWith(ability: value),
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
          ...StatsInputListTile.tilesFromTheory(
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
