import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_list/models/item_model.dart';
import 'package:grocery_list/stores/shop_list_store.dart';

void main() {
  late ShopListStore store;

  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
    store = ShopListStore();
  });

  group('Shop List', () {
    test('list should initialized empty', () {
      final shoplist = store.shopList;

      expect(shoplist.isEmpty, true);
    });

    test('should add item to shoplist', () {
      final item = ItemModel(id: 1, name: 'Noodles');

      store.addItem(item);

      expect(store.shopList.isNotEmpty, true);
    });

    test('should remove item in shoplist and return true', () {
      final item = ItemModel(id: 1, name: 'Noodles');
      store.addItem(item);

      store.removeItem(item);
      expect(store.shopList.isEmpty, true);
    });

    test('should delete all items in shoplist and return true', () {
      final item = ItemModel(id: 1, name: 'Noodles');
      store.addItem(item);
      final item2 = ItemModel(id: 2, name: 'Rice');
      store.addItem(item2);

      store.deleteAll();
      expect(store.shopList.isEmpty, true);
    });

    test('filter should initialize empty and return true', () {
      expect(store.filter.isEmpty, true);
    });

    test('should set filter to Rice', () {
      store.setFilter('Rice');

      expect(store.filter, 'Rice');
    });

    test('should filter the list and return list length 1', () {
      final item = ItemModel(id: 1, name: 'Noodles');
      store.addItem(item);
      final item2 = ItemModel(id: 2, name: 'Rice');
      store.addItem(item2);

      store.setFilter('i');

      expect(store.listFiltered.length, 1);
    });

    test('Should not filter the list', () {
      final item = ItemModel(id: 1, name: 'Noodles');
      store.addItem(item);

      store.setFilter('a');

      expect(store.listFiltered.length, 0);
    });

    test('totalcheck should return 2', () {
      final item = ItemModel(id: 1, name: 'Noodles', checked: true);
      store.addItem(item);
      final item2 = ItemModel(id: 2, name: 'Rice', checked: true);
      store.addItem(item2);

      expect(store.totalChecked, 2);
    });

    test('should get allItemsDone and return true', () {
      final item = ItemModel(id: 1, name: 'Noodles', checked: true);
      store.addItem(item);
      final item2 = ItemModel(id: 2, name: 'Rice', checked: true);
      store.addItem(item2);

      expect(store.allItemsDone, true);
    });

    test('should get allItemsDone and return false', () {
      final item = ItemModel(id: 1, name: 'Noodles', checked: false);
      store.addItem(item);
      final item2 = ItemModel(id: 2, name: 'Rice', checked: false);
      store.addItem(item2);

      expect(store.allItemsDone, false);
    });
  });
}
