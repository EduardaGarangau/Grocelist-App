import 'dart:math';

import 'package:flutter/material.dart';
import 'package:grocery_list/models/item_model.dart';

class ListButtons extends StatelessWidget {
  final Function() deleteAll;
  final Function(ItemModel) addItem;

  const ListButtons({
    Key? key,
    required this.deleteAll,
    required this.addItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Dialog para ter certeza se o usuário deseja excluir todos os items
    void _deleteDialog() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              'Delete All Items',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
            content: const Text(
              'Are you sure that you want to delete all items?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                      ),
                    ),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    child: const Text(
                      'Delete',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                    ),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: deleteAll,
                  ),
                ],
              )
            ],
          );
        },
      );
    }

    //Dialog para adicionar item
    void _dialogAdd() {
      ItemModel item = ItemModel(
        name: '',
        id: Random().nextInt(500),
      );

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              'Add Item',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: TextField(
              autofocus: true,
              textInputAction: TextInputAction.done,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
              ),
              onSubmitted: (_) {
                addItem(item);
                Navigator.of(context).pop();
              },
              onChanged: item.setName,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                    ),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                    ),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      addItem(item);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ],
          );
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
        top: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            width: 150,
            child: ElevatedButton(
              child: const Text(
                'Add',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: _dialogAdd,
            ),
          ),
          const SizedBox(width: 20),
          SizedBox(
            height: 40,
            width: 150,
            child: ElevatedButton(
              child: const Text(
                'Delete All',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).errorColor,
              ),
              onPressed: _deleteDialog,
            ),
          ),
        ],
      ),
    );
  }
}
