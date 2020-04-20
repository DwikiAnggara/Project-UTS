
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class KritikSaran extends StatefulWidget {
  @override
  _KritikSaranState createState() => _KritikSaranState();
}

class _KritikSaranState extends State<KritikSaran> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: new AppBar(
      //   title: new Text('Kritik Dan Saran'),
      //   centerTitle: true,
      //   backgroundColor: Colors.blue,
      // )
      appBar: new AppBar(
          leading: Icon(Icons.web),
          title: Text('Kritik dan Saran'),
          centerTitle: true,
          // actions: <Widget>[Icon(Icons.thumb_up),Icon(Icons.thumb_down)],
          actions: <Widget>[
            IconButton(icon: Icon(Icons.home),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
               );}
            )],
        ),
        body: Container(
          color: Colors.amber,
          child: Column(
            children: <Widget>[
              Image(image:AssetImage('img/dwiki.jpeg'),),
               Text('TERIMAKASIH, SARAN ANDA SUDAH DISIMPAN',
               style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                  ),
            ],
            
          )
        )
    );
  }
}
