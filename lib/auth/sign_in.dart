import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../widgets/global_widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  bool isAwait = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Log in',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          shadowColor: Color.fromARGB(255, 53, 41, 43),
          backgroundColor: Color.fromARGB(255, 53, 41, 43)),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ModalProgressHUD(
          inAsyncCall: isAwait,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.25,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your Email'),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.05,
                ),
                TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your Password'),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.03,
                ),
                Center(
                    child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'sign_up'),
                  child: Text(
                    'New? Register here',
                    style: TextStyle(color: Colors.blue, fontSize: 13),
                  ),
                )),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.25,
                ),
                RoundedButton(
                  color: Colors.blueAccent,
                  title: 'Log in',
                  onPressed: () async {
                    setState(() {
                      isAwait = true;
                    });
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        email = '';
                        password = '';
                        Navigator.pushNamed(context, 'main');
                      } else {
                        setState(() {
                          isAwait = false;
                        });
                        const snackBar =
                            SnackBar(content: Text('Failed to Login'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    } catch (e) {
                      print('firebase$e');
                      const snackBar = SnackBar(
                          content: Text(
                        'Failed to Login',
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    setState(() {
                      isAwait = false;
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
