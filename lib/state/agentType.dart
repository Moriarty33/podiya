import 'package:mobx/mobx.dart';

// Include generated file
part 'agentType.g.dart';

// This is the class used by rest of your codebase
class AgentType = _AgentType with _$AgentType;

// The store-class
abstract class _AgentType with Store {
  @observable
  int value = 0;

  @action
  void set(index) {
    value = index;
  }
}
