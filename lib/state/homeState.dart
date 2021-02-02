import 'package:mobx/mobx.dart';
import 'package:podiya/dao/EventDao.dart';
import 'package:podiya/dao/UserDataDao.dart';
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

  @observable
  int page = 0;

  @action
  Future<UserData> init() async {
    UserData u = await UserDataDao.getData();
    Event e = await EventDao.getEvent(u.event);
    setUserData(u);
    setEvent(e);

    return userData;
  }

  @action
  void setUserData(UserData u) {
    userData = u;
  }

  @action
  void setEvent(Event e) {
    event = e;
  }

  @action
  void setPage(int p) {
    page = p;
  }
}
