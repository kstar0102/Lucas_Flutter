// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

class product_log extends StatefulWidget {
  const product_log({super.key});

  @override
  State<product_log> createState() => _product_logState();
}

class _product_logState extends State<product_log> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _productName = TextEditingController();
    TextEditingController _productprice = TextEditingController();
    //TextEditingController _productImage = TextEditingController();

    return Scaffold(
        body: Container(
      margin: EdgeInsets.all(15),
      child: SingleChildScrollView(
          child: Column(
        children: [
          Form(
              child: Column(
            children: [
              TextFormField(
                controller: _productName,
                autofocus: true,
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                decoration: InputDecoration(
                  labelText: "Nome do produto",
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 73, 69, 69),
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ),
              TextFormField(
                controller: _productprice,
                autofocus: true,
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                decoration: InputDecoration(
                  labelText: "Preço",
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 73, 69, 69),
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 15)),
              ElevatedButton(onPressed: () {}, child: Text("Tirar uma foto "))
            ],
          ))
        ],
      )),
    ));
  }
}


// showModalBottomSheet<void>(
//             context: context,
//             builder: (BuildContext context) {
//               return Container(
//                 height: 200,
//                 color: Colors.amber,
//                 child: Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       const Text('Modal BottomSheet'),
//                       ElevatedButton(
//                         child: const Text('Close BottomSheet'),
//                         onPressed: () => Navigator.pop(context),
//                       ),
//                     ],
//                   ),
//                 ),
//               );