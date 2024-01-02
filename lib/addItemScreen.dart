import 'package:flutter/material.dart';
import 'api.dart';

class AddItemScreen extends StatefulWidget {
  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _quantityController = TextEditingController();
  final _costController = TextEditingController();
  final _priceController = TextEditingController();
  final _imageController = TextEditingController();

  Future<void> _addItem() async {
    final name = _nameController.text;
    final description = _descriptionController.text;
    final quantity = _quantityController.text;
    final cost = _costController.text;
    final price = _priceController.text;
    final image = _imageController.text;

    if (name.isNotEmpty == true &&
        description.isNotEmpty == true &&
        quantity.isNotEmpty == true &&
        cost.isNotEmpty == true &&
        price.isNotEmpty == true &&
        image.isNotEmpty == true) {
      await Api.addItem(name, description, quantity, cost, price, image);
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _quantityController,
                decoration: InputDecoration(
                  labelText: 'Quantity',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter the quantity';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _costController,
                decoration: InputDecoration(
                  labelText: 'Cost',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a cost';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(
                  labelText: 'Price',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a price';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _imageController,
                decoration: InputDecoration(
                  labelText: 'Image URL',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter an image URL';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _addItem();
                  }
                },
                child: Text('Add Item'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
