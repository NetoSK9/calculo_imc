import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),
  )
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de I.M.C"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon:Icon(Icons.refresh),
            onPressed: (){},
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(Icons.person_outline,color: Colors.blue,size: 128.0,),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Peso (kg)",
            ),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              color:Colors.blue,
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "Altura (cm)"
            ),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              color: Colors.blue,
            ),
          )

        ],
      ),
    );
  }
}
