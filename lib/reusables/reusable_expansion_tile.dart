import 'package:flutter/material.dart';
import 'package:vehicle_details/responses/cat_api_response.dart';
import 'package:vehicle_details/reusables/reusableText.dart';

import '../constants/constants.dart';

class ReusableExpansionTile extends StatelessWidget {
  ReusableExpansionTile(
      {required this.children, required this.title, required this.init});

  Widget children;
  String title;
  bool init;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedIconColor: Colors.teal,
      initiallyExpanded: init,
      title: Text(title,
          style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold)),
      children: [Padding(padding: const EdgeInsets.all(8.0), child: children)],
    );
  }
}
