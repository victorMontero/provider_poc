import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('welcome', style: Theme.of(context).textTheme.headline1),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'username',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'password',
                ),
                obscureText: true,
              ),
              const SizedBox(
                height: 24.0,
              ),
              ElevatedButton(
                child: const Text('ENTER'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/food_list');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
