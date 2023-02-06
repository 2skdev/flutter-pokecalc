import 'package:flutter/material.dart';

import '../../models/theory.dart';

class TheoryCard extends StatelessWidget {
  const TheoryCard({
    required super.key,
    required this.theory,
    this.children,
    this.onDelete,
    this.onTap,
  });

  final Theory theory;
  final List<Widget>? children;
  final Function()? onDelete;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: super.key!,
      direction: onDelete != null
          ? DismissDirection.endToStart
          : DismissDirection.none,
      onDismissed: (direction) => onDelete?.call(),
      background: Container(
        color: Colors.red,
        alignment: AlignmentDirectional.centerEnd,
        padding: const EdgeInsets.only(right: 32),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        Image.asset(theory.pokemon.icon, width: 96),
                        Positioned(
                          top: 8,
                          left: 8,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade50,
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: Image.asset(theory.teratype.icon, width: 20),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          theory.pokemon.string,
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          theory.effort.toString(),
                          style: const TextStyle(color: Colors.grey),
                        ),
                        Text(
                          '特性:${theory.ability.string} 性格:${theory.nature.string}',
                        ),
                        Row(
                          children: [
                            Image.asset(theory.item.icon, width: 20),
                            Text(theory.item.string),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                if (children != null) ...children!
              ],
            ),
          ),
        ),
      ),
    );
  }
}
