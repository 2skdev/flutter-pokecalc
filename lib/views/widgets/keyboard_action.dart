import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class NumericKeyboardAction extends HookWidget {
  NumericKeyboardAction({
    super.key,
    this.child,
  });

  final Widget? child;
  final _node = FocusNode();

  KeyboardActionsConfig _buildContig(BuildContext context) =>
      KeyboardActionsConfig(
        keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
        nextFocus: true,
        actions: [
          KeyboardActionsItem(
            focusNode: _node,
            toolbarAlignment: MainAxisAlignment.spaceBetween,
            displayArrows: false,
            toolbarButtons: [
              (node) {
                return Row(
                  children: [
                    TextButton(onPressed: () {}, child: const Text('-')),
                    TextButton(onPressed: () {}, child: const Text('+')),
                  ],
                );
              },
              (node) {
                return Row(
                  children: [
                    TextButton(onPressed: () {}, child: const Text('min')),
                    TextButton(onPressed: () {}, child: const Text('max')),
                  ],
                );
              },
              (node) {
                return Row(
                  children: [
                    TextButton(
                      onPressed: () => node.unfocus(),
                      child: const Text('Done'),
                    ),
                  ],
                );
              },
            ],
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();

    _node.addListener(
      () {
        print(_node.hasPrimaryFocus);
        if (_node.hasPrimaryFocus == false) {
          _node.unfocus();
        }
      },
    );

    return KeyboardActions(
      config: _buildContig(context),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        focusNode: _node,
      ),
    );
  }
}
