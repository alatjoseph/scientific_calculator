import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String expression = '';
  String result = '';
  String equation = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue,
                Color.fromARGB(255, 175, 203, 235),
              ],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                Container(
                  height: 90,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          result,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 50,
                              fontWeight: FontWeight.w900),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 90,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      expression,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50))),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 50, right: 20, left: 20),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      //row1
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          icon(
                                              'AC',
                                              const Color.fromARGB(
                                                  255, 71, 66, 185)),
                                          icon(
                                              '%',
                                              const Color.fromARGB(
                                                  255, 71, 66, 185)),
                                          icon(
                                              '⌫',
                                              const Color.fromARGB(
                                                  255, 71, 66, 185)),
                                          icon(
                                              '÷',
                                              const Color.fromARGB(
                                                  255, 71, 66, 185)),
                                        ],
                                      ),
                                      //row2
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          icon('7', Colors.black),
                                          icon('8', Colors.black),
                                          icon('9', Colors.black),
                                          icon(
                                              '×',
                                              const Color.fromARGB(
                                                  255, 71, 66, 185)),
                                        ],
                                      ),
                                      //row3
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          icon('4', Colors.black),
                                          icon('5', Colors.black),
                                          icon('6', Colors.black),
                                          icon(
                                              '-',
                                              const Color.fromARGB(
                                                  255, 71, 66, 185)),
                                        ],
                                      ),
                                      //row4
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          icon('1', Colors.black),
                                          icon('2', Colors.black),
                                          icon('3', Colors.black),
                                          icon(
                                              '+',
                                              const Color.fromARGB(
                                                  255, 71, 66, 185)),
                                        ],
                                      ),
                                      //row5
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          icon('0', Colors.black),
                                          icon('00', Colors.black),
                                          icon('.', Colors.black),
                                          icon(
                                              '=',
                                              const Color.fromARGB(
                                                  255, 71, 66, 185)),
                                        ],
                                      ),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          icon('sin', Colors.black),
                                          icon('cos', Colors.black),
                                          icon('tan', Colors.black),
                                          icon('log', Colors.black),
                                        ],
                                      ),
                                      //row2
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          icon('(', Colors.black),
                                          icon(')', Colors.black),
                                          icon('^', Colors.black),
                                          icon('!', Colors.black),
                                        ],
                                      ),
                                      //row3
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          icon('π', Colors.black),
                                          icon('√', Colors.black),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        )))
              ],
            ),
          ),
        ));
  }

  Widget icon(String name, Color iconclr) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          onbtnpressed(name);
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: iconclr,
          ),
          child: Center(
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }

  onbtnpressed(String data) {
    setState(() {
      if (data == 'AC') {
        result = '';
        expression = '';
      } else if (data == '⌫') {
        expression = expression.substring(0, expression.length - 1);
        equation = expression;
      } else if (data == '√') {
        expression = expression + data;
      } else if (data == 'sin' || data == 'cos' || data == 'tan') {
        expression = expression + '$data(';
      } else if (data == 'log') {
        expression = expression + '$data(';
      } else if (data == '=') {
        equation = expression;
        equation = equation.replaceAll('π', '*3.14');
        equation = equation.replaceAll('×', '*');
        equation = equation.replaceAll('÷', '/');
        equation = equation.replaceAll('√', 'sqrt');
        equation = equation.replaceAll('%', '/100*');
        equation = equation.replaceAll('sin(', 'sin(( 3.14/180)*');
        equation = equation.replaceAll('cos(', 'cos(( 3.14/180)*');
        equation = equation.replaceAll('tan(', 'tan(( 3.14/180)*');
        try {
          Parser p = Parser();
          Expression exp = p.parse(equation);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          'error';
        }
      } else {
        expression = expression + data;
      }
    });
  }
}
