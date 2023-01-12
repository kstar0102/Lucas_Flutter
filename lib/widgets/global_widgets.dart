import 'package:flutter/material.dart';

class RoundedButton extends StatefulWidget {
  const RoundedButton(
      {Key? key,
      required this.color,
      required this.title,
      required this.onPressed})
      : super(key: key);

  final Color color;
  final String title;
  final VoidCallback? onPressed;

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Material(
          elevation: 5.0,
          color: widget.color,
          borderRadius: BorderRadius.circular(30.0),
          child: MaterialButton(
            onPressed: widget.onPressed,
            minWidth: 200,
            height: 40,
            child: Text(
              widget.title,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ));
  }
}

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter your string',
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  border:
      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.lightBlue, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(30))),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.lightBlue, width: 2),
      borderRadius: BorderRadius.all(Radius.circular(30))),
);
