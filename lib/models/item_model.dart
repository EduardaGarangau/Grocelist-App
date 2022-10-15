import 'dart:math';

import 'package:grocery_list/database/db.dart';
import 'package:mobx/mobx.dart';
part 'item_model.g.dart';

class ItemModel = _ItemModelBase with _$ItemModel;

abstract class _ItemModelBase with Store {
  //Construtor para criar um objeto
  _ItemModelBase({
    required this.name,
    this.checked = false,
    required this.id,
  });

  @observable
  String name;

  @observable
  bool checked;

  @observable
  int id;

  @action
  void setName(String value) {
    //Apenas a primeira letra em maiusculo
    name = "${value[0].toUpperCase()}${value.substring(1).toLowerCase()}";
  }

  @action
  void setCheck(bool? value) {
    checked = value!;
    //Faz alteração no banco de dados do atributo checked passando o id do item
    DB.setChecked('items', id, checked);
  }
}
