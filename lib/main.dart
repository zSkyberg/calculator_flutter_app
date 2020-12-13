import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator ',
      home: MyCalculator(),
    );
  }
}
class MyCalculator extends StatefulWidget {
  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {

  double result = 0.0;
  String strResult = '';
  double firstNumber= 0.0;
  String operator = '';
  String txt = '';
  bool isFirstNumberAfterOperation = true;
  void onDigitPress(String text){
    print("text pressed $text");

    if(text == '+' ){
      operator= text;
      firstNumber+= result;
      strResult = '';
      bool isFirstNumberAfterOperation = true;
      setState(() { });
    }
    else if(text=='-'){
      operator= text;
      firstNumber= result;
      strResult = '';
      bool isFirstNumberAfterOperation = true;
      setState(() { });
    }
    else if(text=='/'){
      operator= text;
      firstNumber= result;
      strResult = '';
      bool isFirstNumberAfterOperation = true;
      setState(() {});
    }
    else if(text=='x'){
      operator= text;
      firstNumber = result;
      strResult = '';
      bool isFirstNumberAfterOperation = true;
      setState(() { });
    }
    else if(text=='C'){
      operator= text;
      firstNumber=0;
          result=0;
         // text='0';
      strResult = '';
      bool isFirstNumberAfterOperation = true;
      setState(() { });
    }
    else if(text=='⌫'){
      strResult= strResult.substring(0,strResult.length-1);
      var temp = double.tryParse(strResult);
       result= temp;
      print(result);
      print(strResult);
      setState(() {
      });
    }
    else if( text=='='){
      switch(operator)
      {
        case '+':
          setState(() {
            result = result+ firstNumber;
          });
          strResult = '$result';
          break;
        case '-':
          setState(() {
            result = firstNumber - result;
          });
          strResult = '$result';
          break;
        case 'x':
          setState(() {
            result = firstNumber * result;
          });
          strResult = '$result';
          break;
        case '/':
          setState(() {
            result = firstNumber / result;
          });
          strResult = '$result';
          break;

      }
    }
    else{

      var tempResult;
      if(isFirstNumberAfterOperation){
        tempResult = text;
        isFirstNumberAfterOperation = false;
      }else {
        tempResult = strResult + text;
        print(tempResult);
      }
      var temp = double.tryParse(tempResult);
      if (temp!=null){
        strResult = tempResult;
        setState(() {
          result = temp ?? result;
        });
      }
      print(tempResult);
    }



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Calculator'),
      ),
      body:Container(
        child: Column(
          children:[
            Expanded(
              flex: 3,
                child: Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerRight,
                    child: Text(
                        '$strResult',
                      style: TextStyle(fontSize:60),
                    ),
                ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:[
              Expanded(
                flex:2,
              child: RaisedButton(
              onPressed: () {
            onDigitPress('C');
            },
              color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(
                  color: Colors.white,
                  width:1,
                  style: BorderStyle.solid,
                ),
              ),
              child: Text(
                'C',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
      ),
                  buildCalcButton('⌫',Colors.blueAccent),
                  buildCalcButton('/',Colors.blueAccent),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:[
                  buildCalcButton('7',Colors.blueGrey),
                  buildCalcButton('8',Colors.blueGrey),
                  buildCalcButton('9',Colors.blueGrey),
                  buildCalcButton('x',Colors.blueAccent),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:[
                  buildCalcButton('4',Colors.blueGrey),
                  buildCalcButton('5',Colors.blueGrey),
                  buildCalcButton('6',Colors.blueGrey),
                  buildCalcButton('+',Colors.blueAccent),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:[
                  buildCalcButton('1',Colors.blueGrey),
                  buildCalcButton('2',Colors.blueGrey),
                  buildCalcButton('3',Colors.blueGrey),
                  buildCalcButton('-',Colors.blueAccent),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:[
                  buildCalcButton('.',Colors.blueGrey),
                  buildCalcButton('0',Colors.blueGrey),
                  buildCalcButton('00',Colors.blueGrey),
                  buildCalcButton('=',Colors.blueAccent),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded buildCalcButton(String text,Color color) {
    return Expanded(
              child: RaisedButton(
                onPressed: () {
                  onDigitPress(text);
                  },
                  color: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        color: Colors.white,
                        width:1,
                        style: BorderStyle.solid,
                ),
                ),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 30,
                    ),
              ),
              ),
            );
  }
}



