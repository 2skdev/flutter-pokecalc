import 'package:flutter/material.dart';

class DeleteAlertWidget extends StatelessWidget {
  const DeleteAlertWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('削除しますか？'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(
            'キャンセル',
            style: Theme.of(context).textTheme.button,
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text(
            'はい',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
