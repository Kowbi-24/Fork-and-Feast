
import 'package:hive/hive.dart';
import 'boxes.dart';

part 'food.g.dart';

@HiveType(typeId: 2)
class Food{

  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String description;

  @HiveField(3)
  double price;

  @HiveField(4)
  String imgPath;

  // Constructor
  Food(this.id, this.name, this.description, this.imgPath, this.price);
}
