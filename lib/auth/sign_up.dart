import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:larica/widgets/global_widgets.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../screens/home_screen.dart';

const List<Widget> types = <Widget>[
  Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text('sou uma empresa')),
  Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text('sou um consumidor')),
];

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  bool isAwait = false;
  final List<bool> _userType = <bool>[true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        shadowColor: Color.fromARGB(255, 53, 41, 43),
        backgroundColor: Color.fromARGB(255, 53, 41, 43),
      ),
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
                  height: MediaQuery.sizeOf(context).height * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: ToggleButtons(
                      direction: Axis.horizontal,
                      onPressed: (index) {
                        setState(() {
                          for (int i = 0; i < _userType.length; ++i) {
                            _userType[i] = i == index;
                          }
                        });
                      },
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderColor: Colors.blueAccent,
                      selectedBorderColor: Colors.blue[700],
                      selectedColor: Colors.white,
                      fillColor: Colors.blue[700],
                      color: Colors.blue[400],
                      constraints: BoxConstraints(minHeight: 40, minWidth: 100),
                      children: types,
                      isSelected: _userType),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.03,
                ),
                Center(
                    child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'sign_in'),
                  child: Text(
                    'Go to log in',
                    style: TextStyle(color: Colors.blue, fontSize: 13),
                  ),
                )),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.15,
                ),
                RoundedButton(
                  color: Colors.blueAccent,
                  title: 'Sign Up',
                  onPressed: () async {
                    setState(() {
                      isAwait = true;
                    });
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (newUser != null) {
                        User? reg_user = newUser.user;
                        String uid = reg_user!.uid;
                        bool isCompany = true;
                        if (_userType[0]) {
                          isCompany = true;
                        } else {
                          isCompany = false;
                        }

                        await FirebaseFirestore.instance
                            .collection("users")
                            .doc("user${uid}")
                            .set({
                              'type': isCompany,
                            })
                            .then((value) => print("success save"))
                            .catchError((e) => print("failed${e.toString()}"));

                        Navigator.pushNamed(context, 'main');
                      } else {
                        const snackBar = SnackBar(
                            content: Text(
                          'Failed to regist',
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        ));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        setState(() {
                          isAwait = false;
                        });
                      }
                    } catch (e) {
                      String str = e.toString();
                      print('firebase$str');
                      SnackBar snackBar = SnackBar(
                          content: Text('Failed to register: $str',
                              style:
                                  TextStyle(color: Colors.red, fontSize: 20)));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    setState(() {
                      isAwait = false;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
