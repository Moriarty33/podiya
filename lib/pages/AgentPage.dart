import 'package:flutter/material.dart';
import 'package:podiya/dao/AgentDao.dart';
import 'package:podiya/model/Agent.dart';
import 'package:podiya/state/homeState.dart';
import 'package:podiya/widgets/Agents/AgentInfo.dart';
import 'package:podiya/widgets/SpinnerWidget.dart';
import 'package:provider/provider.dart';

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
          FutureBuilder(
            future: AgentDao.getAgent(widget.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Agent agent = snapshot.data;
                return DraggableScrollableSheet(
                    initialChildSize: 0.55,
                    maxChildSize: 0.95,
                    minChildSize: 0.55,
                    builder: (context, scrollController) {
                      return Container(
                        padding: EdgeInsets.only(top: 18, left: 24),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25))),
                        child: SingleChildScrollView(
                            controller: scrollController,
                            child: AgentInfo(agent: agent)),
                      );
                    });
              } else {
                return Container(
                    height: 158, child: SpinnerWidget(heightFactor: 1));
              }
            },
          )
        ],
      ),
    );
  }
}
