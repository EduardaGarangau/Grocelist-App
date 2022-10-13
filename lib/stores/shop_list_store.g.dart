// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ShopListStore on _ShopListStoreBase, Store {
  late final _$shopListAtom =
      Atom(name: '_ShopListStoreBase.shopList', context: context);

  @override
  ObservableList<ItemModel> get shopList {
    _$shopListAtom.reportRead();
    return super.shopList;
  }

  @override
  set shopList(ObservableList<ItemModel> value) {
    _$shopListAtom.reportWrite(value, super.shopList, () {
      super.shopList = value;
    });
  }

  late final _$_ShopListStoreBaseActionController =
      ActionController(name: '_ShopListStoreBase', context: context);

  @override
  void addItem(ItemModel item) {
    final _$actionInfo = _$_ShopListStoreBaseActionController.startAction(
        name: '_ShopListStoreBase.addItem');
    try {
      return super.addItem(item);
    } finally {
      _$_ShopListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItem(ItemModel item) {
    final _$actionInfo = _$_ShopListStoreBaseActionController.startAction(
        name: '_ShopListStoreBase.removeItem');
    try {
      return super.removeItem(item);
    } finally {
      _$_ShopListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
shopList: ${shopList}
    ''';
  }
}
