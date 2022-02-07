import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_meal_tracker/models.dart/food_list.dart';
import 'package:provider_meal_tracker/models.dart/meal_total.dart';

class FoodListPage extends StatelessWidget {
  const FoodListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _AppBar(),
          const SliverToBoxAdapter(child: SizedBox(height: 16.0)),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) => _FoodListItem(index)),
          ),
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Meal Tracker', style: Theme.of(context).textTheme.headline1),
      floating: true,
      actions: [
        IconButton(icon: const Icon(Icons.food_bank), onPressed: () => Navigator.pushNamed(context, '/total')),
      ],
    );
  }
}

class _FoodListItem extends StatelessWidget {
  final int index;

  const _FoodListItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = context.select<FoodListModel, Item>(
      (foodList) => foodList.getByPosition(index),
    );
    var textTheme = Theme.of(context).textTheme.headline6;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: LimitedBox(
        maxHeight: 48.0,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: item.color,
              ),
            ),
            const SizedBox(width: 24.0),
            Expanded(
              child: Text(item.name, style: textTheme),
            ),
            const SizedBox(width: 24),
            _AddButton(item: item),
          ],
        ),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isInCart = context.select<MealModel, bool>(
      (cart) => cart.items.contains(item),
    );

    return TextButton(
      onPressed: isInCart
          ? null
          : () {
              var total = context.read<MealModel>();
              total.add(item);
            },
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed)) {
            return Theme.of(context).primaryColor;
          }
          return null;
        }),
      ),
      child: isInCart ? const Icon(Icons.check, semanticLabel: 'added') : const Text('ADD'),
    );
  }
}
