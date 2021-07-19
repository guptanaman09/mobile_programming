import 'package:hive/hive.dart';

///Created by Naman Gupta on 16/7/21.

part 'to_do_model.g.dart';

@HiveType(typeId: 0)
class ToDoModel {
  @HiveField(0)
  String text;

  @HiveField(1)
  bool isCompleted = false;

  ToDoModel(this.text);
}
