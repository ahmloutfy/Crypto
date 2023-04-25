import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/currencies.dart';

class CurrencyList extends StatefulWidget {

  const CurrencyList({Key? key}) : super(key: key);

  @override
  State<CurrencyList> createState() => _CurrencyListState();
}

class _CurrencyListState extends State<CurrencyList> {



  @override
  Widget build(BuildContext context) {



    return SizedBox(
      height: 300,
      child: ListView.builder(

        shrinkWrap: true,
        itemCount: currenciesList.length,
        itemBuilder: (context , index) => Card(
          color: Colors.white,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.all(15),
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    color: Colors.purple,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 5),
                        blurRadius: 15,
                      ),
                    ]),
                child: Center(
                  child: Text(
                    currenciesList[index].currencyName.substring(0, 1).toUpperCase(),
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(
                width: kDefaultPadding,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currenciesList[index].currencyName,

                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  SizedBox(
                    width: kDefaultPadding,
                  ),

                  Text(
                    '\$${currenciesList[index].currencyPrice}',
                  ),
                  SizedBox(
                    width: kDefaultPadding,
                  ),

                  Text(
                    '1 hour: ${currenciesList[index].currencyPercent}%',
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
