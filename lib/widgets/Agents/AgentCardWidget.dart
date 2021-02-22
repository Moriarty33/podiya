import 'package:flutter/material.dart';
import 'package:podiya/dao/ImagesDao.dart';
import 'package:podiya/model/Agent.dart';

class AgentCardWidget extends StatefulWidget {
  final Agent agent;

  AgentCardWidget({this.agent});

  @override
  _AgentCardWidgetState createState() => _AgentCardWidgetState();
}

class _AgentCardWidgetState extends State<AgentCardWidget> {
  String _imageUrl;

  void initState() {
    super.initState();

    ImagesDao.image(widget.agent.image).then((loc) => setState(() {
          _imageUrl = loc;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 108,
      margin: EdgeInsets.only(right: 10),
      decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(16.0),
          image: _imageUrl != null
              ? DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(_imageUrl))
              : null),
      child: Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
          child: Text(widget.agent.firstname)),
    );
  }
}
