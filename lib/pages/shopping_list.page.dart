import 'package:fase_6/pages/config_user.page.dart';
import 'package:flutter/material.dart';

import '../models/item_list.model.dart';
import '../models/shopping_list.model.dart';
import '../my_routes.dart';
import '../widgets/card_shopping_cart.widget.dart';
import '../widgets/empty_shopping_list.widget.dart';
import 'add_shopping_list.page.dart';
import 'item_list.page.dart';

class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({super.key});

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  final shoppingList = <ShoppingList>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Minhas listas"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.diamond,
              color: Colors.amber,
            ),
          ),
          IconButton(
            key: ValueKey('btnSettings'),
            onPressed: () {
              Navigator.of(context).pushNamed(MyRoutes.configUser);
            },
            icon: const Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
      body: shoppingList.isEmpty
          ? const EmptyShoppingList()
          : ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              itemCount: shoppingList.length,
              itemBuilder: (ctx, index) {
                return InkWell(
                  onTap: () => navigateToItemList(shoppingList[index]),
                  onLongPress: () => deleteList(index),
                  child: CardShoppingCart(
                    shoppingList: shoppingList[index],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewList,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> navigateToItemList(ShoppingList shoppingList) async {
    final itemsLits = (await Navigator.of(context).pushNamed(MyRoutes.itemsList,
        arguments: shoppingList)) as List<ItemList>?;

    if (itemsLits != null) {
      setState(() {
        shoppingList.items.clear();
        shoppingList.items.addAll(itemsLits);
      });
    }
  }

  void deleteList(int index) {
    setState(() {
      shoppingList.removeAt(index);
    });
  }

  Future<void> addNewList() async {
    final nameList = (await Navigator.of(context)
        .pushNamed(MyRoutes.addShoppingList)) as String?;

    if (nameList != null) {
      setState(() {
        shoppingList.add(ShoppingList(name: nameList));
      });
    }
  }
}
