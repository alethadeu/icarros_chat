// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeBase, Store {
  final _$resultAtom = Atom(name: '_HomeBase.result');

  @override
  Result get result {
    _$resultAtom.context.enforceReadPolicy(_$resultAtom);
    _$resultAtom.reportObserved();
    return super.result;
  }

  @override
  set result(Result value) {
    _$resultAtom.context.conditionallyRunInAction(() {
      super.result = value;
      _$resultAtom.reportChanged();
    }, _$resultAtom, name: '${_$resultAtom.name}_set');
  }

  final _$_loginResponseAtom = Atom(name: '_HomeBase._loginResponse');

  @override
  LoginResponse get _loginResponse {
    _$_loginResponseAtom.context.enforceReadPolicy(_$_loginResponseAtom);
    _$_loginResponseAtom.reportObserved();
    return super._loginResponse;
  }

  @override
  set _loginResponse(LoginResponse value) {
    _$_loginResponseAtom.context.conditionallyRunInAction(() {
      super._loginResponse = value;
      _$_loginResponseAtom.reportChanged();
    }, _$_loginResponseAtom, name: '${_$_loginResponseAtom.name}_set');
  }

  final _$doLoginAsyncAction = AsyncAction('doLogin');

  @override
  Future doLogin() {
    return _$doLoginAsyncAction.run(() => super.doLogin());
  }
}
