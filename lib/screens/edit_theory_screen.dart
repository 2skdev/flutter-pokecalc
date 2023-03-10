import 'package:flutter/material.dart';

import '../../models/theory_model.dart';
import '../extensions/iterable.dart';
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
            ability: theory.ability,
            abilities: theory.pokemon.abilities,
            onChanged: (value) => onChanged?.call(
              theory.copyWith(ability: value),
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
              leading: Text('???${i + 1}'),
              move: theory.moves[i],
              onChanged: (value) {
                onChanged?.call(
                  theory.copyWith(
                      moves: theory.moves.update(i, value).toList()),
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
                hintText: '??????',
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
