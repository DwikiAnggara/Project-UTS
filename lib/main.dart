import 'package:flutter/material.dart';
import 'about_me.dart';

void main(){
  runApp(new MaterialApp(
    title: "Makanan Nusantara",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Container> daftarSuperhero = new List();

  var karakter = [
    {"nama": "Nasi Goreng", "gambar": "nasigoreng.jpg"},
    {"nama": "Bakso", "gambar": "bakso.jpg"},
    {"nama": "Betutu", "gambar": "betutu.jpg"},
    {"nama": "Gulai", "gambar": "gulai.jpg"},
    {"nama": "Lawar Bali", "gambar": "lawar.jpg"},
    {"nama": "Mie Aceh", "gambar": "mieaceh.jpg"},
    {"nama": "Nasi Kuning", "gambar": "nasikuning.jpeg"},
    {"nama": "Papeda", "gambar": "papeda.jpg"},
    {"nama": "Pempek", "gambar": "pempek.png"},
    {"nama": "Sate Madura", "gambar": "satemadura.jpg"},
  ];

  _buatlist() async {
    for (var i = 0; i < karakter.length; i++) {
      final karakternya = karakter[i];
      final String gambar = karakternya["gambar"];

      daftarSuperhero.add(new Container(
          padding: new EdgeInsets.all(1.0),
          child: new Card(
              child: new Column(
            children: <Widget>[
              new Hero(
                tag: karakternya['nama'],
                child: new Material(
                  child: new InkWell(
                    onTap: () =>
                        Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) => new Detail(
                                    nama: karakternya['nama'],
                                    gambar: gambar,
                                  ),
                            )),
                    child: new Image.asset(
                      "img/$gambar",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.all(10.0),
              ),
              new Text(
                karakternya['nama'],
                style: new TextStyle(fontSize: 20.0),
              )
            ],
          ))));
    }
  }

  @override
  void initState() {
    _buatlist();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('MASAKAN NUSANTARA'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: <Widget>[
            IconButton(icon: Icon(Icons.person),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyProfil()),
               );}
            )],
      ),

      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("I Made Dwiki Pasek Anggara"), 
              accountEmail: new Text("dwiki@undiksha.ac.id"),
              ),
            new ListTile(
              title: new Text("About Me"),
              trailing: new Icon(Icons.person)
            ),
            new ListTile(
              title: new Text("Kritik dan Saran"),
              trailing: new Icon(Icons.book),
            ) 
          ]
        )
      ),
      body: new GridView.count(
        crossAxisCount: 2,
        children: daftarSuperhero,
      ),
    );
  }
}

class Detail extends StatelessWidget {
  Detail({this.nama, this.gambar});
  final String nama;
  final String gambar;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          new Container(
              height: 240.0,
              child: new Hero(
                tag: nama,
                child: new Material(
                  child: new InkWell(
                    child: new Image.asset(
                      "img/$gambar",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )),
          new BagianNama(
            nama: nama,
          ),
          
          new Keterangan(),
        ],
      ),
    );
  }
}

class BagianNama extends StatelessWidget {
  BagianNama({this.nama});
  final String nama;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  nama,
                  style: new TextStyle(fontSize: 20.0, color: Colors.blue),
                ),
              ],
            ),
          ),
          new Row(
            children: <Widget>[
              new Icon(
                Icons.star,
                size: 30.0,
                color: Colors.red,
              ),
              new Text(
                "12",
                style: new TextStyle(fontSize: 18.0),
              )
            ],
          )
        ],
      ),
    );
  }
}

class Keterangan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Card(
        child: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Text(
            "Masakan Nusantara adalah salah satu warisan nenek moyang yang kita miliki. Kita sebaga generasi penerus bangsa harus bisa menjaga dan memelihara keanekaragaman kuliner yang kita miliki agar tidak punah ditelan zaman",
            style: new TextStyle(fontSize: 18.0),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}