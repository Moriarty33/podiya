import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:podiya/model/Agent.dart';
import 'package:podiya/model/AgentLinks.dart';
import 'package:podiya/model/Event.dart';
import 'package:podiya/model/UserData.dart';

part 'wizardState.g.dart';

// This is the class used by rest of your codebase
class WizardState = _WizardState with _$WizardState;

// The store-class
abstract class _WizardState with Store {
  @observable
  int step = 0;

  @observable
  UserType? type;

  @observable
  String? eventName;

  @observable
  DateTime? eventDate;

  @observable
  int eventCity = 0;

  @observable
  List<String> agentTypeIds = [];

  // AGENT

  @observable
  String agentDescription = "";

  @observable
  List<int> agentCitiesIds = [];

  @observable
  String agentPhoneNumber = "";

  @observable
  AgentLinks agentLinks = AgentLinks();

  @observable
  double agentAmount = 1000;

  @observable
  List<String> agentImages = [];

  @observable
  String? agentImage;

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
  void setAgentImage(String image) {
    agentImage = image;
  }

  @action
  void setAgentImages(List<String> images) {
    agentImages = images;
  }

  Event getEvent() {
    return new Event(
        name: eventName as String, city: eventCity, date: eventDate as DateTime, types: agentTypeIds);
  }

  Agent getAgent() {
    User user = FirebaseAuth.instance.currentUser!;
    String firstname = user.displayName!.split(" ")[0];
    String lastname = user.displayName!.split(" ")[1];

    return new Agent(
        amount: agentAmount,
        cities: agentCitiesIds,
        description: agentDescription,
        firstname: firstname,
        lastname: lastname,
        image: agentImage as String,
        images: agentImages,
        phoneNumber: agentPhoneNumber,
        types: agentTypeIds,
        links: agentLinks);
  }
}
