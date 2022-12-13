import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  String dropdownvalue = 'Apple';

  var items = [
    'Apple',
    'Banana',
    'Grapes',
    'Orange',
    'Watermelon',
    'Pineapple'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DropDownList Example"),
      ), //AppBar
      
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              //O MainAxisAlignment.end
              //alinha o botao dropdownlist a direita
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    height: 40,
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      //O BorderRadius 30 deixa o botao redondo
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 0.80),
                    ), //BoxDecoration

                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: Text(
                          'Select Item',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        
                        items: items.map(
                           (item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.green,
                                    ),
                                  ),
                                )
                            ).toList(), //items.map
                        value: dropdownvalue,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ), //DropdownButton
                    ) //DropdownButtonHideUnderline
                ), //Container
              ], //children
            ), //Row
          ], //children
        ), //Column
      ), //Container
    ); //Scaffold
  }
}