import 'package:mobx/mobx.dart';
import 'package:podiya/model/UserData.dart';

part 'wizardState.g.dart';

// This is the class used by rest of your codebase
class WizardState = _WizardState with _$WizardState;

// The store-class
abstract class _WizardState with Store {
  @observable
  int step = 0;

  @observable
  UserType type;

  @observable
  String eventName;

  @observable
  DateTime eventDate;

  @action
  void increment() {
    step++;
  }

  @action
  void decrement() {
    step--;
  }

  @action
  void setType(UserType userType) {
    type = userType;
  }

  @action
  void setName(String name) {
    eventName = name;
    this.increment();
  }

  @action
  void setDate(DateTime date) {
    eventDate = date;
    this.increment();
  }
}
