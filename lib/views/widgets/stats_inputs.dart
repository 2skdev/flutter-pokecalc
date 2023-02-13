import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import '../../extensions/theory.dart';
import '../../models/stats.dart';
import '../../models/theory.dart';
import '../misc/colors.dart';
import 'leading_sized_box.dart';

/// 数字のみの範囲指定の入力フォーマッタ
///
/// [min] ~ [max]で制限する
/// 無効になったときは[min]の値にする
/// 空欄は許容するが、親ウィジェットで文字列→数値に変換する時に0になる
class NumericRangeFormatter extends TextInputFormatter {
  NumericRangeFormatter({this.min, this.max});

  /// 下限値
  final int? min;

  /// 上限値
  final int? max;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text == '') {
      // 新しい値が空欄の場合はそのまま
      return newValue;
    } else if (min != null && int.parse(newValue.text) < min!) {
      // 新しい値が下限値を下回る場合はminにする
      final text = min.toString();
      return TextEditingValue(
        text: text,
        selection: TextSelection.collapsed(offset: text.length),
      );
    } else if (max != null && int.parse(newValue.text) > max!) {
      // 新しい値が上限値を上回る場合はmaxにする
      final text = max.toString();
      return TextEditingValue(
        text: text,
        selection: TextSelection.collapsed(offset: text.length),
      );
    } else {
      // 現在値が0で末尾に文字を挿入する場合は0を置き換える
      if (oldValue.text == '0' && newValue.text[0] == '0') {
        final text = newValue.text.substring(1);
        return TextEditingValue(
          text: text,
          selection: TextSelection.collapsed(offset: text.length),
        );
      }
      return newValue;
    }
  }
}

/// ステータス入力のテキストフィールド
///
/// 数値のみを入力として受け付ける
/// inputFormattersで数字のみ、[min] ~ [max]のみで制限する
///
/// [node]、FocusNodeを内部で持つ
/// [controller]、TextEditingControllerを内部で持つ
///
/// 親ウィジェット(StatsInputs)のKeyboardActionsItemで参照するため
/// [node]と[controller]をpublicにする
class StatsTextField extends HookWidget {
  StatsTextField({
    super.key,
    required this.value,
    this.min,
    this.max,
    this.decoration,
    this.onChanged,
  });

  /// フォーカスのノード
  final FocusNode node = useFocusNode();

  /// TextFieldのコントローラ
  final TextEditingController controller = useTextEditingController();

  /// 値
  final int value;

  /// 下限値
  final int? min;

  /// 上限値
  final int? max;

  /// TextFieldのデコレーション
  final InputDecoration? decoration;

  /// 値の変更通知
  final ValueChanged<int>? onChanged;

  @override
  Widget build(BuildContext context) {
    // コントローラに初期値をアサインする
    // TODO: 無駄にビルドされないか確認したい...
    controller.value = controller.value.copyWith(
      text: value.toString(),
      selection: TextSelection.collapsed(offset: value.toString().length),
    );

    return TextField(
      focusNode: node,
      controller: controller,
      decoration: decoration,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        NumericRangeFormatter(min: min, max: max),
      ],
      keyboardType: TextInputType.number,
      onChanged: (value) {
        final number = int.tryParse(value) ?? 0;
        onChanged?.call(number);
      },
    );
  }
}

class StatsInputs extends HookWidget {
  const StatsInputs({
    super.key,
    required this.theory,
    this.onChanged,
  });

  /// 育成論
  final Theory theory;

  /// 育成論の変更通知
  final ValueChanged<Theory>? onChanged;

