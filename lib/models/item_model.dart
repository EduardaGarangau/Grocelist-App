import 'package:mobx/mobx.dart';
part 'item_model.g.dart';

class ItemModel = _ItemModelBase with _$ItemModel;

abstract class _ItemModelBase with Store {
  _ItemModelBase({
    required this.name,
    this.checked = false,
  });

  @observable
  String name;

  @observable
  bool checked;

  @action
  void setName(String value) {
    name = value;
  }

  @action
  void setCheck(bool? value) {
    checked = value!;
  }
}
