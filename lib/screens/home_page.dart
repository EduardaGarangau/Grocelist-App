import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:grocery_list/models/item_model.dart';
import 'package:grocery_list/stores/shop_list_store.dart';
import 'package:grocery_list/widgets/item_widget.dart';
import 'package:grocery_list/widgets/list_buttons.dart';

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
        title: const Text(
          'Grocery List',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            const TextField(
              style: TextStyle(color: Colors.white),
              // onChanged: () {},
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.white),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.white,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Observer(
                builder: (context) {
                  return ListView.builder(
                    itemCount: store.shopList.length,
                    itemBuilder: (context, index) {
                      ItemModel item = store.shopList[index];

                      return ItemWidget(item: item);
                    },
                  );
                },
              ),
            ),
            const ListButtons(),
          ],
        ),
      ),
    );
  }
}
