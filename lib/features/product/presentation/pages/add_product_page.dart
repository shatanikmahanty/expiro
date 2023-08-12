import 'package:expiro/configurations/configurations.dart';
import 'package:expiro/features/app/app.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  DateTime? _manufacturedDate;
  DateTime? _expiryDate;

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
                          const TextField(
                            decoration: InputDecoration(labelText: 'Name'),
                          ),
                          const SizedBox(height: 12),
                          const TextField(
                            decoration: InputDecoration(labelText: 'Quantity'),
                          ),
                          const SizedBox(height: 12),
                          GestureDetector(
                            onTap: () => _selectManufacturedDate(context),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Manufactured Date',
                                suffixIcon: Icon(Icons.calendar_today),
                              ),
                              enabled: false,
                              initialValue: _manufacturedDate != null
                                  ? '${_manufacturedDate?.toLocal()}'
                                      .split(' ')[0]
                                  : '',
                            ),
                          ),
                          const SizedBox(height: 12),
                          GestureDetector(
                            onTap: () => _selectExpiryDate(context),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Expiry Date',
                                suffixIcon: Icon(Icons.calendar_today),
                              ),
                              enabled: false,
                              initialValue: _expiryDate != null
                                  ? '${_expiryDate?.toLocal()}'.split(' ')[0]
                                  : '',
                            ),
                          ),
                          const SizedBox(height: 12),
                          // Repeat RadioListTile for other categories
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
                            groupValue: null,
                            // Add your group value here
                            onChanged: (value) {
                              // Handle selection
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
                            groupValue: null,
                            // Add your group value here
                            onChanged: (value) {
                              // Handle selection
                            },
                          ),
                          itemCount: productStorageList.length,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Add specific instructions',
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
                          groupValue: null,
                          // Add your group value here
                          onChanged: (value) {
                            // Handle selection
                          },
                        ),
                        RadioListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text('⭕  Non Recyclable'),
                          value: 'Non Recyclable',
                          groupValue: null,
                          // Add your group value here
                          onChanged: (value) {
                            // Handle selection
                          },
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle submission
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
