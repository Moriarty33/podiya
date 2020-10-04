import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinnerWidget extends StatelessWidget {
  final double heightFactor;

  SpinnerWidget({@required this.heightFactor});

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: this.heightFactor,
      child: SpinKitChasingDots(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }
}
