import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../enums/base.dart';
import '../../enums/enums.dart';
import '../../extensions/string.dart';
import '../../models/stats_model.dart';
import '../constants/dimens.dart';
import 'align_list_tile_widget.dart';
import 'modal_widget.dart';
import 'search_list_scaffold_widget.dart';
import 'space_widget.dart';
import 'tile_widget.dart';
import 'type_chip_widget.dart';

/// ListTileで選択肢を一覧表示し、検索して選択可能なウィジェット
///
/// [onSort]がnullの時、TをStringNamedEnumとして絞り込みを行う
class SelectTileWidget<T> extends StatelessWidget {
  const SelectTileWidget({
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

    return AlignListTileWidget(
      leading: leading,
      title: title,
      onTap: () async {
        // Navigator.popの戻り値を取得する
        // 未選択でモーダルを閉じた時はnull
        final T? newValue = await showFullHeightModalSheet(
          context: context,
          builder: (context) => SearchListScaffoldWidget(
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

class TeraTypeSelectWidget extends StatelessWidget {
  const TeraTypeSelectWidget({
    super.key,
    required this.teratype,
    required this.terastal,
    this.onChanged,
    this.onTerastalChanged,
  });

  final Types teratype;
  final bool terastal;
  final ValueChanged<Types>? onChanged;
  final ValueChanged<bool>? onTerastalChanged;

  @override
  Widget build(BuildContext context) {
    return SelectTileWidget<Types>(
      key: key,
      value: teratype,
      list: Types.values,
      onChanged: (value) => onChanged?.call(value),
      leading: const Text('テラスタル'),
      itemBuilder: (context, item) => Row(
        children: [
          Image.asset(item.teraicon, width: 32),
          Text(item.string),
        ],
      ),
      childBuilder: (context) => Row(
        children: [
          Image.asset(teratype.teraicon, width: 32),
          Text(teratype.string),
          const Spacer(),
          Switch(value: terastal, onChanged: onTerastalChanged),
        ],
      ),
    );
  }
}

class AbilitySelectWidget extends StatelessWidget {
  const AbilitySelectWidget({
    super.key,
    required this.ability,
    required this.meta,
    this.abilities = Abilities.values,
    this.onChanged,
    this.onMetaChanged,
  });

  final Abilities ability;
  final int meta;
  final List<Abilities> abilities;
  final ValueChanged<Abilities>? onChanged;
  final ValueChanged<int>? onMetaChanged;

  @override
  Widget build(BuildContext context) {
    Widget? append;

    // abilityの効果の有無を選択するウィジェットを追加する
    if (ability.meta == 1) {
      // 2値で選択するものはSwitchで選択する
      append = Switch(
        value: meta > 0,
        onChanged: (value) => onMetaChanged?.call(value ? 1 : 0),
      );
    } else if (ability.meta > 1) {
      // 1以上を選択するものはDropdownで選択する
      append = DropdownButton(
        value: meta,
        underline: const SizedBox(),
        items: List.generate(
          ability.meta + 1,
          (index) => DropdownMenuItem(
            value: index,
            child: Text(index.toString()),
          ),
        ),
        onChanged: (value) {
          if (value != null) onMetaChanged?.call(value);
        },
      );
    }

    return SelectTileWidget<Abilities>(
      value: ability,
      list: abilities,
      onChanged: (value) => onChanged?.call(value),
      leading: const Text('特性'),
      itemBuilder: (context, item) => Text(item.string),
      childBuilder: (context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(ability.string),
          if (append != null) append,
        ],
      ),
    );
  }
}

class ItemSelectWidget extends StatelessWidget {
  const ItemSelectWidget({
    super.key,
    required this.item,
    this.onChanged,
  });

  final Items item;
  final ValueChanged<Items>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SelectTileWidget<Items>(
      key: key,
      value: item,
      list: Items.values,
      onChanged: (value) => onChanged?.call(value),
      leading: const Text('持ち物'),
      itemBuilder: (context, item) => ItemTileWidget(item: item),
    );
  }
}

class PokedexSelectWidget extends StatelessWidget {
  const PokedexSelectWidget({
    super.key,
    required this.pokedex,
    this.onChanged,
  });

  final Pokedex pokedex;
  final ValueChanged<Pokedex>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SelectTileWidget<Pokedex>(
      key: key,
      value: pokedex,
      list: Pokedex.values,
      onChanged: (value) => onChanged?.call(value),
      itemBuilder: (context, item) => Row(
        children: [
          Image.asset(item.icon, width: Dimens.kLargeIconSize),
          const SpaceWidget(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.string),
              Text(
                item.stats.toString(),
                style: Theme.of(context).textTheme.caption,
              ),
              Row(
                children: item.types
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: TypeChipWidget(type: e),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ],
      ),
      childBuilder: (context) => Row(
        children: [
          Image.asset(pokedex.icon, width: 96),
          const SpaceWidget(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(pokedex.string),
              Text(
                pokedex.stats.toString(),
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MoveSelectWidget extends StatelessWidget {
  const MoveSelectWidget({
    super.key,
    required this.leading,
    required this.move,
    this.onChanged,
  });

  final Widget leading;
  final Moves? move;
  final ValueChanged<Moves>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SelectTileWidget<Moves?>(
      key: key,
      value: move,
      list: Moves.values,
      onChanged: (value) => onChanged?.call(value!),
      leading: leading,
      itemBuilder: (context, item) =>
          item == null ? const SizedBox() : MoveTileWidget(move: item),
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
class NatureSelectWidget extends StatelessWidget {
  const NatureSelectWidget({
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
    return SelectTileWidget<Natures>(
      key: key,
      value: nature,
      list: Natures.values,
      onChanged: (value) => onChanged?.call(value),
      leading: const Text('性格'),
      itemBuilder: (context, item) => NatureTileWidget(nature: item),
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

/// タイプ選択のモーダル
///
/// 元のstateはモーダル表示時のNavigatorを挟むと更新されないため
/// モーダル上の表示をuseStateで状態管理する
///
/// 複数選択可能なUIのため、選択時にはNavigator.popしない
class _TypeSelectModal extends HookWidget {
  const _TypeSelectModal({
    required this.types,
    this.onChanged,
  });

  /// タイプリスト
  final List<Types> types;

  /// タイプ更新通知
  final ValueChanged<List<Types>>? onChanged;

  @override
  Widget build(BuildContext context) {
    // モーダル内の状態
    final state = useState(types);

    // モーダルが更新された時にコールバックで通知する
    state.addListener(() => onChanged?.call(state.value));

    // タイプを設定する
    setType(Types type) {
      // すでに2つ設定されていたら設定しない
      if (state.value.length < 2) {
        state.value = [...state.value, type];
      }
    }

    // タイプをクリアする
    clearType(Types type) {
      state.value = state.value.where((e) => e != type).toList();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('タイプ'),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: Types.values.length,
          itemBuilder: (context, index) => ListTile(
            leading: Checkbox(
              // タイプリストに含む場合、チェックボックスにチェックをつける
              value: state.value.contains(Types.values[index]),
              onChanged: (value) {
                if (value != null) {
                  // チェックボックスの値に応じてリストに加える
                  if (value) {
                    setType(Types.values[index]);
                  } else {
                    clearType(Types.values[index]);
                  }
                }
              },
            ),
            title: Row(
              children: [TypeChipWidget(type: Types.values[index])],
            ),
            onTap: () {
              // ListTileがタップされた時は選択・非選択を切り替える
              if (state.value.contains(Types.values[index])) {
                clearType(Types.values[index]);
              } else {
                setType(Types.values[index]);
              }
            },
          ),
        ),
      ),
    );
  }
}

/// タイプを選択するリストタイルウィジェット
class TypeSelectWidget extends StatelessWidget {
  const TypeSelectWidget({
    super.key,
    required this.types,
    this.onChanged,
    this.onReset,
  });

  /// タイプリスト
  final List<Types> types;

  /// タイプリスト更新通知
  final ValueChanged<List<Types>>? onChanged;

  /// タイプリスト初期化通知
  ///
  /// 通知のみで値の更新は親ウィジェットで管理する
  final Function()? onReset;

  @override
  Widget build(BuildContext context) {
    return AlignListTileWidget(
      leading: const Text('タイプ'),
      title: Row(
        children: types
            .map<Widget>(
              (e) => Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TypeChipWidget(type: e),
              ),
            )
            .toList()
          ..addAll([
            const Spacer(),
            IconButton(
              onPressed: onReset,
              icon: const Icon(Icons.restart_alt_rounded),
            ),
          ]),
      ),
      onTap: () {
        showFullHeightModalSheet(
          context: context,
          builder: (context) => _TypeSelectModal(
            types: types,
            onChanged: onChanged,
          ),
        );
      },
    );
  }
}
