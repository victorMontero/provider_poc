import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_meal_tracker/common/theme.dart';
import 'package:provider_meal_tracker/screens/food_list.dart';
import 'package:provider_meal_tracker/screens/login.dart';
import 'package:provider_meal_tracker/screens/meal_total.dart';

import 'models.dart/food_list.dart';
import 'models.dart/meal_total.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => FoodListModel()),
        ChangeNotifierProxyProvider<FoodListModel, MealModel>(
          create: (context) => MealModel(),
          update: (context, foodList, total){
            if(total == null) throw ArgumentError.notNull('total');
            total.meal = foodList;
            return total;
          },
        ),
      ],
      child: MaterialApp(
        title: 'Provider Poc',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/' : (context) => const LoginPage(),
          '/food_list': (context) => const FoodListPage(),
          '/total': (context) => const MealTotalPage(),
        },
      ),
      );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
    );
  }
}
