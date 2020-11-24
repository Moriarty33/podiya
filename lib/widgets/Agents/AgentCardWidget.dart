import 'package:flutter/material.dart';

class AgentCardWidget extends StatelessWidget {
  final String name;

  AgentCardWidget({this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 108,
      margin: EdgeInsets.only(right: 10),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(16.0),
        color: Colors.grey,
      ),
      child: Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
          child: Text(name)),
    );
  }
}
