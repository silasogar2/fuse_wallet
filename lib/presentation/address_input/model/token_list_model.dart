import 'dart:convert';

TokenList tokenListFromJson(String str) => TokenList.fromJson(json.decode(str));

String tokenListToJson(TokenList data) => json.encode(data.toJson());

class TokenList {
  String symbol;
  String name;
  int decimals;
  String address;
  double amount;

  TokenList({
    required this.symbol,
    required this.name,
    required this.decimals,
    required this.address,
    required this.amount,
  });

  factory TokenList.fromJson(Map<String, dynamic> json) => TokenList(
        symbol: json["symbol"],
        name: json["name"],
        decimals: json["decimals"],
        address: json["address"],
        amount: json["amount"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "name": name,
        "decimals": decimals,
        "address": address,
        "amount": amount,
      };
}
