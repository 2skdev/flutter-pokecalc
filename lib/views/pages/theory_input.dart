import 'package:flutter/material.dart';

import '../../enums/enums.dart';
import '../../extensions/string.dart';
import '../../models/stats.dart';
import '../../models/theory.dart';
import '../widgets/modal_select.dart';
import '../widgets/row_tile.dart';
import '../widgets/space.dart';
import '../widgets/stats_input_list_tile.dart';
import '../widgets/tiles.dart';
import '../widgets/type_chip.dart';

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
          ModalSelectWidget(
            initList: Pokedex.values,
            onSort: (target, value) => target.string.containKana(value),
            itemBuilder: (context, item) => ListTile(
              title: Row(
                children: [
                  Image.asset(item.icon, width: 64),
                  Text(item.string),
                ],
              ),
              subtitle: Text(item.stats.toString()),
              onTap: () {
                onChanged?.call(theory.copyWith(pokemon: item));
                Navigator.pop(context);
              },
            ),
            child: ListTile(
              title: Row(
                children: [
                  Image.asset(theory.pokemon.icon, width: 96),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(theory.pokemon.string),
                      Row(
                        children: [
                          for (final type in theory.pokemon.types)
                            Row(
                              children: [
                                TypeChip(type: type),
                                const Space(width: 5),
                              ],
                            )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ModalSelectWidget(
            initList: Types.values,
            onSort: (target, value) => target.string.containKana(value),
            itemBuilder: (context, item) => RowTile(
              child: TypeChip(type: item),
              onTap: () {
                onChanged?.call(theory.copyWith(teratype: item));
                Navigator.pop(context);
              },
            ),
            child: RowTile(
              leading: const Text('テラスタル'),
              child: TypeChip(type: theory.teratype),
            ),
          ),
          ModalSelectWidget(
            initList: theory.pokemon.abilities,
            onSort: (target, value) => target.string.containKana(value),
            itemBuilder: (context, item) => RowTile(
              child: Text(item.string),
              onTap: () {
                onChanged?.call(theory.copyWith(ability: item));
                Navigator.pop(context);
              },
            ),
            child: RowTile(
              leading: const Text('特性'),
              child: Text(theory.ability.string),
            ),
          ),
          ModalSelectWidget(
            initList: Items.values,
            onSort: (target, value) => target.string.containKana(value),
            itemBuilder: (context, item) => RowTile(
              child: ItemTile(item: item),
              onTap: () {
                onChanged?.call(theory.copyWith(item: item));
                Navigator.pop(context);
              },
            ),
            child: RowTile(
              leading: const Text('持ち物'),
              child: ItemTile(item: theory.item),
            ),
          ),
          ModalSelectWidget(
            initList: Natures.values,
            onSort: (target, value) => target.string.containKana(value),
            itemBuilder: (context, item) => RowTile(
              child: NatureTile(nature: item),
              onTap: () {
                onChanged?.call(theory.copyWith(nature: item));
                Navigator.pop(context);
              },
            ),
            child: ListTile(
              leading: const Text('性格'),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(theory.nature.string),
                  ModalSelectWidget(
                    initList: const <Map<Natures, Stats>>[
                      {
                        Natures.adamant:
                            Stats(h: 0, a: 252, b: 0, c: 0, d: 0, s: 252)
                      },
                      {
                        Natures.jolly:
                            Stats(h: 0, a: 252, b: 0, c: 0, d: 0, s: 252)
                      },
                      {
                        Natures.modest:
                            Stats(h: 0, a: 0, b: 0, c: 252, d: 0, s: 252)
                      },
                      {
                        Natures.timid:
                            Stats(h: 0, a: 0, b: 0, c: 252, d: 0, s: 252)
                      },
                      {
                        Natures.bold:
                            Stats(h: 252, a: 0, b: 252, c: 0, d: 0, s: 0)
                      },
                      {
                        Natures.impish:
                            Stats(h: 252, a: 0, b: 252, c: 0, d: 0, s: 0)
                      },
                      {
                        Natures.calm:
                            Stats(h: 252, a: 0, b: 0, c: 0, d: 252, s: 0)
                      },
                      {
                        Natures.careful:
                            Stats(h: 252, a: 0, b: 0, c: 0, d: 252, s: 0)
                      },
                      {
                        Natures.adamant:
                            Stats(h: 252, a: 252, b: 0, c: 0, d: 0, s: 0)
                      },
                      {
                        Natures.modest:
                            Stats(h: 252, a: 0, b: 0, c: 252, d: 0, s: 0)
                      },
                      {
                        Natures.jolly:
                            Stats(h: 252, a: 0, b: 0, c: 0, d: 0, s: 252)
                      },
                      {
                        Natures.timid:
                            Stats(h: 252, a: 0, b: 0, c: 0, d: 0, s: 252)
                      },
                    ],
                    onSort: (target, value) =>
                        target.keys.first.string.containKana(value),
                    itemBuilder: (context, item) {
                      var text = '';
                      final statsList = item.values.first.toArray();
                      for (var i = 0; i < 6; i++) {
                        if (statsList[i] > 0) {
                          text += ['H', 'A', 'B', 'C', 'D', 'S'][i];
                        }
                      }
                      text += item.keys.first.string;

                      return RowTile(
                        child: Text(text),
                        onTap: () {
                          onChanged?.call(
                            theory.copyWith(
                              nature: item.keys.first,
                              effort: item.values.first,
                            ),
                          );
                          Navigator.pop(context);
                        },
                      );
                    },
                    child: const Icon(Icons.tune),
                  ),
                ],
              ),
            ),
          ),
          ...StatsInputListTile.tilesFromTheory(
            theory: theory,
            onChanged: (value) => onChanged?.call(value),
          ),
          for (var i = 0; i < 4; i++)
            ModalSelectWidget(
              initList: Moves.values,
              onSort: (target, value) => target.string.containKana(value),
              itemBuilder: (context, item) => ListTile(
                title: MoveTile(move: item),
                onTap: () {
                  final moves = [...theory.moves];
                  moves[i] = item;
                  onChanged?.call(theory.copyWith(moves: moves));
                  Navigator.pop(context);
                },
              ),
              child: RowTile(
                leading: Text('技${i + 1}'),
                child: (theory.moves[i] != null)
                    ? MoveTile(move: theory.moves[i]!)
                    : null,
              ),
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
