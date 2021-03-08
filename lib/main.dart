import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

List<String> listViewItem = List<String>();
TextEditingController inptuser = new TextEditingController();
var listItem = ["USD", "IDR", "EUR"];
String newValue1 = "IDR";
String newValue2 = "USD";

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Konversi Uang"),
          ),
          body: Container(
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                TextFormField(
                  controller: inptuser,
                  decoration: InputDecoration(hintText: 'Masukkan Jumlah Uang'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 25, left: 40),
                          child: Text("From",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25)),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 40),
                          child: DropdownButton<String>(
                            items: listItem.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            value: newValue1,
                            onChanged: (String changeValue) {
                              setState(() {
                                newValue1 = changeValue;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 40, top: 65),
                        child: Text("Convert",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20))),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 25, left: 50),
                          child: Text("To",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25)),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 50),
                          child: DropdownButton<String>(
                            items: listItem.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            value: newValue1,
                            onChanged: (String changeValue) {
                              setState(() {
                                newValue2 = changeValue;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
