import 'package:flutter/material.dart';

import 'delete_alert_widget.dart';

class DeleteDismissWidget extends StatelessWidget {
  const DeleteDismissWidget({
    required super.key,
    required this.child,
    this.onDelete,
  });

  final Widget child;
  final Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: super.key!,
      direction: DismissDirection.endToStart,
      onDismissed: (direction) => onDelete?.call(),
      confirmDismiss: (direction) async {
        return showDialog(
          context: context,
          builder: (context) => const DeleteAlertWidget(),
        );
      },
      background: Container(
        color: Colors.red,
        alignment: AlignmentDirectional.centerEnd,
        padding: const EdgeInsets.only(right: 32),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      child: child,
    );
  }
}
