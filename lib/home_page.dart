import 'package:flutter/gestures.dart';
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
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Padding(padding: EdgeInsets.only(top: 15)),
              Container(
                padding: const EdgeInsets.all(27),
                alignment: Alignment.centerRight,
                child: Text(
                  userInput,
                  style: const TextStyle(fontSize: 27, color: Colors.white),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(18),
                alignment: Alignment.centerRight,
                child: Text(
                  answer,
                  style: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  row1(),
                  row2(),
                  row3(),
                  row4(),
                ],
              ),
              const SizedBox(height: 0.5)
            ]),
      );

  Row row1() {
    final children = <Widget>[];
    buttons.sublist(0, 4).asMap().forEach((index, value) =>
        children.add(MyButton(
          buttonTapped: () {
            setState(() {
              userInput += buttons[index];
              if (!isOperator(buttons[index])) {
                computeValue();
              }
            });
          },
          buttonText: buttons[index],
          color: isOperator(buttons[index]) ? primary : const Color(0xff3700b3),
          textColor:
              isOperator(buttons[0]) ? const Color(0xff121212) : Colors.white70,
        )));
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: children);
  }

  Row row2() {
    final children = <Widget>[];
    buttons.sublist(4, 8).asMap().forEach((index, value) =>
        children.add(MyButton(
          buttonText: value,
          buttonTapped: () {},
          color: isOperator(buttons[index]) ? primary : const Color(0xff3700b3),
          textColor:
              isOperator(buttons[0]) ? const Color(0xff121212) : Colors.white70,
        )));
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    );
  }

  Row row3() {
    final children = <Widget>[];
    buttons.sublist(8, 12).asMap().forEach((index, value) =>
        children.add(MyButton(
          buttonText: value,
          buttonTapped: () {},
          color: isOperator(buttons[index]) ? primary : const Color(0xff3700b3),
          textColor:
              isOperator(buttons[0]) ? const Color(0xff121212) : Colors.white70,
        )));
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    );
  }

  Row row4() {
    final children = <Widget>[];
    buttons.sublist(12, 16).asMap().forEach((index, value) =>
        children.add(MyButton(
          buttonText: value,
          buttonTapped: () {},
          color: isOperator(buttons[index]) ? primary : const Color(0xff3700b3),
          textColor:
              isOperator(buttons[0]) ? const Color(0xff121212) : Colors.white70,
        )));
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    );
  }

  Expanded allButtons() {
    return Expanded(
      // flex: 0,
      child: GridView.builder(
          padding: const EdgeInsetsDirectional.only(top: 0),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: buttons.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
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
                      userInput = userInput.substring(0, userInput.length - 1);
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
  }

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
