import 'package:mobx/mobx.dart';
import 'package:podiya/model/Event.dart';

part 'homeState.g.dart';

// This is the class used by rest of your codebase
class HomeState = _HomeState with _$HomeState;

// The store-class
abstract class _HomeState with Store {
  @observable
  Event event;

  @observable
  List<Event> events;

  @action
  void setEvents(List<Event> e) {
    events = e;
    event = e.last;
  }
}
