import 'package:flutter/material.dart';
import 'package:podiya/state/homeState.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class AgentPage extends StatefulWidget {
  String id;
  String imageUrl;

  AgentPage({this.id, this.imageUrl});

  @override
  _AgentPageState createState() => _AgentPageState();
}

class _AgentPageState extends State<AgentPage> {
  @override
  Widget build(BuildContext context) {
    HomeState homeState = Provider.of<HomeState>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: Image(
              width: double.infinity,
              image: NetworkImage(widget.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.7,
              maxChildSize: 0.95,
              minChildSize: 0.55,
              expand: true,
              builder: (context, scrollController) {
                return Container(
                  padding: EdgeInsets.only(top: 18, left: 24),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25))),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.id, style: HeaderStyle, textAlign: TextAlign.start,)
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    )
    ;
  }
}
