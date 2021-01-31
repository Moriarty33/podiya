import 'package:mobx/mobx.dart';
import 'package:podiya/model/Event.dart';
import 'package:podiya/model/UserData.dart';

part 'homeState.g.dart';

// This is the class used by rest of your codebase
class HomeState = _HomeState with _$HomeState;

// The store-class
abstract class _HomeState with Store {
  @observable
  UserData userData;

  @observable
  Event event;

  @action
  void setUserData(UserData u) {
    userData = u;
  }

  @action
  void setEvent(Event e) {
    event = e;
  }
}
