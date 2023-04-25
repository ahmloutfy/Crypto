import 'package:crypto/widgets/add_currency.dart';
import 'package:crypto/widgets/currency_card.dart';
import 'package:flutter/material.dart';






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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .primaryColor,
      body: const SafeArea(
        child: CurrencyCard(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: const Icon(Icons.notification_add),
        onPressed: () => showDialog(context: context, builder: (context) => const AlertDialog(
            content: AddCurrency(),
        ),
        ),
      ),
    );
  }


}

/* ChatGPT assistance:

https://chat.openai.com/c/163c7ff8-c2ab-4252-972b-5293138211c9/

 */