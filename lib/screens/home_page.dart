import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:grocery_list/models/item_model.dart';
import 'package:grocery_list/stores/shop_list_store.dart';
import 'package:grocery_list/widgets/item_widget.dart';
import 'package:grocery_list/widgets/list_buttons.dart';
import 'package:grocery_list/widgets/list_empty_widget.dart';
import 'package:grocery_list/widgets/search_progress.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //Instanciando a Store
    final store = ShopListStore();

    return GestureDetector(
      //Ao clicar na tela fecha o teclado do TextField de busca e adição de item
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
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
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(
                'lib/assets/images/appbar2.png',
                height: 80,
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
              //Passa propriedades da Store para serem usadas no widget
              Observer(builder: (context) {
                return SearchAndProgress(
                  setFilter: store.setFilter,
                  itemsChecked: store.totalChecked,
                  listLength: store.shopList.length,
                  filter: store.filter,
                );
              }),
              FutureBuilder(
                //Espera recuperar os itens no BD para construir a lista
                future: store.loadItems(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        ),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: Observer(
                        builder: (context) {
                          return store.shopList.isEmpty
                              ? const ListEmptyWidget()
                              : ListView.builder(
                                  itemCount: store.listFiltered.length,
                                  itemBuilder: (context, index) {
                                    ItemModel item = store.listFiltered[index];

                                    return ItemWidget(
                                      item: item,
                                      delete: () {
                                        store.removeItem(item);
                                      },
                                      totalChecked: store.totalChecked,
                                      listLength: store.shopList.length,
                                    );
                                  },
                                );
                        },
                      ),
                    );
                  }
                },
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
      ),
    );
  }
}
