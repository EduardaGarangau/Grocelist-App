import 'package:grocery_list/models/item_model.dart';
import 'package:mobx/mobx.dart';
part 'shop_list_store.g.dart';

class ShopListStore = _ShopListStoreBase with _$ShopListStore;

abstract class _ShopListStoreBase with Store {
  @observable
  ObservableList<ItemModel> shopList = [
    ItemModel(name: 'Noodles'),
    ItemModel(name: 'Rice'),
    ItemModel(name: 'Tomatos'),
  ].asObservable();

  @action
  void addItem(ItemModel item) {
    shopList.add(item);
  }

  @action
  void removeItem(ItemModel item) {
    shopList.removeWhere((i) => i.name == item.name);
  }
}
