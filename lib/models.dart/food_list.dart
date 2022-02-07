import 'package:flutter/material.dart';

class FoodListModel {
  static List<String> itemNames = [
    'apple',
    'banana',
    'orange',
    'egg',
    'toast',
    'butter',
    'sugar',
    'salt',
    'orange juice',
    'bread slice',
    'cereal',
    'bacon',
    'piece of cake',
    'coffee',
    'milk',
  ];

  Item getById(int id) => Item(id, itemNames[id % itemNames.length]);

  Item getByPosition(int position) {
    return getById(position);
  }
}

@immutable
class Item {
  final int id;
  final String name;
  final Color color;
  final int calories = 42;

  Item(this.id, this.name) : color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
