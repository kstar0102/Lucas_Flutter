// ignore_for_file:  prefer_const_constructors
import 'dart:ffi';
import 'dart:io';
//import 'package:http';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:larica/payment/paypal.dart';
import 'package:larica/screens/product_log.dart';
import 'package:larica/widgets/global_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get child => null;

  @override
  Widget build(BuildContext context) {
    var circle = BoxShape.circle;
    final _auth = FirebaseAuth.instance;
    final currentUser = _auth.currentUser;
    Widget iconWidget = IconButton(
        onPressed: () => Navigator.pushNamed(context, 'auth'),
        icon: Icon(
          Icons.login,
          color: Colors.white,
        ));
    if (currentUser != null) {
      iconWidget = IconButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext ctx) {
                  return AlertDialog(
                    title: const Text('Please Confirm'),
                    content: const Text('Are you sure to sign out?'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            _auth.signOut();
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                'auth', (route) => false);
                          },
                          child: const Text('Yes')),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('No'))
                    ],
                  );
                });
          },
          icon: Icon(
            Icons.logout,
            color: Colors.white,
          ));
    }

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
              actions: [iconWidget],
              title: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              shadowColor: Color.fromARGB(255, 53, 41, 43),
              backgroundColor: Color.fromARGB(255, 53, 41, 43)),
        ),
        // Padding(
        //   padding: EdgeInsets.only(top: 10),
        //   child: Container(
        //       //alignment: CrossAxisAlignment,
        //       // margin: EdgeInsets.only(top: 15),
        //       // ignore: prefer_const_constructors
        //       color: Color.fromARGB(255, 53, 41, 43),
        //       width: MediaQuery.of(context).size.width,
        //       height: MediaQuery.of(context).size.height * 0.05,
        //       alignment: Alignment.centerLeft,
        //       child: Padding(
        //         padding: EdgeInsets.only(left: 15),
        //         child: Text(
        //           "Menu",
        //           style: TextStyle(
        //             color: Colors.white,
        //             fontSize: 20,
        //             decoration: TextDecoration.underline,
        //             //decorationStyle: TextDecorationStyle.wavy,
        //           ),
        //           textAlign: TextAlign.left,
        //         ),
        //       )
        //
        //       //alignment: ,
        //
        //       ),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15),
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  alignment: Alignment.bottomRight,
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  // ignore: sort_child_properties_last

                  child: Container(
                    child: ElevatedButton(
                      // ignore: prefer_const_constructors
                      style: ButtonStyle(
                        alignment: Alignment.center,
                        //shape: circle,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PaypalScreen(),
                        ));
                      },
                      child: Text('PayPal'),
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15),
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  alignment: Alignment.bottomRight,
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  // ignore: sort_child_properties_last

                  child: Container(
                    child: ElevatedButton(
                      // ignore: prefer_const_constructors
                      style: ButtonStyle(
                        alignment: Alignment.center,
                        //shape: circle,
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => product_log());
                      },
                      child: Text('+'),
                    ),
                  )),
            ),
          ],
        )
      ],
    );
  }

  void showmodal() {}
}
