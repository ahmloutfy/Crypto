class Currencies {
  final String currencyName;
  final double currencyPrice;
  final double currencyPercent;

  Currencies({required this.currencyName, required this.currencyPrice, required this.currencyPercent});




}


final List<Currencies> currenciesList = [

  Currencies(
      currencyName: 'Bitcoin',
      currencyPrice: 0.0001,
      currencyPercent: 0.01
  ),

];