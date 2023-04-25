import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/currencies.dart';

class AddCurrency extends StatefulWidget {



  const AddCurrency({
    super.key,
    });

  @override
  State<AddCurrency> createState() => _AddCurrencyState();
}

class _AddCurrencyState extends State<AddCurrency> {

  void addNewCurrency(String cuName, double cuPrice, double cuPercentage) {

    final newCu = Currencies(
      currencyName: cuName,
      currencyPrice: cuPrice,
      currencyPercent: cuPercentage,

    );

    currenciesList.add(newCu);


  }

  @override
  void dispose() {
    currencyNameController.dispose();
    currencyPriceController.dispose();
    currencyPercentController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {



    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormFieldSource(
          data: 'Add Currency Name',
          controller: currencyNameController,
        ),
        SizedBox(
          height: kDefaultPadding,
        ),
        TextFormFieldSource(
          data: 'Add Currency Price',
          controller: currencyPriceController,
        ),
        SizedBox(
          height: kDefaultPadding,
        ),
        TextFormFieldSource(
          data: 'Add Currency Percentage',
          controller: currencyPercentController,
        ),
        SizedBox(
          height: kDefaultPadding,
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              addNewCurrency(
                currencyNameController.text,
                double.parse(currencyPriceController.text),
                double.parse(currencyPercentController.text),
              );

              Navigator.of(context).pop();
            });
          },
          child: const Text('Add currency now!'),
        ),
      ],
    );
  }
}

class TextFormFieldSource extends StatelessWidget {
  final String? data;
  final TextEditingController? controller;

  const TextFormFieldSource({
    super.key,
    required this.data,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey,
          )),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: TextFormField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '$data!',
          ),
          controller: controller,
        ),
      ),
    );
  }
}
