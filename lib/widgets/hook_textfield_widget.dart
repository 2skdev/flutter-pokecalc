import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// TODO: StatsTextFieldWidgetも移植したい
class HookTextFieldWidget extends HookWidget {
  const HookTextFieldWidget({
    super.key,
    this.initialValue,
    this.onChanged,
    this.decoration,
  });

  final String? initialValue;
  final Function(String value)? onChanged;
  final InputDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();

    // コントローラに初期値をアサインする
    useEffect(() {
      controller.value = controller.value.copyWith(text: initialValue);
      return () => controller.dispose();
    }, [controller]);

    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: decoration,
    );
  }
}
