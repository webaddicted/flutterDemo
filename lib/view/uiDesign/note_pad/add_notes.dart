import 'package:flutter/material.dart';
import 'package:flutter_app/global/db/validation_helper.dart';
import 'package:flutter_app/global/db/widget_utils.dart';
import 'package:flutter_app/view/widget/widget_screen.dart';
//import 'package:flutter_app/view/global/utils/widget_utils.dart';
//import 'package:flutter_app/view/global/utils/validation_helper.dart';
import 'notes_list.dart';

class AddNotes extends StatefulWidget {
  var _screenTitle = "";

  AddNotes(String screenTitle) {
    this._screenTitle = screenTitle;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddNotesState(_screenTitle);
  }
}

class AddNotesState extends State<AddNotes> {
  var _appBarTitle = '';
  var prioritySelected = '';

  AddNotesState(String screenTitle) {
    this._appBarTitle = screenTitle;
  }

  final List<String> _dropdownValues = ["One", "Two", "Three", "Four", "Five"];

  @override
  void initState() {
    super.initState();
    prioritySelected = _dropdownValues[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          elevation: 3,
          title: textViewColor(_appBarTitle, Colors.white),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              navigationPop(context, NoteLists());
            },
          ),
        ),
        body: getFields() //getDropDown() //()getFields()
    );
  }

  getDropDown() {
    return Center(
      child: DropdownButton(
        items: _dropdownValues
            .map((value) => DropdownMenuItem<String>(
          child: Text(value),
          value: value,
        ))
            .toList(),
        onChanged: (String dropDown) {
          setState(() {});
        },
      ),
    );
  }

  getFields() {
    var _padding_10 = 10.0;
    var _displayResult = "";
    var _priorityList = ["high", "normal", "low"];

    TextEditingController titleController = TextEditingController();
    TextEditingController descripController = TextEditingController();
    var _formKey = GlobalKey<FormState>();
    return Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(left: _padding_10, right: _padding_10),
          child: ListView(
            children: <Widget>[
              Center(
                child: DropdownButton(
                  items: _dropdownValues
                      .map((value) => DropdownMenuItem<String>(
                    child: Text(value),
                    value: value,
                  ))
                      .toList(),
                  value: prioritySelected,
                  onChanged: (String dropDown) {
                    setState(() {
                      prioritySelected = dropDown;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: TextFormField(
                    keyboardType: TextInputType.text,
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
                  padding:
                  EdgeInsets.only(top: _padding_10, bottom: _padding_10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: descripController,
                    style: textStyle(),
                    maxLengthEnforced: false,
                    validator: (String value) {
                      return fullNameValidate(value);
//                          if (value.isEmpty) {
//                            return 'please enter rate of interest';
//                          }
                    },
                    decoration:
                    getDecorationStyle("Description", "enter description"),
                  )),
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
                        child: textViewColor("save", Colors.white),
                        elevation: 5,
                        onPressed: () {
                          setState(() {
                            if (_formKey.currentState.validate()) {
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
                          child: textViewBlackColor("delete"),
                          elevation: 2,
                          onPressed: () {
                            setState(() {
                              debugPrint(_displayResult);
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
        ));
  }
}
