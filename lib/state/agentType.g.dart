// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agentType.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AgentType on _AgentType, Store {
  final _$valueAtom = Atom(name: '_AgentType.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_AgentTypeActionController = ActionController(name: '_AgentType');

  @override
  void set(dynamic index) {
    final _$actionInfo =
        _$_AgentTypeActionController.startAction(name: '_AgentType.set');
    try {
      return super.set(index);
    } finally {
      _$_AgentTypeActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
