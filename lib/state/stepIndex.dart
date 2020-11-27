import 'package:mobx/mobx.dart';

part 'stepIndex.g.dart';

// This is the class used by rest of your codebase
class StepIndex = _StepIndex with _$StepIndex;

// The store-class
abstract class _StepIndex with Store {
  @observable
  int step = 0;

  @action
  void increment() {
    step++;
  }

  @action
  void decrement() {
    step--;
  }
}
