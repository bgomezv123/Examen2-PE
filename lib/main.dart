import 'package:flutter/material.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {

  Color backgroundColor = Colors.white;
  String displayText1 = ' ';
  String displayText2 = ' ';
  String resultado = '0';
  String signo = ' ';
  bool num_op = false;
  Color op1Color = Colors.blue;
  Color op2Color = Colors.blue;
  Color signoColor = Colors.blue;

  String removeLastCharacter(String input) {
    if (input.isEmpty) {
      return input;
    }
    return input.substring(0, input.length - 1);
  }
  Widget buttonCalc(String text, Color btnColor, Color txtColor){
    return ElevatedButton(
      onPressed: (){
        setState(() {
          if(text == '+' || text == '-' || text == '*' || text == '÷'){
            signo = text;
          }else{
            if(!num_op){
              displayText1 = displayText1 + text;
            }else{
              displayText2 = displayText2 + text;
            }
          }

        });
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(50.0),
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),

        ),
        backgroundColor: btnColor,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 30,
          color: txtColor,
        ),
      ),
    );
  }

  Widget buttonCalcDEL(String text, Color btnColor, Color txtColor, bool all){
    return ElevatedButton(
      onPressed: (){
        setState(() {
          setState(() {
            if (all){
              displayText1 = "";
              displayText2 = "";
              resultado = "0";
            } else{
              if (!num_op){
                displayText1 = removeLastCharacter(displayText1);
              }else{
                displayText2 = removeLastCharacter(displayText2);
              }
            }
          });
        });
      },
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(50.0),
          shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          backgroundColor: btnColor

      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 30,
          color: txtColor,
        ),
      ),
    );
  }

  Widget buttonCalcEqual(String text, Color btnColor, Color txtColor){
    return ElevatedButton(
      onPressed: (){
        setState(() {
          setState(() {
            switch (signo){
              case "+":
                resultado = (int.parse(displayText1) + int.parse(displayText2)).toString();
              case "-":
                resultado = (int.parse(displayText1) - int.parse(displayText2)).toString();
              case "*":
                resultado = (int.parse(displayText1) * int.parse(displayText2)).toString();
              case "÷":
                resultado = (int.parse(displayText1) / int.parse(displayText2)).toString();
            }

          });
        });
      },
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(50.0),
          shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          backgroundColor: btnColor
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 30,
          color: txtColor,
        ),

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(

        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: const Text('Calculadora'),
        ),
        body: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    flex : 3,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          op1Color = Colors.green;
                          op2Color = Colors.blue;
                          num_op = false;
                        });
                      },
                      child:  Container(
                        height: 70,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: op1Color, // Color del borde
                            width: 5.0, // Ancho del borde
                          ),
                        ),
                        child: Text(
                          displayText1,
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                    )

                ),
                Expanded(
                  flex : 1,
                  child : Container(
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red, // Color del borde
                        width: 5.0, // Ancho del borde
                      ),
                    ),
                    child: Text(
                      signo,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                ),

                Expanded(
                    flex : 3,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          op1Color = Colors.blue;
                          op2Color = Colors.green;
                          num_op = true;
                        });
                      },
                      child:  Container(
                        height: 70,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: op2Color, // Color del borde
                            width: 5.0, // Ancho del borde
                          ),
                        ),
                        child: Text(
                          displayText2,
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                    )

                ),

                Expanded(
                  flex : 3,
                  child : Container(
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue, // Color del borde
                        width: 5.0, // Ancho del borde
                      ),
                    ),
                    child: Text(
                      resultado,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                ),


              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded( flex : 1, child :buttonCalcDEL("C", Colors.redAccent, Colors.black, true)),
                Expanded(flex : 2, child:buttonCalcDEL("Del", Colors.redAccent, Colors.black,false),
                ),
                Expanded( flex :1, child :buttonCalc("÷", Colors.white, Colors.black)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded( child : buttonCalc("7", Colors.white, Colors.black)),
                Expanded( child : buttonCalc("8", Colors.white, Colors.black)),
                Expanded( child : buttonCalc("9", Colors.white, Colors.black)),
                Expanded( child : buttonCalc("*", Colors.white, Colors.black)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded( child :buttonCalc("4", Colors.white, Colors.black)),
                Expanded( child :buttonCalc("5", Colors.white, Colors.black)),
                Expanded( child : buttonCalc("6", Colors.white, Colors.black)),
                Expanded( child : buttonCalc("-", Colors.white, Colors.black)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded( child :buttonCalc("1", Colors.white, Colors.black)),
                Expanded( child :buttonCalc("2", Colors.white, Colors.black)),
                Expanded( child :buttonCalc("3", Colors.white, Colors.black)),
                Expanded( child :buttonCalc("+", Colors.white, Colors.black)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded( child :buttonCalc(",", Colors.white, Colors.black)),
                Expanded( child :buttonCalc("0", Colors.white, Colors.black)),
                Expanded( child :buttonCalc(".", Colors.white, Colors.black)),
                Expanded( child :buttonCalcEqual("=", Colors.blue, Colors.black)),
              ],
            ),

          ],
        ),
      ),
    );
  }
}