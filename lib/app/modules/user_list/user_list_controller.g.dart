// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserListController on _UserListBase, Store {
  final _$_listAtom = Atom(name: '_UserListBase._list');

  @override
  List<User> get _list {
    _$_listAtom.context.enforceReadPolicy(_$_listAtom);
    _$_listAtom.reportObserved();
    return super._list;
  }

  @override
  set _list(List<User> value) {
    _$_listAtom.context.conditionallyRunInAction(() {
      super._list = value;
      _$_listAtom.reportChanged();
    }, _$_listAtom, name: '${_$_listAtom.name}_set');
  }

  final _$_errorAtom = Atom(name: '_UserListBase._error');

  @override
  Error get _error {
    _$_errorAtom.context.enforceReadPolicy(_$_errorAtom);
    _$_errorAtom.reportObserved();
    return super._error;
  }

  @override
  set _error(Error value) {
    _$_errorAtom.context.conditionallyRunInAction(() {
      super._error = value;
      _$_errorAtom.reportChanged();
    }, _$_errorAtom, name: '${_$_errorAtom.name}_set');
  }

  final _$getUsersAsyncAction = AsyncAction('getUsers');

  @override
  Future getUsers() {
    return _$getUsersAsyncAction.run(() => super.getUsers());
  }
}
