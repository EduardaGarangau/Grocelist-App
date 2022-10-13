import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_list/models/item_model.dart';

void main() {
  test('Set name of Item', () {
    final item = ItemModel(name: '');
    item.setName('Noodles');

    expect(item.name, 'Noodles');
  });

  test('Set checked of Item', () {
    final item = ItemModel(name: 'Noodles');
    item.setCheck(true);

    expect(item.checked, true);
  });

  test('Create an Item', () {
    final item = ItemModel(name: '');
    item.setName('Noodles');
    item.setCheck(true);

    expect(item, item);
  });
}
