import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = new TextEditingController();
  TextEditingController heightController = new TextEditingController();

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String _infoText = "Informe seus dados!";

  void _resetFilds() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = "Informe seus dados!";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculateIMC() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double result = weight / (height * height);
      if (result < 18.6) {
        _infoText = "Está abaixo do peso (${result.toStringAsPrecision(4)})";
      } else if (result < 25.0) {
        _infoText = "Está com peso normal (${result.toStringAsPrecision(4)})";
      } else if (result < 30.0) {
        _infoText = "Está com sobrepeso (${result.toStringAsPrecision(4)})";
      } else if (result < 35.0) {
        _infoText =
            "Está com obesidade grau 1 (${result.toStringAsPrecision(4)})";
      } else if (result < 40.0) {
        _infoText =
            "Está com obesidade grau 2 (${result.toStringAsPrecision(4)})";
      } else {
        _infoText =
            "Está com obesidade morbita (${result.toStringAsPrecision(4)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de I.M.C"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetFilds,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.person_outline,
                color: Colors.blue,
                size: 128.0,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Peso (kg)",
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32.0,
                  color: Colors.blue,
                ),
                controller: weightController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("incira seu peso!");
                  }
                },
              ),
              TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "Altura (cm)"),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32.0,
                    color: Colors.blue,
                  ),
                  controller: heightController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("incira sua altura!");
                    }
                  }),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _calculateIMC();
                      }
                    },
                    child: Text(
                      "Calcular",
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Text(
                _infoText,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