  /// キーボードのショートカットアイテムを定義する
  ///
  /// [min], [max]のボタンを追加
  /// [min], [max]のボタンが押下された時に[onChanged]を呼ぶ
  ///
  /// [Done]を押した時にキーボードを閉じる
  KeyboardActionsItem _keyboardActionsItem({
    required BuildContext context,
    required FocusNode node,
    required int min,
    required int max,
    ValueChanged<int>? onChanged,
  }) =>
      KeyboardActionsItem(
        focusNode: node,
        toolbarAlignment: MainAxisAlignment.spaceBetween,
        // フォーカスの入れ替えボタン
        displayArrows: true,
        toolbarButtons: [
          (node) => Row(
                children: [
                  TextButton(
                    onPressed: () => onChanged?.call(min),
                    child: Text(
                      min.toString(),
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => onChanged?.call(max),
                    child: Text(
                      max.toString(),
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                    ),
                  ),
                ],
              ),
          (node) => const Spacer(),
          (node) => Row(
                children: [
                  TextButton(
                    onPressed: () => node.unfocus(),
                    child: Text(
                      'Done',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                    ),
                  ),
                ],
              ),
        ],
      );

  /// 実数値が変化する分だけ努力値を丸める
  ///
  /// [effort]に[delta]を加える
  /// [delta]が正の時、切り上げで丸める
  /// [delta]が負の時、切り捨てで丸める
  ///
  /// [individual]が奇数(31)の時、実数値は8n+4で変化する
  /// [individual]が偶数(30)の時、実数値は8nで変化する
  /// 30未満の場合は、実際には1/8段より分解能が粗くなるはずだがノーケア
  int _addEffort(int individual, int effort, int delta) {
    // 個体値が偶数かを判定する
    final odd = individual % 2 == 1;

    // 計算後の努力値
    // 努力値は0~252の範囲内でリミットする
    var newEffort = (effort + delta).clamp(0, 252);

    // 偶数の時、最初にオフセット分を減算
    if (odd) {
      newEffort -= 4;
    }

    // deltaが正か、負かに応じて丸める方向を変える
    if (delta > 0) {
      // 1/8段で切り上げ
      newEffort = (newEffort / 8).ceil() * 8;
    } else {
      // 1/8段で切り捨て
      newEffort = (newEffort / 8).floor() * 8;
    }

    // 偶数の時、最初に引いたオフセット分を加算
    if (odd) {
      newEffort += 4;
    }

    // 丸め後に再度リミットする
    newEffort = newEffort.clamp(0, 252);

    return newEffort;
  }

  @override
  Widget build(BuildContext context) {
    // 個体値のテキストフィールド
    final individualTextFields = List.generate(
      6,
      (index) => StatsTextField(
        value: theory.individual[index],
        decoration: const InputDecoration(
          labelText: '個体値',
        ),
        onChanged: (value) => onChanged?.call(
          theory.copyWith(
            individual: theory.individual.copyWithIndex(index, value),
          ),
        ),
      ),
    );

    // 努力値のテキストフィールド
    final effortTextFields = List.generate(
      6,
      (index) => StatsTextField(
        value: theory.effort[index],
        decoration: const InputDecoration(
          labelText: '努力値',
        ),
        onChanged: (value) => onChanged?.call(
          theory.copyWith(
            effort: theory.effort.copyWithIndex(index, value),
          ),
        ),
      ),
    );

    // キーボードショートカットの設定
    KeyboardActionsConfig config = KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      nextFocus: true,
      keyboardBarColor: Theme.of(context).cardColor,
      actions: [
        // 個体値
        for (var index = 0; index < 6; index++)
          _keyboardActionsItem(
            context: context,
            node: individualTextFields[index].node,
            min: 0,
            max: 31,
            onChanged: (value) => onChanged?.call(
              theory.copyWith(
                individual: theory.individual.copyWithIndex(index, value),
              ),
            ),
          ),
        // 努力値
        for (var index = 0; index < 6; index++)
          _keyboardActionsItem(
            context: context,
            node: effortTextFields[index].node,
            min: 0,
            max: 252,
            onChanged: (value) => onChanged?.call(
              theory.copyWith(
                effort: theory.effort.copyWithIndex(index, value),
              ),
            ),
          ),
      ],
    );

    return KeyboardActions(
      disableScroll: true,
      config: config,
      child: Column(
        children: [
          for (var i = 0; i < 6; i++)
            ListTile(
              leading: LeadingSizedBox(
                child: Text(
                  Stats.strings[i],
                  style: TextStyle(
                    color: getNatureBuffColor(theory.nature.buff[i]),
                  ),
                ),
              ),
              title: Row(
                children: [
                  Flexible(
                    child: TextField(
                      readOnly: true,
                      controller: TextEditingController(
                        text: theory.actual[i].toString(),
                      ),
                      decoration: const InputDecoration(
                        labelText: '実数値',
                      ),
                    ),
                  ),
                  Flexible(child: individualTextFields[i]),
                  Flexible(child: effortTextFields[i]),
                  IconButton(
                    // 努力値を加算して通知
                    onPressed: () => onChanged?.call(
                      theory.copyWith(
                        effort: theory.effort.copyWithIndex(
                          i,
                          _addEffort(
                            theory.individual[i],
                            theory.effort[i],
                            1,
                          ),
                        ),
                      ),
                    ),
                    icon: const Icon(Icons.add_circle),
                  ),
                  IconButton(
                    // 努力値を減算して通知
                    onPressed: () => onChanged?.call(
                      theory.copyWith(
                        effort: theory.effort.copyWithIndex(
                          i,
                          _addEffort(
                            theory.individual[i],
                            theory.effort[i],
                            -1,
                          ),
                        ),
                      ),
                    ),
                    icon: const Icon(Icons.remove_circle),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
