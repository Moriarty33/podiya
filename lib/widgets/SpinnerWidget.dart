import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinnerWidget extends StatelessWidget {
  final double heightFactor;
  final Colors color;

  SpinnerWidget({@required this.heightFactor, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: this.heightFactor,
      child: SpinKitChasingDots(
        color: color == null ? Colors.black : color,
        size: 50.0,
      ),
    );
  }
}
