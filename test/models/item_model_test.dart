import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_list/models/item_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  late ItemModel item;

  setUp(() {
    item = ItemModel(name: 'Rice', id: 101);
  });

  group('ItemModel', () {
    test('ItemModel should initialize with checked false', () {
      expect(item.checked, false);
    });

    test('ItemModel should set name Noodles', () {
      item.setName('Noodles');

      expect(item.name, 'Noodles');
    });

    test('ItemModel should set checked true', () {
      item.setCheck(true);

      expect(item.checked, true);
    });
  });
}
