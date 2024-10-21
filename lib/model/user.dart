
import 'package:hive/hive.dart';
import 'boxes.dart';

part 'user.g.dart';

@HiveType(typeId: 3)
class User{

  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String phoneNum;

  @HiveField(3)
  String imgPath;

  @HiveField(4)
  String email;

  @HiveField(5)
  String password;

  // Constructor
  User(this.id, this.name, this.email, this.password, this.phoneNum, this.imgPath);
}

