import 'package:mobx/mobx.dart';

part 'wizardState.g.dart';

// This is the class used by rest of your codebase
class WizardState = _WizardState with _$WizardState;

// The store-class
abstract class _WizardState with Store {
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
