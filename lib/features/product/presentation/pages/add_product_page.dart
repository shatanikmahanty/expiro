import 'dart:io';

import 'package:expiro/configurations/configurations.dart';
import 'package:expiro/features/app/app.dart';
import 'package:expiro/features/app/presentation/app_image_picker.dart';
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
  ProductModel product = ProductModel(
    id: '',
    name: '',
    quantity: 1,
    manufactureDate: DateTime.now(),
    expiryDate: DateTime.now(),
    category: null,
    location: null,
    storageInstructions: null,
    recyclable: null,
  );

  String? _pickedImagePath;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController(
    text: '1',
  );
  final TextEditingController _specificInstructionsController = TextEditingController();
  final TextEditingController _manufacturedDateController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();

  Future<void> _selectManufacturedDate(BuildContext context) async {
    final currentManufacturedDate = product.manufactureDate;
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: currentManufacturedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != currentManufacturedDate) {
      setState(() {
        product = product.copyWith(manufactureDate: picked);
        _manufacturedDateController.text = '${product.manufactureDate.toLocal()}'.split(' ')[0];
      });
    }
  }

  Future<void> _selectExpiryDate(BuildContext context) async {
    final currentExpiryDate = product.expiryDate;
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: currentExpiryDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != currentExpiryDate) {
      setState(() {
        product = product.copyWith(expiryDate: picked);
        _expiryDateController.text = '${product.expiryDate.toLocal()}'.split(' ')[0];
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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    AppImagePicker(
                      widgetBuilder: (path) {
                        if (path == null) {
                          return SizedBox(
                            height: 200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_a_photo_outlined,
                                  size: kPadding * 6,
                                  color: theme.primaryColor,
                                ),
                                const SizedBox(width: kPadding * 2),
                                Text(
                                  'Add photo',
                                  style: theme.textTheme.headlineSmall?.copyWith(
                                    color: theme.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Image.file(
                            File(path),
                            fit: BoxFit.contain,
                            height: 200,
                            width: double.infinity,
                          );
                        }
                      },
                      onImageChanged: (String? path) {
                        _pickedImagePath = path;
                      },
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
                          TextFormField(
                            controller: _manufacturedDateController,
                            decoration: InputDecoration(
                              labelText: 'Manufactured Date',
                              suffixIcon: GestureDetector(
                                onTap: () => _selectManufacturedDate(context),
                                child: const Icon(Icons.calendar_today),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _expiryDateController,
                            decoration: InputDecoration(
                              labelText: 'Expiry Date',
                              suffixIcon: GestureDetector(
                                onTap: () => _selectExpiryDate(context),
                                child: const Icon(Icons.calendar_today),
                              ),
                            ),
                            inputFormatters: [
                              //create DateInputFormatter(),
                            ],
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
                color: const Color(0xffF3F6FF),
                surfaceTintColor: theme.colorScheme.primary.withOpacity(0.2),
                child: Container(
                  height: kPadding * 38,
                  padding: const EdgeInsets.all(
                    kPadding * 3,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _HeaderText(headerText: 'Select product category'),
                      Expanded(
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 3,
                          ),
                          itemBuilder: (context, index) => RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(productCategoryList[index]),
                            value: productCategoryList[index],
                            groupValue: product.category,
                            // Add your group value here
                            onChanged: (value) {
                              if (value == null) {
                                return;
                              }
                              product = product.copyWith(
                                category: value,
                              );
                              setState(() {});
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
                color: const Color(0xffF3F6FF),
                surfaceTintColor: theme.colorScheme.primary.withOpacity(0.2),
                child: Container(
                  height: kPadding * 42,
                  padding: const EdgeInsets.all(
                    kPadding * 3,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _HeaderText(
                        headerText: 'Choose storage location',
                      ),
                      Expanded(
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 3.2,
                          ),
                          itemBuilder: (context, index) => RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(productStorageList[index]),
                            value: productStorageList[index],
                            groupValue: product.location,
                            // Add your group value here
                            onChanged: (value) {
                              if (value == null) {
                                return;
                              }
                              product = product.copyWith(
                                location: value,
                              );
                              setState(() {});
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
                color: const Color(0xffF3F6FF),
                surfaceTintColor: theme.colorScheme.primary.withOpacity(0.2),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(
                    kPadding * 3,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _HeaderText(headerText: 'Recyclable status'),
                      Column(children: [
                        RadioListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text('♻️  Recyclable'),
                          value: 'Recyclable',
                          groupValue: product.isRecyclableStr,
                          // Add your group value here
                          onChanged: (value) {
                            bool isRecyclable = value == 'Recyclable';
                            product = product.copyWith(
                              recyclable: isRecyclable,
                            );
                            setState(() {});
                          },
                        ),
                        RadioListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text('⭕  Non Recyclable'),
                          value: 'Non Recyclable',
                          groupValue: product.isRecyclableStr,
                          onChanged: (value) {
                            bool isRecyclable = value == 'Recyclable';
                            product = product.copyWith(
                              recyclable: isRecyclable,
                            );
                            setState(() {});
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
                      } else if (_quantityController.text.isEmpty || int.tryParse(_quantityController.text) == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill quantity properly'),
                          ),
                        );
                        return;
                      } else if (_expiryDateController.text.isEmpty || _manufacturedDateController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select a date'),
                          ),
                        );
                        return;
                      } else if (product.category == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select a category'),
                          ),
                        );
                        return;
                      } else if (product.location == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select a storage option'),
                          ),
                        );
                        return;
                      } else if (product.recyclable == null) {
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
                    final productCubit = context.read<ProductCubit>();
                    if (_pickedImagePath != null) {
                      final imageUrl = await productCubit.uploadImage(_pickedImagePath!);
                      product = product.copyWith(image: imageUrl);
                    }

                    final productRes = product.copyWith(
                      id: '',
                      name: _nameController.text,
                      quantity: int.tryParse(_quantityController.text) ?? 1,
                      location: product.location,
                      storageInstructions: _specificInstructionsController.text,
                    );

                    return await productCubit.addProduct(productRes);
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

class _HeaderText extends StatelessWidget {
  const _HeaderText({required this.headerText});

  final String headerText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        headerText,
        style: theme.textTheme.titleMedium?.copyWith(
          color: theme.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
