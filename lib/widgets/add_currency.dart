// import 'package:flutter/material.dart';
// import '../constants.dart';
//
// class AddCurrency extends StatefulWidget {
//   const AddCurrency({
//     super.key,
//   });
//
//   @override
//   State<AddCurrency> createState() => _AddCurrencyState();
// }
//
// class _AddCurrencyState extends State<AddCurrency> {
//
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         TextFormFieldSource(
//           data: 'Add Currency Name',
//           controller: currencyNameController,
//         ),
//         SizedBox(
//           height: kDefaultPadding,
//         ),
//         TextFormFieldSource(
//           data: 'Add Currency Price',
//           controller: currencyPriceController,
//         ),
//         SizedBox(
//           height: kDefaultPadding,
//         ),
//         TextFormFieldSource(
//           data: 'Add Currency Percentage',
//           controller: currencyPercentController,
//         ),
//         SizedBox(
//           height: kDefaultPadding,
//         ),
//         ElevatedButton(
//           onPressed: () {
//             addNewCurrency(
//               currencyNameController.text,
//               double.parse(currencyPriceController.text),
//               double.parse(currencyPercentController.text),
//             );
//
//             Navigator.of(context).pop();
//
//             for (TextEditingController controller in [
//               currencyNameController,
//               currencyPriceController,
//               currencyPercentController
//             ]) {
//               controller.clear();
//             }
//           },
//           child: const Text('Add currency now!'),
//         ),
//       ],
//     );
//   }
// }
//
// class TextFormFieldSource extends StatelessWidget {
//   final String? data;
//   final TextEditingController? controller;
//
//   const TextFormFieldSource({
//     super.key,
//     required this.data,
//     required this.controller,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           border: Border.all(
//             color: Colors.grey,
//           )),
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
//         child: TextFormField(
//           textAlign: TextAlign.center,
//           decoration: InputDecoration(
//             border: InputBorder.none,
//             hintText: '$data!',
//           ),
//           controller: controller,
//         ),
//       ),
//     );
//   }
// }
