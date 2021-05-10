import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinnerWidget extends StatelessWidget {
  final double heightFactor;
  Color color;

  SpinnerWidget({required this.heightFactor, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: this.heightFactor,
      child: SpinKitChasingDots(
        color: color,
        size: 50.0,
      ),
    );
  }
}
