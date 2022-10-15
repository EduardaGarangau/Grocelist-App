import 'package:grocery_list/database/db.dart';
import 'package:grocery_list/models/item_model.dart';
import 'package:mobx/mobx.dart';
part 'shop_list_store.g.dart';

class ShopListStore = _ShopListStoreBase with _$ShopListStore;

abstract class _ShopListStoreBase with Store {
  //Lista vazia sempre ao iniciar o app
  @observable
  ObservableList<ItemModel> shopList = ObservableList<ItemModel>();

  //Método para recuperar os items do banco de dados e adiciona a ObservableList
  Future<void> loadItems() async {
    final dataList = await DB.getData('items');
    for (var item in dataList) {
      ItemModel itemDB = ItemModel(
        id: item['id'],
        name: item['name'],
        checked: item['checked'] == 1 ? true : false,
      );
      shopList.add(itemDB);
    }
  }

  //Método get de quantos items estão concluídos, checked == true
  @computed
  int get totalChecked => shopList.where((item) => item.checked).length;

  //Método para filtrar a lista
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

  //Método para adicionar item na ObservableList e no banco de dados
  @action
  void addItem(ItemModel item) {
    shopList.add(item);
    DB.insert(
      'items',
      {
        'id': item.id,
        'name': item.name,
        'checked': item.checked ? 1 : 0,
      },
    );
  }

  //Método para excluir item na ObservableList e no banco de dados
  @action
  void removeItem(ItemModel item) {
    shopList.removeWhere((i) => i.id == item.id);
    DB.delete(
      'items',
      item.id,
    );
  }

  //Método para excluir todos os itens da ObservableList e do banco de dados
  @action
  void deleteAll() {
    shopList = ObservableList<ItemModel>();
    DB.deleteAll('items');
  }
}
