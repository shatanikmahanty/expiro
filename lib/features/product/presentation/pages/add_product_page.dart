import 'package:expiro/configurations/configurations.dart';
import 'package:expiro/features/app/app.dart';
import 'package:expiro/features/product/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_builder/progress_builder.dart';

import '../../data/blocs/product_cubit.dart';

@RoutePage()
class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  DateTime? _manufacturedDate;
  DateTime? _expiryDate;
  String? productCategory;
  String? productStorage;
  String? productRecyclable;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _specificInstructionsController =
      TextEditingController();
  final TextEditingController _manufacturedDateController =
      TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();

  Future<void> _selectManufacturedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _manufacturedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _manufacturedDate) {
      setState(() {
        _manufacturedDate = picked;
        _manufacturedDateController.text =
            '${_manufacturedDate?.toLocal()}'.split(' ')[0];
      });
    }
  }

  Future<void> _selectExpiryDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _expiryDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _expiryDate) {
      setState(() {
        _expiryDate = picked;
        _expiryDateController.text = '${_expiryDate?.toLocal()}'.split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ExpiroScaffold(
      appBarTitleText: 'Add Item Details',
      centerAppBarTitle: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 4,
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      color: Colors.grey, // Placeholder for product image
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              labelText: 'Name',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextField(
                            keyboardType: TextInputType.number,
                            controller: _quantityController,
                            decoration: const InputDecoration(
                              labelText: 'Quantity',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          GestureDetector(
                            onTap: () => _selectManufacturedDate(context),
                            child: TextFormField(
                              controller: _manufacturedDateController,
                              decoration: const InputDecoration(
                                labelText: 'Manufactured Date',
                                suffixIcon: Icon(Icons.calendar_today),
                              ),
                              enabled: false,
                            ),
                          ),
                          const SizedBox(height: 12),
                          GestureDetector(
                            onTap: () => _selectExpiryDate(context),
                            child: TextFormField(
                              controller: _expiryDateController,
                              decoration: const InputDecoration(
                                labelText: 'Expiry Date',
                                suffixIcon: Icon(Icons.calendar_today),
                              ),
                              enabled: false,
                            ),
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 4,
                child: Container(
                  height: kPadding * 36,
                  padding: const EdgeInsets.all(
                    kPadding * 3,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select product category',
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: theme.primaryColor,
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 3,
                          ),
                          itemBuilder: (context, index) => RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(productCategoryList[index]),
                            value: productCategoryList[index],
                            groupValue: productCategory,
                            // Add your group value here
                            onChanged: (value) {
                              setState(() {
                                productCategory = value;
                              });
                            },
                          ),
                          itemCount: productCategoryList.length,
                        ),
                      ),
                      // Repeat RadioListTile for other storage options
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 4,
                child: Container(
                  height: kPadding * 42,
                  padding: const EdgeInsets.all(
                    kPadding * 3,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Where do you want to store the product?',
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: theme.primaryColor,
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 3.2,
                          ),
                          itemBuilder: (context, index) => RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(productStorageList[index]),
                            value: productStorageList[index],
                            groupValue: productStorage,
                            // Add your group value here
                            onChanged: (value) {
                              setState(() {
                                productStorage = value;
                              });
                            },
                          ),
                          itemCount: productStorageList.length,
                        ),
                      ),
                      const SizedBox(
                        height: kPadding * 1.5,
                      ),
                      TextField(
                        controller: _specificInstructionsController,
                        decoration: const InputDecoration(
                          labelText: 'Add specific instructions',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(
                    kPadding * 3,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Is this product recyclable or non-recyclable?',
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: theme.primaryColor,
                        ),
                      ),
                      Column(children: [
                        RadioListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text('♻️  Recyclable'),
                          value: 'Recyclable',
                          groupValue: productRecyclable,
                          // Add your group value here
                          onChanged: (value) {
                            setState(() {
                              productRecyclable = value;
                            });
                          },
                        ),
                        RadioListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text('⭕  Non Recyclable'),
                          value: 'Non Recyclable',
                          groupValue: productRecyclable,
                          // Add your group value here
                          onChanged: (value) {
                            setState(() {
                              productRecyclable = value;
                            });
                          },
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: CircularProgressBuilder(
                  builder: (context, action, error) => ElevatedButton(
                    onPressed: () async {
                      if (_nameController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill name'),
                          ),
                        );
                        return;
                      } else if (_quantityController.text.isEmpty ||
                          int.tryParse(_quantityController.text) == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill quantity properly'),
                          ),
                        );
                        return;
                      } else if (_expiryDate == null ||
                          _manufacturedDate == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select a date'),
                          ),
                        );
                        return;
                      } else if (productCategory == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select a category'),
                          ),
                        );
                        return;
                      } else if (productStorage == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select a storage option'),
                          ),
                        );
                        return;
                      } else if (productRecyclable == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select a recyclable option'),
                          ),
                        );
                        return;
                      } else {
                        action?.call();
                      }
                    },
                    child: const Text('Submit'),
                  ),
                  onSuccess: () {
                    context.router.back();
                  },
                  action: (progress) async {
                    final product = ProductModel(
                      id: '',
                      name: _nameController.text,
                      quantity: int.tryParse(_quantityController.text) ?? 1,
                      expiryDate: _expiryDate.toString(),
                      manufactureDate: _manufacturedDate.toString(),
                      category: productCategory!,
                      storage: productStorage!,
                      recyclable: productRecyclable!,
                      image: '',
                      storageInstructions: _specificInstructionsController.text,
                    );

                    return await context
                        .read<ProductCubit>()
                        .addProduct(product);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
