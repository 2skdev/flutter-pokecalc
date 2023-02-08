import 'package:flutter/material.dart';
import 'package:pokecalc/views/widgets/tiles.dart';

import '../../enums/base.dart';
import '../../enums/enums.dart';
import '../../extensions/string.dart';
import '../../models/stats.dart';
import 'leading_sized_box.dart';
import 'modals.dart';
import 'search_list_scaffold.dart';
import 'space.dart';
import 'type_chip.dart';

/// ListTileで選択肢を一覧表示し、検索して選択可能なウィジェット
///
/// [onSort]がnullの時、TをStringNamedEnumとして絞り込みを行う
class SelectTile<T> extends StatelessWidget {
  const SelectTile({
    super.key,
    this.value,
    required this.list,
    this.onChanged,
    this.onSort,
    required this.itemBuilder,
    this.childBuilder,
    this.leading,
  });

  /// Modal非表示時の値
  ///
  /// [childBuilder]がnullの時に、[itemBuilder]で子ウィジェットを生成する時に参照する
  final T? value;

  /// 選択肢のリスト
  final List<T> list;

  /// 値選択通知
  final ValueChanged<T>? onChanged;

  /// リスト絞り込み関数
  final bool Function(T target, String value)? onSort;

  /// 一覧表示のListViewのtitleのビルド関数
  final Widget Function(BuildContext context, T item) itemBuilder;

  /// 子ウィジェットのListViewのtitleのビルド関数
  ///
  /// [childBuilder]がnullの時、[itemBuilder]でビルドする
  final Widget Function(BuildContext context)? childBuilder;

  /// 子ウィジェットのListViewのleading
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    // ListViewのtitle
    Widget title;

    if (childBuilder != null) {
      // childBuilderがnull出ない時、childBuilderでビルドする
      title = childBuilder!(context);
    } else {
      // itemBuilderでビルドする
      title = itemBuilder(context, value as T);
    }

    return ListTile(
      leading: leading == null ? null : LeadingSizedBox(child: leading),
      title: title,
      onTap: () async {
        // Navigator.popの戻り値を取得する
        // 未選択でモーダルを閉じた時はnull
        final T? newValue = await showFullHeightModalSheet(
          context: context,
          builder: (context) => SearchListScaffold(
            initList: list,
            itemBuilder: (context, item) => ListTile(
              title: itemBuilder(context, item),
              onTap: () => Navigator.pop(context, item),
            ),
            onSort: (target, value) {
              if (onSort != null) {
                return onSort!(target, value);
              } else {
                // onSortがnullの時、StringNamedEnumとして絞り込みを行う
                assert(target is StringNamedEnum);
                StringNamedEnum stringNamed = target as StringNamedEnum;
                return stringNamed.string.containKana(value);
              }
            },
          ),
        );

        // nullでないとき、更新通知を行う
        if (newValue != null) {
          onChanged?.call(newValue);
        }
      },
    );
  }
}

extension DetailSelectTile on SelectTile {
  static SelectTile teraType({
    Key? key,
    required Types type,
    ValueChanged<Types>? onChanged,
  }) {
    return SelectTile<Types>(
      key: key,
      value: type,
      list: Types.values,
      onChanged: (value) => onChanged?.call(value),
      leading: const Text('テラスタル'),
      itemBuilder: (context, item) => Row(
        children: [
          Image.asset(item.teraicon, width: 32),
          Text(item.string),
        ],
      ),
    );
  }

  static SelectTile ability({
    Key? key,
    required Abilities ability,
    List<Abilities> abilities = Abilities.values,
    ValueChanged<Abilities>? onChanged,
  }) {
    return SelectTile<Abilities>(
      value: ability,
      list: abilities,
      onChanged: (value) => onChanged?.call(value),
      leading: const Text('特性'),
      itemBuilder: (context, item) => Text(item.string),
    );
  }

  static SelectTile item({
    Key? key,
    required Items item,
    ValueChanged<Items>? onChanged,
  }) {
    return SelectTile<Items>(
      key: key,
      value: item,
      list: Items.values,
      onChanged: (value) => onChanged?.call(value),
      leading: const Text('持ち物'),
      itemBuilder: (context, item) => ItemTile(item: item),
    );
  }

