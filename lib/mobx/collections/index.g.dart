// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CollectionsMobx on _CollectionsMobx, Store {
  final _$newsDataAtom = Atom(name: '_CollectionsMobx.newsData');

  @override
  CollectionsModel get newsData {
    _$newsDataAtom.context.enforceReadPolicy(_$newsDataAtom);
    _$newsDataAtom.reportObserved();
    return super.newsData;
  }

  @override
  set newsData(CollectionsModel value) {
    _$newsDataAtom.context.conditionallyRunInAction(() {
      super.newsData = value;
      _$newsDataAtom.reportChanged();
    }, _$newsDataAtom, name: '${_$newsDataAtom.name}_set');
  }

  final _$clippersAtom = Atom(name: '_CollectionsMobx.clippers');

  @override
  List get clippers {
    _$clippersAtom.context.enforceReadPolicy(_$clippersAtom);
    _$clippersAtom.reportObserved();
    return super.clippers;
  }

  @override
  set clippers(List value) {
    _$clippersAtom.context.conditionallyRunInAction(() {
      super.clippers = value;
      _$clippersAtom.reportChanged();
    }, _$clippersAtom, name: '${_$clippersAtom.name}_set');
  }

  final _$maxidAtom = Atom(name: '_CollectionsMobx.maxid');

  @override
  String get maxid {
    _$maxidAtom.context.enforceReadPolicy(_$maxidAtom);
    _$maxidAtom.reportObserved();
    return super.maxid;
  }

  @override
  set maxid(String value) {
    _$maxidAtom.context.conditionallyRunInAction(() {
      super.maxid = value;
      _$maxidAtom.reportChanged();
    }, _$maxidAtom, name: '${_$maxidAtom.name}_set');
  }
}
