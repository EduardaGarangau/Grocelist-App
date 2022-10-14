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

  @computed
  int get totalChecked => shopList.where((item) => item.checked).length;

  @computed
  List<ItemModel> get listFiltered {
    if (filter.isEmpty) {
      return shopList;
    } else {
      return shopList
          .where(
              (item) => item.name.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    }
  }

  @observable
  String filter = '';

  @action
  setFilter(String value) {
    filter = value;
  }

  @action
  void addItem(ItemModel item) {
    shopList.add(item);
  }

  @action
  void removeItem(ItemModel item) {
    shopList.removeWhere((i) => i.name == item.name);
  }

  @action
  void deleteAll() {
    shopList = ObservableList<ItemModel>();
  }
}
