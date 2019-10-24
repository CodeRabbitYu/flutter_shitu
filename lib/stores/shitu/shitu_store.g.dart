// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shitu_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ShiTuStore on _ShiTuStore, Store {
  final _$imageUrlAtom = Atom(name: '_ShiTuStore.imageUrl');

  @override
  String get imageUrl {
    _$imageUrlAtom.context.enforceReadPolicy(_$imageUrlAtom);
    _$imageUrlAtom.reportObserved();
    return super.imageUrl;
  }

  @override
  set imageUrl(String value) {
    _$imageUrlAtom.context.conditionallyRunInAction(() {
      super.imageUrl = value;
      _$imageUrlAtom.reportChanged();
    }, _$imageUrlAtom, name: '${_$imageUrlAtom.name}_set');
  }

  final _$_ShiTuStoreActionController = ActionController(name: '_ShiTuStore');

  @override
  dynamic setImageUrl(String url) {
    final _$actionInfo = _$_ShiTuStoreActionController.startAction();
    try {
      return super.setImageUrl(url);
    } finally {
      _$_ShiTuStoreActionController.endAction(_$actionInfo);
    }
  }
}