  static SelectTile pokedex({
    Key? key,
    required Pokedex pokedex,
    ValueChanged<Pokedex>? onChanged,
  }) {
    Widget buildItem(Pokedex item, double width) {
      return Row(
        children: [
          Image.asset(
            item.icon,
            width: width,
          ),
          const Space(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.string),
              Text(
                item.stats.toString(),
                // TODO: フォントサイズをテーマにする
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              Row(
                children: item.types
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: TypeChip(type: e),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ],
      );
    }

    return SelectTile<Pokedex>(
      key: key,
      value: pokedex,
      list: Pokedex.values,
      onChanged: (value) => onChanged?.call(value),
      itemBuilder: (context, item) => buildItem(item, 64),
      childBuilder: (context) => buildItem(pokedex, 96),
    );
  }

  static SelectTile move({
    Key? key,
    required Widget leading,
    required Moves? move,
    ValueChanged<Moves>? onChanged,
  }) {
    return SelectTile<Moves?>(
      key: key,
      value: move,
      list: Moves.values,
      onChanged: (value) => onChanged?.call(value!),
      leading: leading,
      itemBuilder: (context, item) =>
          item == null ? const SizedBox() : MoveTile(move: item),
    );
  }
}

/// 育成のテンプレートを管理するクラス
///
/// [nature]と[effort]をテンプレートとする
/// テンプレートの一覧を[list]で持つ
class _TheoryTemplate {
  const _TheoryTemplate(
    this.nature,
    this.effort,
  );

  /// 性格
  final Natures nature;

  /// 努力値
  final Stats effort;

  /// テンプレートのリスト
  static const list = <_TheoryTemplate>[
    _TheoryTemplate(Natures.adamant, Stats(a: 252, s: 252)),
    _TheoryTemplate(Natures.jolly, Stats(a: 252, s: 252)),
    _TheoryTemplate(Natures.modest, Stats(c: 252, s: 252)),
    _TheoryTemplate(Natures.timid, Stats(c: 252, s: 252)),
    _TheoryTemplate(Natures.bold, Stats(h: 252, b: 252)),
    _TheoryTemplate(Natures.impish, Stats(h: 252, b: 252)),
    _TheoryTemplate(Natures.calm, Stats(h: 252, d: 252)),
    _TheoryTemplate(Natures.careful, Stats(h: 252, d: 252)),
    _TheoryTemplate(Natures.adamant, Stats(h: 252, a: 252)),
    _TheoryTemplate(Natures.modest, Stats(h: 252, c: 252)),
    _TheoryTemplate(Natures.jolly, Stats(h: 252, s: 252)),
    _TheoryTemplate(Natures.timid, Stats(h: 252, s: 252)),
  ];

  /// テンプレート選択のモーダルを表示する
  ///
  /// 選択時にモーダルを閉じて、選択された値を返す
  /// 未選択でモーダルを閉じた時はnullを返す
  static Future<_TheoryTemplate?> showTheoryTemplate(BuildContext context) {
    return showFullHeightModalSheet<_TheoryTemplate>(
      context: context,
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text('育成テンプレート'),
        ),
        body: SingleChildScrollView(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (context, index) {
              var text = '';

              list[index].effort.forEach((i, value) {
                if (value > 0) {
                  text += Stats.initials[i];
                }
              });

              text += list[index].nature.string;

              return ListTile(
                title: Text(text),
                onTap: () => Navigator.pop(context, list[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}

/// 性格を選択するリストタイルウィジェット
///
/// [onChanged]はリストから性格を選択した時に通知する
/// [onTemplateSelected]は育成テンプレートから選択した時に
/// 性格と努力値をまとめて通知する
/// 育成テンプレート選択時には[onChanged]の通知は行わない
class NatureSelectTile extends StatelessWidget {
  const NatureSelectTile({
    super.key,
    required this.nature,
    this.onChanged,
    this.onTemplateSelected,
  });

  /// 性格
  final Natures nature;

  /// 性格選択通知
  final ValueChanged<Natures>? onChanged;

  /// 育成テンプレート選択通知
  final Function(Natures nature, Stats effort)? onTemplateSelected;

  @override
  Widget build(BuildContext context) {
    return SelectTile<Natures>(
      key: key,
      value: nature,
      list: Natures.values,
      onChanged: (value) => onChanged?.call(value),
      leading: const Text('性格'),
      itemBuilder: (context, item) => NatureTile(nature: item),
      childBuilder: (context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(nature.string),
          IconButton(
            onPressed: () async {
              // Navigator.popの戻り値を取得する
              // 未選択でモーダルを閉じた時はnull
              final _TheoryTemplate? newValue =
                  await _TheoryTemplate.showTheoryTemplate(context);
              // nullでないとき、更新通知を行う
              if (newValue != null) {
                onTemplateSelected?.call(newValue.nature, newValue.effort);
              }
            },
            icon: const Icon(Icons.tune),
          ),
        ],
      ),
    );
  }
}
