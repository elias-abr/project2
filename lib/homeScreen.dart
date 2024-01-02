import 'package:flutter/material.dart';
import 'api.dart';
import 'addItemScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> _products = [];

  @override
  void initState() {
    super.initState();
    _getProducts();
  }

  Future<void> _getProducts() async {
    final products = await Api.getProducts();
    setState(() {
      _products = products;
    });
  }

  void _navigateToAddItemScreen(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddItemScreen()),
    );
    if (result != null) {
      _getProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text('Inventory'),
        ),
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Image.network(product['image']),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ID: ${product['ID']}'),
                      Text('Name: ${product['name']}'),
                      Text('Description: ${product['description']}'),
                      Text('Quantity: ${product['quantity']}'),
                      Text('Cost: ${product['cost']}'),
                      Text('Price: ${product['price']}'),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddItemScreen(context),
        tooltip: 'Add Item',
        child: Icon(Icons.add),
      ),
    );
  }
}
