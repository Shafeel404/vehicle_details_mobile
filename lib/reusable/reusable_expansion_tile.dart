import 'package:flutter/material.dart';

class ReusableExpansionTile extends StatelessWidget {
  ReusableExpansionTile(
      {super.key,
      required this.children,
      required this.title,
      required this.init});

  Widget children;
  String title;
  bool init;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedIconColor: Colors.teal,
      initiallyExpanded: init,
      title: Text(title,
          style:
              const TextStyle(color: Colors.teal, fontWeight: FontWeight.bold)),
      children: [Padding(padding: const EdgeInsets.all(8.0), child: children)],
    );
  }
}
