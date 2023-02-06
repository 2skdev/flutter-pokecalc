import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NumericRangeFormatter extends TextInputFormatter {
  NumericRangeFormatter({this.min, this.max});

  final int? min;
  final int? max;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text == '') {
      return newValue;
    } else if (min != null && int.parse(newValue.text) < min!) {
      final text = min.toString();
      return TextEditingValue(
        text: text,
        selection: TextSelection.collapsed(offset: text.length),
      );
    } else if (max != null && int.parse(newValue.text) > max!) {
      final text = max.toString();
      return TextEditingValue(
        text: text,
        selection: TextSelection.collapsed(offset: text.length),
      );
    } else {
      /* 現在値が0で末尾に文字を挿入する場合は0を置き換える */
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

class HookTextFieldWidget extends HookWidget {
  const HookTextFieldWidget({
    super.key,
    required this.text,
    this.keyboardType,
    this.onChanged,
    this.inputFormatters,
    this.readOnly = false,
    this.decoration,
  });

  final String text;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final InputDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();

    // TODO: リビルドが無駄に走らないかを確認
    controller.value = controller.value.copyWith(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );

    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      readOnly: readOnly,
      textAlign: TextAlign.end,
      decoration: decoration,
    );
  }
}

class NumericHookTextFieldWidget extends StatelessWidget {
  const NumericHookTextFieldWidget({
    super.key,
    int? value,
    this.min,
    this.max,
    this.onChanged,
    this.decoration,
  }) : value = value ?? 0;

  final int value;
  final int? min;
  final int? max;
  final ValueChanged<int>? onChanged;
  final InputDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return HookTextFieldWidget(
      text: value.toString(),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        NumericRangeFormatter(min: min, max: max),
      ],
      keyboardType: TextInputType.number,
      onChanged: (value) {
        final number = int.tryParse(value) ?? 0;
        onChanged?.call(number);
      },
      decoration: decoration,
    );
  }
}
