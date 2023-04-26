import 'package:flutter/material.dart';
import 'constants.dart';
import 'models/currencies.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crypto',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Crypto'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void addNewCurrency(String cuName, double cuPrice, double cuPercentage) {
    final newCu = Currencies(
      currencyName: cuName,
      currencyPrice: cuPrice,
      currencyPercent: cuPercentage,
    );

    currenciesList.add(newCu);
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Cryptocurrencies',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: currenciesList.length,
                    itemBuilder: (context, index) => Card(
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
                                currenciesList[index]
                                    .currencyName
                                    .substring(0, 1)
                                    .toUpperCase(),
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
                          Expanded(
                            child: Column(
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
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                currenciesList.removeAt(index);
                              });
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.pink,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink,
          child: const Icon(Icons.notification_add),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Add Currency Name!',
                                ),
                                controller: currencyNameController,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Add Currency Price!',
                                ),
                                controller: currencyPriceController,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Add Currency Percentage!',
                                ),
                                controller: currencyPercentController,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              addNewCurrency(
                                currencyNameController.text,
                                double.parse(currencyPriceController.text),
                                double.parse(currencyPercentController.text),
                              );

                              Navigator.of(context).pop();

                              for (TextEditingController controller in [
                                currencyNameController,
                                currencyPriceController,
                                currencyPercentController
                              ]) {
                                controller.clear();
                              }
                            },
                            child: const Text('Add currency now!'),
                          ),
                        ],
                      ),
                    ));
          }),
    );
  }
}

/* ChatGPT assistance:

https://chat.openai.com/c/163c7ff8-c2ab-4252-972b-5293138211c9/

 */
