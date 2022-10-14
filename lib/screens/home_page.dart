import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:grocery_list/models/item_model.dart';
import 'package:grocery_list/stores/shop_list_store.dart';
import 'package:grocery_list/widgets/item_widget.dart';
import 'package:grocery_list/widgets/list_buttons.dart';
import 'package:grocery_list/widgets/search_progress.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = ShopListStore();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(129, 197, 16, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(129, 197, 16, 1),
        elevation: 0,
        toolbarHeight: 100,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Grocery List',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            // const SizedBox(width: 10),
            Image.asset(
              'lib/assets/images/appbar2.png',
              height: 105,
              filterQuality: FilterQuality.high,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            Observer(builder: (context) {
              return SearchAndProgress(
                setFilter: store.setFilter,
                itemsChecked: store.totalChecked,
                listLength: store.shopList.length,
                filter: store.filter,
              );
            }),
            Expanded(
              child: Observer(
                builder: (context) {
                  return ListView.builder(
                    itemCount: store.listFiltered.length,
                    itemBuilder: (context, index) {
                      ItemModel item = store.listFiltered[index];

                      return ItemWidget(
                        item: item,
                        delete: () {
                          store.removeItem(item);
                        },
                      );
                    },
                  );
                },
              ),
            ),
            ListButtons(
              deleteAll: () {
                store.deleteAll();
                Navigator.of(context).pop();
              },
              addItem: store.addItem,
            ),
          ],
        ),
      ),
    );
  }
}
