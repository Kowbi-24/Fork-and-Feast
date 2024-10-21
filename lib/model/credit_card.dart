import 'package:hive/hive.dart';
import 'boxes.dart';

part 'credit_card.g.dart';

@HiveType(typeId: 4)
class CreditCard{

  @HiveField(0)
  String cardNum;

  @HiveField(1)
  String expiryDate;

  @HiveField(2)
  String type;

  @HiveField(3)
  late int userId;

  @HiveField(4)
  String holderName;

  CreditCard(this.cardNum, this.expiryDate, this.type, this.holderName);
}
