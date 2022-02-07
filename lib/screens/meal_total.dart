import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_meal_tracker/models.dart/meal_total.dart';

class MealTotalPage extends StatelessWidget {
  const MealTotalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('total', style: Theme.of(context).textTheme.headline1),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.green,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: _FoodList(),
              ),
            ),
            const Divider(
              height: 4,
              color: Colors.black,
            ),
            _MeatTotal()
          ],
        ),
      ),
    );
  }
}

class _FoodList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.headline6;

    var total = context.watch<MealModel>();

    return ListView.builder(
      itemCount: total.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: () {
            total.remove(total.items[index]);
          },
        ),
        title: Text(
          total.items[index].name,
          style: itemNameStyle,
        ),
      ),
    );
  }
}

class _MeatTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hugeStyle = Theme.of(context).textTheme.headline1!.copyWith(fontSize: 32);

    return SizedBox(
      height: 200.0,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<MealModel>(builder: (context, meal, child) => Text('Calories: ${meal.totalcalories}', style: hugeStyle)),
            const SizedBox(width: 16),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('not suported yet')));
              },
              style: TextButton.styleFrom(primary: Colors.white),
              child: const Text('add this meal'),
            ),
          ],
        ),
      ),
    );
  }
}
