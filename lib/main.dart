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

void konversi() {
  inputuser = double.parse(inptuser.text);
  if (newValue1 == "IDR") {
    if (newValue2 == "USD") {
      result = inputuser / 14425;
      listViewItem.add("$newValue1 to $newValue2 = $result");
    } else if (newValue2 == "EUR") {
      result = inputuser / 17107;
      listViewItem.add("$newValue1 to $newValue2 = $result");
    } else {
      result = inputuser;
      listViewItem.add("$newValue1 to $newValue2 = $result");
    }
  } else if (newValue1 == "USD") {
    if (newValue2 == "IDR") {
      result = inputuser * 14425;
      listViewItem.add("$newValue1 to $newValue2 = $result");
    } else if (newValue2 == "EUR") {
      result = inputuser * 0.84;
      listViewItem.add("$newValue1 to $newValue2 = $result");
    } else {
      result = inputuser;
      listViewItem.add("$newValue1 to $newValue2 = $result");
    }
  } else if (newValue1 == "EUR") {
    if (newValue2 == "IDR") {
      result = inputuser * 17107;
      listViewItem.add("$newValue1 to $newValue2 = $result");
    } else if (newValue2 == "USD") {
      result = inputuser * 1.18;
      listViewItem.add("$newValue1 to $newValue2 = $result");
    } else {
      result = inputuser;
      listViewItem.add("$newValue1 to $newValue2 = $result");
    }
  }
}

List<String> listViewItem = List<String>();
TextEditingController inptuser = new TextEditingController();
var listItem = ["USD", "IDR", "EUR"];
String newValue1 = "IDR";
String newValue2 = "USD";
double inputuser = 0;
double result = 0;

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
                          margin: EdgeInsets.only(left: 45),
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
                        margin: EdgeInsets.only(left: 51, top: 65),
                        child: Text("Convert",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20))),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 25, left: 45),
                          child: Text("To",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25)),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 55),
                          child: DropdownButton<String>(
                            items: listItem.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            value: newValue2,
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
                ),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        konversi();
                      });
                    },
                    color: Colors.blue,
                    hoverColor: Colors.blue[900],
                    textColor: Colors.white,
                    child: Text("Konversi Uang"),
                  ),
                ),
                Text("Hasil", style: TextStyle(fontSize: 25)),
                Text(result.toStringAsFixed(2), style: TextStyle(fontSize: 35)),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    "Riwayat Konversi",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Expanded(
                    child: ListView(
                        children: listViewItem.map((String value) {
                  Container(
                      margin: EdgeInsets.only(
                        top: 5,
                      ),
                      child: Text(
                        value,
                        style: TextStyle(fontSize: 15),
                      ));
                }).toList()))
              ],
            ),
          ),
        ));
  }
}
