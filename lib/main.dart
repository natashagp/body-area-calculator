import 'dart:math';
import 'package:body_area_calculator/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Body Area Calculator",
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  String _infoText = "";

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetFields() {
    setState(() {
      heightController.text = "";
      weightController.text = "";
      _infoText = "";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculateArea() {
    double height = double.parse(heightController.text);
    double weight = double.parse(weightController.text);

    double result = sqrt((height * weight) / 3600);

    setState(() {
      _infoText =
          "Your Body\nSurface Area\nis ${result.toStringAsPrecision(4)} m2";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        toolbarHeight: 30.0,
        elevation: 0,
        backgroundColor: kPrimaryColor,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 10.0,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'Body Surface Area',
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            "assets/women.png",
                            fit: BoxFit.cover,
                            scale: 1.1,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Height',
                                style: TextStyle(
                                  color: kTextColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Container(
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: kFieldColor,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                padding: EdgeInsets.only(right: 10.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  textAlign: TextAlign.right,
                                  controller: heightController,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Inform your height";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  'cm',
                                  style: TextStyle(
                                    color: kTextColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              SizedBox(height: 70.0),
                              Text(
                                'Weight',
                                style: TextStyle(
                                  color: kTextColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Container(
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: kFieldColor,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                padding: EdgeInsets.only(right: 10.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  textAlign: TextAlign.right,
                                  controller: weightController,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Inform your weight";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  'kg',
                                  style: TextStyle(
                                    color: kTextColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              SizedBox(height: 70.0),
                              Text(
                                _infoText,
                                style: TextStyle(
                                  color: kResultColor,
                                  fontSize: 19.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.end,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: kPrimaryButton,
                              padding: EdgeInsets.symmetric(
                                horizontal: 40.0,
                                vertical: 15.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _calculateArea();
                              }
                            },
                            child: Text('Calculate'),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: kSecondaryButton,
                              padding: EdgeInsets.symmetric(
                                horizontal: 50.0,
                                vertical: 15.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: _resetFields,
                            child: Text('Reset'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
