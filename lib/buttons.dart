import 'package:flutter/material.dart';

const List<String> buttons = [
  'C',
  '+/-',
  '%',
  'DEL',
  '7',
  '8',
  '9',
  '/',
  '4',
  '5',
  '6',
  'x',
  '1',
  '2',
  '3',
  '-',
  '0',
  '.',
  '=',
  '+'
];

// creating Stateless Widget for buttons
class MyButton extends StatelessWidget {
// declaring variables
  final Color? color;
  final Color? textColor;
  final String buttonText;
  final Function() buttonTapped;

  //Constructor
  const MyButton(
      {Key? key,
      this.color,
      this.textColor,
      required this.buttonText,
      required this.buttonTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.all(4.20),
      child: roundedRaisedBtn()
  );

  Widget roundedRaisedBtn() => ElevatedButton (
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: const StadiumBorder(),
          fixedSize: const Size.fromRadius(10),
          elevation: 3.0
        ),
        onPressed: buttonTapped,
        child: Text(
            buttonText,
            style: TextStyle(
              color: textColor,
              fontSize: 22.5,
              fontWeight: FontWeight.bold,
            ),
          )
  );
}
