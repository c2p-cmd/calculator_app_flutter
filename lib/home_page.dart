import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'buttons.dart';

const primary = Color(0xffbb86fc);
const secondary = Color(0xff03dac6);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userInput = '', answer = '0';

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFF121212),
        body: _column(),
      );

  Container userInputField() => Container(
        padding: const EdgeInsets.all(27),
        alignment: Alignment.centerRight,
        child: Text(
          userInput,
          style: const TextStyle(fontSize: 27, color: Colors.white),
        ),
      );

  Container answerField() => Container(
        padding: const EdgeInsets.all(18),
        alignment: Alignment.centerRight,
        child: Text(
          answer,
          style: const TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      );

  Widget _column() => Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Padding(padding: EdgeInsets.only(top: 15)),
                  userInputField(),
                  answerField(),
                  allButtons()
                ]),
          ),
        ],
      );

  Widget allButtons() => Expanded(
        flex: 3,
        child: GridView.builder(
            itemCount: buttons.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (BuildContext context, int index) {
              switch (index) {
                case 0:
                  return MyButton(
                    buttonTapped: () => setState(() {
                      userInput = '';
                      answer = '0';
                    }),
                    buttonText: buttons[index],
                    color: secondary,
                    textColor: Colors.black,
                  );
                case 1:
                  return MyButton(
                    buttonTapped: () {
                      setState(() {
                        if (userInput != '' && userInput != '0') {
                          userInput = '-' + userInput;
                        }
                        computeValue();
                      });
                    },
                    buttonText: buttons[index],
                    color: primary,
                    textColor: Colors.black,
                  );
                case 2:
                  return MyButton(
                    buttonTapped: () {
                      setState(() {
                        userInput += buttons[index];
                      });
                    },
                    buttonText: buttons[index],
                    color: primary,
                    textColor: Colors.black,
                  );
                case 3:
                  return MyButton(
                    buttonTapped: () => setState(() {
                      if (userInput.isNotEmpty) {
                        userInput =
                            userInput.substring(0, userInput.length - 1);
                        computeValue();
                      }
                    }),
                    buttonText: buttons[index],
                    color: primary,
                    textColor: Colors.black,
                  );
                case 18:
                  return MyButton(
                    buttonTapped: () => setState(() {
                      showExpression();
                    }),
                    buttonText: buttons[index],
                    color: const Color(0xffcf6679),
                    textColor: Colors.white,
                  );
                default:
                  return MyButton(
                    buttonTapped: () {
                      setState(() {
                        userInput += buttons[index];
                        if (!isOperator(buttons[index])) {
                          computeValue();
                        }
                      });
                    },
                    buttonText: buttons[index],
                    color: isOperator(buttons[index])
                        ? primary
                        : const Color(0xff3700b3),
                    textColor: isOperator(buttons[index])
                        ? const Color(0xff121212)
                        : Colors.white70,
                  );
              }
            }),
      );

  void showExpression() {
    computeValue();
    userInput = answer;
    answer = '';
  }

  void computeValue() {
    final _finalUserInput = userInput.replaceAll('x', '*');
    answer = Parser()
        .parse(_finalUserInput)
        .evaluate(EvaluationType.REAL, ContextModel())
        .toString();
  }
}

bool isOperator(String x) =>
    (x == '/' || x == 'x' || x == '-' || x == '+' || x == "=");
