import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:grocery_list/models/item_model.dart';

class ItemWidget extends StatelessWidget {
  final ItemModel item;
  final Function() delete;
  final int totalChecked;
  final int listLength;

  const ItemWidget({
    Key? key,
    required this.delete,
    required this.item,
    required this.totalChecked,
    required this.listLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Card(
          elevation: 5,
          child: ListTile(
            leading: Checkbox(
              activeColor: const Color.fromRGBO(129, 197, 16, 1),
              shape: const CircleBorder(),
              value: item.checked,
              onChanged: (value) {
                item.setCheck(value);
              },
            ),
            title: Text(
              item.name,
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.black,
                decoration: item.checked ? TextDecoration.lineThrough : null,
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.remove_circle,
                color: Theme.of(context).errorColor,
              ),
              onPressed: delete,
            ),
          ),
        );
      },
    );
  }
}
