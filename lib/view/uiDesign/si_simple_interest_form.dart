import 'package:flutter/material.dart';
import 'package:flutter_app/view/widget/widget_screen.dart';
import 'package:flutter_app/view/global/utils/widget_utils.dart';
class SimpleInterestFormUi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SICalculator();
  }
}

class _SICalculator extends State<StatefulWidget> {
  var _formKey = GlobalKey<FormState>();
  var _currencyList = ["rupee", "dollars", "pounds"];
  var _padding_10 = 10.0;
  var _displayResult = "";
  String _currencySelected = '';
  TextEditingController principleController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _currencySelected = _currencyList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      resizeToAvoidBottomPadding: false,
        appBar: getAppBar("SI Calculator", Colors.amberAccent),
        body: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.only(left: _padding_10, right: _padding_10),
              child: ListView(
                children: <Widget>[
                  getImageView(),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'please enter principal amount';
                        }
                      },
                      style: TextStyle(
                          fontFamily: "GreatVibes",
                          fontSize: 20,
                          fontWeight: FontWeight.w300),
                      controller: principleController,
                      decoration: InputDecoration(
                          labelText: "principal",
                          hintText: "enter principal e.g. 1200",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3.3))),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: _padding_10, bottom: _padding_10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: roiController,
                        style: TextStyle(
                            fontFamily: "GreatVibes",
                            fontSize: 20,
                            fontWeight: FontWeight.w300),
                        decoration: InputDecoration(
                            labelText: "rate of interest",
                            hintText: "enter rate of interest e.g. 12",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3.3))),
                      )),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: termController,
                          style: TextStyle(
                              height: 0.5,
                              fontFamily: "GreatVibes",
                              fontSize: 20,
                              fontWeight: FontWeight.w300),
                          decoration: InputDecoration(
                              labelText: "terms",
                              hintText: "terms",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(3.3))),
                        ),
                      ),
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: DropdownButton<String>(
                          items: _currencyList.map((String countryName) {
                            return DropdownMenuItem<String>(
                              value: countryName,
                              child: Text(countryName),
                            );
                          }).toList(),
                          onChanged: (String countryName) {
                            setState(() {
                              _currencySelected = countryName;
                            });
                          },
                          value: _currencySelected,
                        ),
                      ))
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: _padding_10,
                              right: _padding_10,
                              top: _padding_10),
                          child: RaisedButton(
                            color: Colors.deepOrange,
                            child: textViewColor("calculate", Colors.white),
                            elevation: 5,
                            onPressed: () {
                              setState(() {
                                if (_formKey.currentState.validate()) {
                                  _displayResult = calculateIntrust();
                                  debugPrint(_displayResult);
                                }
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.only(
                            left: _padding_10,
                            right: _padding_10,
                            top: _padding_10),
                        child: RaisedButton(
                          color: Colors.yellow,
                          child: textViewColor("reset", Colors.black),
                          elevation: 5,
                          onPressed: () {
                            setState(() {
                              resetCalculator();
                            });
                          },
                        ),
                      ))
                    ],
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(top: _padding_10),
                        child: Text(_displayResult,
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                decoration: TextDecoration.none,
                                fontFamily: "GreatVibes",
                                fontWeight: FontWeight.w300)),
                      ))
                ],
              ),
            )));
  }

  String calculateIntrust() {
    double principle = double.parse(principleController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);
    double totalAmount = principle + (principle * roi * term) / 100;
    String result =
        'after $term years, your investment will be worth $totalAmount $_currencySelected';
    return result;
  }

  void resetCalculator() {
    principleController.text = '';
    roiController.text = '';
    termController.text = '';
    _displayResult = '';
    _currencySelected = _currencyList[0];
  }

  getImageView() {
    AssetImage assetImage = AssetImage("images/logo.png");
    Image imageLogo = Image(
      image: assetImage,
      width: 150,
      height: 150,
    );
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: 50),
      child: imageLogo,
    );
  }
}
