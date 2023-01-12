import 'package:flutter/material.dart';
import 'package:larica/widgets/global_widgets.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RoundedButton(
                color: Colors.lightBlue,
                title: 'Go to Store',
                onPressed: () => Navigator.pushNamed(context, 'main')),
            RoundedButton(
                color: Colors.lightBlue,
                title: 'Log in',
                onPressed: () => Navigator.pushNamed(context, 'sign_in')),
            RoundedButton(
              color: Colors.lightGreen,
              title: 'Register',
              onPressed: () => Navigator.pushNamed(context, 'sign_up'),
            )
          ],
        ),
      ),
    );
  }
}
