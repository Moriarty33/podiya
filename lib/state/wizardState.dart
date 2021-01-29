import 'package:mobx/mobx.dart';
import 'package:podiya/model/AgentLinks.dart';
import 'package:podiya/model/Event.dart';
import 'package:podiya/model/UserData.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

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

  @observable
  int eventCity = 0;

  @observable
  List<String> agentTypeIds = [];

  // AGENT

  @observable
  String agentDescription;

  @observable
  List<int> agentCitiesIds = [];

  @observable
  String agentPhoneNumber;

  @observable
  AgentLinks agentLinks = AgentLinks();

  @observable
  double agentAmount = 1000;

  @observable
  List<Asset> agentImages = [];

  @observable
  Asset agentImage;

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

  @action
  void setCity(int cityId) {
    eventCity = cityId;
  }

  @action
  void setAgentTypesIds(List<String> ids) {
    agentTypeIds = ids;
  }

  @action
  void setAgentDescription(String des) {
    agentDescription = des;
  }

  @action
  void setAgentAmount(double a) {
    agentAmount = a;
  }

  @action
  void setAgentCitiesIds(List<int> list) {
    agentCitiesIds = list;
  }

  @action
  void setAgentPhoneNumber(String phoneNumber) {
    agentPhoneNumber = phoneNumber;
  }

  @action
  void setAgentLink(AgentLinks links) {
    agentLinks = links;
  }

  @action
  void setAgentImage(Asset image) {
    agentImage = image;
  }

  @action
  void setAgentImages(List<Asset> images) {
    agentImages = images;
  }

  Event getEvent() {
    return new Event(
        name: eventName, city: eventCity, date: eventDate, types: agentTypeIds);
  }
}
