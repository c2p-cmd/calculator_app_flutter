import 'package:flutter/material.dart';

final List<String> buttons = [
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
  final Function()? buttonTapped;

//Constructor
  const MyButton(
      {Key? key,
      this.color,
      this.textColor,
      this.buttonText = "",
      this.buttonTapped})
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
        ),
        onPressed: buttonTapped,
        child: Text(
            buttonText,
            style: TextStyle(
              color: textColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          )
  );

  // Widget _tapDetect() => GestureDetector(
  //   onTap: buttonTapped,
  //   child: Padding(
  //     padding: const EdgeInsets.all(3),
  //     child: ClipRRect(
  //       borderRadius: BorderRadius.circular(69),
  //       child: Container(
  //         color: color,
  //         child: Center(
  //           child: Text(
  //             buttonText,
  //             style: TextStyle(
  //               color: textColor,
  //               fontSize: 25,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   ),
  // );
}
