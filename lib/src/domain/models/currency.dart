class Currency {
  final String name;
  final String cc;
  final String symbol;

  Currency(this.name, this.cc, this.symbol);

  static Currency fromJson(json) =>
      Currency(json['name'], json['cc'], json['symbol']);
}
