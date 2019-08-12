import 'package:flutter/material.dart';
import 'package:flutter_app/view/widget/widget_screen.dart';

import 'package:flutter_app/global/utils/widget_utils.dart';
import 'package:flutter_app/global/utils/validation_helper.dart';
class SimpleInterestFormUi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SICalculator();
  }
}

class _SICalculator extends State<StatefulWidget> {
  var _formKey = GlobalKey<FormState>();
  var _currencyList = ["rupee", "dollars", "pounds"];
  String _currencySelected = '';
  var _padding_10 = 10.0;
  var _displayResult = "";

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
                      controller: principleController,
                      style: textStyle(),
                      maxLength: 10,
                      validator: (String value) {
                        return isEmpty(value, "principle can not blank");
                      },
                      decoration: getDecorationStyle(
                          "principal", "enter principal e.g. 1200"),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: _padding_10, bottom: _padding_10),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: roiController,
                        style: textStyle(),
                        maxLength: 10,
                        maxLines: 1,
                        validator: (String value) {
                          return isEmpty(value,"rate of interest can not blank");
                        },
                        decoration: getDecorationStyle("rate of interest",
                            "enter rate of interest e.g. 12"),
                      )),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: termController,
                          style: textStyle(),
                          maxLength: 10,
                          maxLines: 1,
                          validator: (String value) {
                            return isEmpty(value,"terms can not blank");
                          },
                          decoration: getDecorationStyle("terms", "terms"),
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
                          child: textViewBlackColor("reset"),
                          elevation: 2,
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
                        child: textViewBlackColor(_displayResult),
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
      width: 120,
      height: 120,
    );
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: 50),
      child: imageLogo,
    );
  }
}
