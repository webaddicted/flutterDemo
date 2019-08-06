import 'package:flutter/material.dart';
import 'package:flutter_app/view/widget/widget_screen.dart';
import 'package:flutter_app/view/global/utils/widget_utils.dart';
import 'package:flutter_app/view/global/utils/validation_helper.dart';

class AddNotes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddNotesState();
  }
}

class AddNotesState extends State<AddNotes> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("addNotes", Colors.teal),
      body: getFields()
    );
  }

  getFields() {
    int count = 0;
    var _currencyList = ["rupee", "dollars", "pounds"];
    var _padding_10 = 10.0;
    var _displayResult = "";
    String _currencySelected = '';
    TextEditingController titleController = TextEditingController();
    TextEditingController descripController = TextEditingController();
    var _formKey = GlobalKey<FormState>();
    return Form(
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
                    controller: titleController,
                    style: textStyle(),
                    maxLines: 1,
                    validator: (String value) {
                      return mobileValidate(value);
//                          if (value.isEmpty) {
//                            return 'please enter principal amount';
//                          }
                    },
                    decoration: getDecorationStyle("Title", "enter title")),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: _padding_10, bottom: _padding_10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: descripController,
                    style: textStyle(),
                    maxLength: 10,
                    maxLines: 1,
                    validator: (String value) {
                      return fullNameValidate(value);
//                          if (value.isEmpty) {
//                            return 'please enter rate of interest';
//                          }
                    },
                    decoration: getDecorationStyle("rate of interest", "enter rate of interest e.g. 12"),
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
                        if (value.isEmpty) {
                          return 'please enter term';
                        }
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

  }
}
