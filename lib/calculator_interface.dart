import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class firstPage extends StatefulWidget {
  @override
  _firstPageState createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {
  String equation = '0';
  String result = '0';
  String expression = '';
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;
  void btnClicked(String btnValue) {
    setState(() {
      if (btnValue == 'C') {
        double equationFontSize = 38.0;
        double resultFontSize = 48.0;
        equation = '0';
        result = '0';
      } else if (btnValue == '=') {
        double equationFontSize = 38.0;
        double resultFontSize = 48.0;

        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('÷', '/');
        Parser p = new Parser();
        Expression exp = p.parse(expression);

        ContextModel cm = ContextModel();
        result = '${exp.evaluate(EvaluationType.REAL, cm)}';
      } else if (btnValue == '⌫') {
        double equationFontSize = 48.0;
        double resultFontSize = 38.0;
        equation = equation.substring(0, equation.length - 1);
      } else {
        if (equation == '0') {
          equation = btnValue;
        } else {
          equation = equation + btnValue;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0.0, 40.0, 20.0, 0.0),
            alignment: Alignment.bottomRight,
            child: Text(
              equation,
              style: TextStyle(color: Colors.white, fontSize: equationFontSize),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
            alignment: Alignment.topRight,
            child: Text(
              result,
              style: TextStyle(color: Colors.white, fontSize: resultFontSize),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              calBtn('C', 0xFF2EC973, 1),
              calBtn('⌫', 0xFF6D6D6D, 1),
              calBtn('%', 0xFFFF9500, 1),
              calBtn('÷', 0xFFFF9500, 1),
            ],
          ),
          Row(
            children: <Widget>[
              calBtn('7', 0xFF6D6D6D, 1),
              calBtn('8', 0xFF6D6D6D, 1),
              calBtn('9', 0xFF6D6D6D, 1),
              calBtn('x', 0xFFFF9500, 1),
            ],
          ),
          Row(
            children: <Widget>[
              calBtn('4', 0xFF6D6D6D, 1),
              calBtn('5', 0xFF6D6D6D, 1),
              calBtn('6', 0xFF6D6D6D, 1),
              calBtn('-', 0xFFFF9500, 1),
            ],
          ),
          Row(
            children: <Widget>[
              calBtn('1', 0xFF6D6D6D, 1),
              calBtn('2', 0xFF6D6D6D, 1),
              calBtn('3', 0xFF6D6D6D, 1),
              calBtn('+', 0xFFFF9500, 1),
            ],
          ),
          Row(
            children: <Widget>[
              calBtn('0', 0xFF6D6D6D, 2),
              calBtn('.', 0xFF6D6D6D, 1),
              calBtn('=', 0xFF2EC973, 1),
            ],
          ),
        ],
      ),
    );
  }

  Widget calBtn(String btnValue, int color, int flex) {
    return Expanded(
      flex: flex,
      child: GestureDetector(
        onTap: () {
          btnClicked(btnValue);
        },
        child: Container(
          alignment: Alignment.center,
          height: 70,
          width: double.infinity,
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Color(color),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Text(
            btnValue,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
