// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CollectionsMobx on _CollectionsMobx, Store {
  final _$collectionsDataAtom = Atom(name: '_CollectionsMobx.collectionsData');

  @override
  CollectionsModel get collectionsData {
    _$collectionsDataAtom.context.enforceReadPolicy(_$collectionsDataAtom);
    _$collectionsDataAtom.reportObserved();
    return super.collectionsData;
  }

  @override
  set collectionsData(CollectionsModel value) {
    _$collectionsDataAtom.context.conditionallyRunInAction(() {
      super.collectionsData = value;
      _$collectionsDataAtom.reportChanged();
    }, _$collectionsDataAtom, name: '${_$collectionsDataAtom.name}_set');
  }

  final _$collectionsListAtom = Atom(name: '_CollectionsMobx.collectionsList');

  @override
  List<CollectionsList> get collectionsList {
    _$collectionsListAtom.context.enforceReadPolicy(_$collectionsListAtom);
    _$collectionsListAtom.reportObserved();
    return super.collectionsList;
  }

  @override
  set collectionsList(List<CollectionsList> value) {
    _$collectionsListAtom.context.conditionallyRunInAction(() {
      super.collectionsList = value;
      _$collectionsListAtom.reportChanged();
    }, _$collectionsListAtom, name: '${_$collectionsListAtom.name}_set');
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

  final _$maxtimeAtom = Atom(name: '_CollectionsMobx.maxtime');

  @override
  String get maxtime {
    _$maxtimeAtom.context.enforceReadPolicy(_$maxtimeAtom);
    _$maxtimeAtom.reportObserved();
    return super.maxtime;
  }

  @override
  set maxtime(String value) {
    _$maxtimeAtom.context.conditionallyRunInAction(() {
      super.maxtime = value;
      _$maxtimeAtom.reportChanged();
    }, _$maxtimeAtom, name: '${_$maxtimeAtom.name}_set');
  }
}
