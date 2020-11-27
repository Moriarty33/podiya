import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:podiya/state/wizardState.dart';
import 'package:provider/provider.dart';

class StepsIndicatorWidget extends StatelessWidget {
  final count;

  StepsIndicatorWidget({@required this.count});
  @override
  Widget build(BuildContext context) {
    List<int> list = Iterable<int>.generate(this.count - 1).toList();
    WizardState wizardState = Provider.of<WizardState>(context);

    return Container(
      height: 25,
      child: Observer(
        builder: (_) => ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(list.length, (index) {
              return step(index + 1,
                  wizardState.step == index ? Colors.black : Colors.grey);
            })),
      ),
    );
  }

  Widget step(number, Color color) {
    return Container(
      width: 25,
      height: 25,
      margin: EdgeInsets.only(right: 12),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.all(Radius.circular(100))),
      child: Text(
        number.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(color: color),
      ),
    );
  }
}
