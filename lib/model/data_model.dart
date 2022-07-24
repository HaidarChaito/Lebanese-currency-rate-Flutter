import 'dart:convert';

class DataModel {
  final String unl95Price;
  final String unl98Price;
  final String diselPrice;
  final String gasPrice;
  final String gasCurrentTime;

  final String buyPrice;
  final String sellPrice;
  final String rateCurrentTime;
  final String sayrafa;

  DataModel(
      this.unl95Price,
      this.unl98Price,
      this.diselPrice,
      this.gasPrice,
      this.gasCurrentTime,
      this.buyPrice,
      this.sellPrice,
      this.rateCurrentTime,
      this.sayrafa);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'unl95Price': unl95Price,
      'unl98Price': unl98Price,
      'diselPrice': diselPrice,
      'gasPrice': gasPrice,
      'gasCurrentTime': gasCurrentTime,
      'buyPrice': buyPrice,
      'sellPrice': sellPrice,
      'rateCurrentTime': rateCurrentTime,
      'sayrafa': sayrafa,
    };
  }

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      map['unl95Price'] as String,
      map['unl98Price'] as String,
      map['diselPrice'] as String,
      map['gasPrice'] as String,
      map['gasCurrentTime'] as String,
      map['buyPrice'] as String,
      map['sellPrice'] as String,
      map['rateCurrentTime'] as String,
      map['sayrafa'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DataModel.fromJson(String source) =>
      DataModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
