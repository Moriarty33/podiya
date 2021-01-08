import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:podiya/dao/TypesDao.dart';
import 'package:podiya/state/wizardState.dart';
import 'package:provider/provider.dart';

class AgentTypeTags extends StatefulWidget {
  @override
  _AgentTypeTagsState createState() => _AgentTypeTagsState();
}

class _AgentTypeTagsState extends State<AgentTypeTags> {
  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();

  List _items = [];
  double _fontSize = 13;

  @override
  void initState() {
    super.initState();

    TypesDao.getAgentTypes().then((items) {
      setState(() {
        _items = items;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    WizardState wizardState = Provider.of<WizardState>(context);
    return Container(
      height: 300,
      child: Tags(
        runAlignment: WrapAlignment.start,
        key: _tagStateKey,
        itemCount: _items.length, // required
        itemBuilder: (int index) {
          final item = _items[index];
          return ItemTags(
            // Each ItemTags must contain a Key. Keys allow Flutter to
            // uniquely identify widgets.
            key: Key(index.toString()),
            index: index, // required
            title: item.name,
            active: wizardState.agentTypeIds.contains(item.id),
            textStyle: TextStyle(
              fontSize: _fontSize,
            ),
            borderRadius: BorderRadius.all(Radius.circular(3)),
            padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
            combine: ItemTagsCombine.withTextBefore,
            customData: item.id,
            activeColor: Colors.black,
            color: Colors.grey[300],
            textColor: Colors.grey[600],
            border: Border.all(color: Colors.transparent),
            elevation: 1,
            onPressed: (_) {
              wizardState.setAgentTypesIds(this._getAllItem());
            },
          );
        },
      ),
    );
  }

  List<String> _getAllItem() {
    List<Item> lst = _tagStateKey.currentState?.getAllItem;
    if (lst != null) {
      List<String> ids = lst
          .where((a) => a.active == true)
          .map((e) => e.customData as String)
          .toList();
      return ids;
    } else {
      return [];
    }
  }
}
