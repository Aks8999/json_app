import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

void main(){
  runApp(new MaterialApp(
    title: "JSON App",
    home: new HomePage(),
    theme: new ThemeData(
      primarySwatch: Colors.blue,
    ),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:new AppBar(
        title: new Text("JSON App"),
        centerTitle: true,
      ),
      body: new Container(
        child: new Center(
          child: new FutureBuilder(
            future: DefaultAssetBundle
            .of(context)
            .loadString('load_json/person.json'),
            builder: (context, snapshot){
              //decode json
              var mydata= json.decode(snapshot.data.toString());
              return new ListView.builder(
                itemBuilder: (BuildContext context, int index){
                  return new Card(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new Text("Name"+mydata[index]['Name']),
                        new Text("Age"+mydata[index]['Age'])
                      ],
                    ),
                  );
                },
                itemCount:  mydata==null?0:mydata.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
