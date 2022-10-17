import 'dart:async';

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
    void _completedDialog() {
      showDialog(
        context: context,
        builder: (context) {
          Future.delayed(const Duration(seconds: 5), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            backgroundColor: const Color.fromRGBO(235, 239, 241, 2),
            title: Image.asset(
              'lib/assets/images/success.gif',
              height: 200,
            ),
            content: const Text(
              'List Completed!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      );
    }

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
                if (totalChecked == listLength) {
                  _completedDialog();
                }
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
