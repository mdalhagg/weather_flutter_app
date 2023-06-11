import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'setting.g.dart';

@HiveType(typeId: 1)
class Setting extends HiveObject {
  @override
  String toString() => 'Setting';
  @HiveField(0)
  var primaryColor = const Color(0xFF3F51B5);

}