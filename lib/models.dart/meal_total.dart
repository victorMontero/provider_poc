import 'package:flutter/foundation.dart';
import 'package:provider_meal_tracker/models.dart/food_list.dart';

class MealModel extends ChangeNotifier {
  late FoodListModel _foodList;

  final List<int> _itemIds = [];

  FoodListModel get foodList => _foodList;

  set meal(FoodListModel newMeal) {
    _foodList = newMeal;
    notifyListeners();
  }

  List<Item> get items => _itemIds.map((id) => _foodList.getByPosition(id)).toList();

  int get totalcalories => items.fold(0, (total, current) => total + current.calories);

  void add(Item item) {
    _itemIds.add(item.id);
    notifyListeners();
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
    notifyListeners();
  }
}
