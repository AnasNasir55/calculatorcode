


import 'package:calculator/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false,
    home: CalculatorApp(),
  ));
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
 double firstNum = 0.0;
 double secondNum = 0.0;
 // ignore: non_constant_identifier_names
 var Input = '';
 // ignore: non_constant_identifier_names
 var Output = '';
 var operation = '';
 var hideInput = false;
var outputSize = 34.0;

 onButtonClick(value){
  if(value=="AC"){
    Input = '';
    Output = '';
  } else if(value=="<"){
    if(Input.isNotEmpty)
    Input=Input.substring(0,Input.length-1);
  } else if(value== "="){
    if(Input.isNotEmpty);
    var userInput = Input;
    userInput= Input.replaceAll("x","*" );
    Parser p = Parser();
    Expression expression = p.parse(userInput);
    ContextModel cm = ContextModel();
    var finalValue = expression.evaluate(EvaluationType.REAL, cm);
    Output = finalValue.toString();
    if(Output.endsWith(".0")) {
    Output = Output.substring(0, Output.length-2);
    }
    Input = Output;
    hideInput = true;
    outputSize = 52;
    
  } else {
    Input = Input + value;
     hideInput = false;
    outputSize = 34;
  }
  setState(() {
    
  });

 }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column( crossAxisAlignment: CrossAxisAlignment.start,
        children: [ const SizedBox(height: 40,width: 50,),
        
             const Text( 
            'Powerd by: M.A.N Tech',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,),),
          
          Expanded(child: Container( 
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            
            
            child:  Column( mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
              children: [
              

              Text( hideInput?'':
                Input,style: const TextStyle(fontSize: 48,color: Colors.black),),
              
              const SizedBox(height: 20),
              
               Text(Output,style: TextStyle(fontSize: outputSize,color: Colors.black.withOpacity(0.7)),),
               const SizedBox(height: 30),


            ],),
            )),





          Row(
            children: [
          button(text: "AC",
          buttonBgColor: operatorColor,tColor: orangeColor),
          button(text: "<",
          buttonBgColor: operatorColor,tColor: orangeColor),
          button(text: "",
          buttonBgColor: Colors.transparent),
          button(text: "/",
          buttonBgColor: operatorColor,tColor: orangeColor),
                
                
                   
          ],),
          Row(
            children: [
          button(text: "7"),
          button(text: "8"),
          button(text: "9",),
          button(text: "x",buttonBgColor: operatorColor,tColor: orangeColor),
                
                
                   
          ],),
          Row(
            children: [
          button(text: "4"),
          button(text: "5"),
          button(text: "6"),
          button(text: "-",
          buttonBgColor: operatorColor,tColor: orangeColor),
                
                
                   
          ],),
          Row(
            children: [
          button(text: "1"),
          button(text: "2"),
          button(text: "3"),
          button(text: "+",
          buttonBgColor: operatorColor,tColor: orangeColor),
                
                
                   
          ],),
          Row(
            children: [
          button(text: "%",
          buttonBgColor: operatorColor,tColor: orangeColor),
          button(text: "0"),
          button(text: "."),
          button(text: "=",
          tColor: orangeColor),
                
                
                   
          ],),
        ],
      )
    );
  }

Widget button({
  text,tColor=Colors.white, buttonBgColor = buttonColor
}){
  return  Expanded(child: Container( margin: const EdgeInsets.all(8),
            child: ElevatedButton( 
              style: ElevatedButton.styleFrom( 
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                 padding: const EdgeInsets.all(22),
               primary: buttonBgColor
                
              ),
              onPressed: ()=> onButtonClick(text)
              , child:
                Text(text,
                style: TextStyle(
                fontSize: 18,fontWeight: FontWeight.bold,color: tColor,
                
                ),))));
}

}
