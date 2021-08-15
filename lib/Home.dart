import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var value = "";

  Widget btn(var text) {
    return SizedBox(
      width: 80,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white12,
          side: BorderSide(
            width: 1,
          ),
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.horizontal()),
        ),
        onPressed: () {
          setState(() {
            if (text == "x") {
              text = "*";
            } else if (text == "÷") {
              text = "/";
            }
            value = value + text;
            if (value == "+" ||
                value == "-" ||
                value == "*" ||
                value == "/" ||
                value == "%") {
              value = "";
            }
          });
        },
        child: Text(text, style: TextStyle(color: Colors.black, fontSize: 20)),
      ),
    );
  }

  clear() {
    setState(() {
      value = "";
    });
  }

  del() {
    setState(() {
      value = value.substring(0, value.length - 1);
    });
  }

  result() {
    Parser p = Parser();
    Expression exp = p.parse(value);
    ContextModel cm = ContextModel();
    num expval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      value = expval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: AppBar(
          automaticallyImplyLeading: false, // hides leading widget
          backgroundColor: Colors.teal[300],
          title: Center(
              child: Text(
            "CALCULATOR",
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlueAccent[100]),
          )),
        ),
      ),
      body: Column(
        children: [
          Text(
            value,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Expanded(child: Divider()),
          Container(
            margin: EdgeInsets.only(top: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 120,
                  height: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white12,
                        side: BorderSide(
                          width: 1,
                        ),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.horizontal()),
                      ),
                      onPressed: clear,
                      child: Text(
                        "AC",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      )),
                ),
                Container(width: 80, child: btn("÷")),
                SizedBox(
                    width: 120,
                    height: 60,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white12,
                          side: BorderSide(
                            width: 1,
                          ),
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.horizontal()),
                        ),
                        onPressed: del,
                        child: Text("⌫",
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)))),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btn("7"),
                btn("8"),
                btn("9"),
                btn("+"),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btn("4"),
                btn("5"),
                btn("6"),
                btn("-"),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btn("1"),
                btn("2"),
                btn("3"),
                btn("x"),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btn("%"),
                btn("0"),
                btn("."),
                SizedBox(
                    width: 80,
                    height: 60,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white12,
                          side: BorderSide(
                            width: 1,
                          ),
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.horizontal()),
                        ),
                        onPressed: result,
                        child: Text("=",
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}