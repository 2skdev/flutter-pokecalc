import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HookTextFieldWidget extends HookWidget {
  const HookTextFieldWidget({
    super.key,
    this.initialValue,
    this.onChanged,
    this.decoration,
    this.style,
    this.textAlignVertical,
    this.maxLines,
    this.minLines,
  });

  final String? initialValue;
  final Function(String value)? onChanged;
  final InputDecoration? decoration;
  final TextAlignVertical? textAlignVertical;
  final TextStyle? style;
  final int? maxLines;
  final int? minLines;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();

    // コントローラに初期値をアサインする
    useEffect(() {
      controller.value = controller.value.copyWith(text: initialValue);
      return null;
    }, [controller, initialValue]);

    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: decoration,
      style: style,
      textAlignVertical: textAlignVertical,
      maxLines: maxLines,
      minLines: minLines,
    );
  }
}
