import 'package:flutter/material.dart';
import 'package:flutter_app/global/db/db_helper.dart';
import 'package:flutter_app/global/utils/validation_helper.dart';
import 'package:flutter_app/global/utils/widget_utils.dart';
import 'package:flutter_app/model/note/note_dean.dart';
import 'package:flutter_app/view/widget/widget_screen.dart';

//import 'package:flutter_app/view/global/utils/widget_utils.dart';
//import 'package:flutter_app/view/global/utils/validation_helper.dart';
import 'notes_list.dart';

class AddNotes extends StatefulWidget {
  var _screenTitle = "";
  Note _noteBean;

//  AddNotes(String screenTitle, Note noteBean) {
//    this._screenTitle = screenTitle;
//    this._noteBean = noteBean;
//  }
  AddNotes(this._screenTitle, this._noteBean);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddNotesState(_screenTitle, _noteBean);
  }
}

class AddNotesState extends State<AddNotes> {
  Note _noteBean;
  var _screenTitle = '';
  var _prioritySelected = '';
  final List<String> _priorityList = ["High", "Normal", "Low"];
  DbHelper dbHelper = DbHelper();
  var _padding_10 = 10.0;
  TextEditingController titleController = TextEditingController();
  TextEditingController descripController = TextEditingController();

  AddNotesState(this._screenTitle, this._noteBean);

  @override
  void initState() {
    super.initState();
    if (_noteBean == null) {
      _noteBean = new Note.blank();
      _noteBean.priority = 1;
      _noteBean.title = '';
      _noteBean.description = '';
    } else {
      _noteBean.title = titleController.text;
      _noteBean.description = descripController.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          elevation: 3,
          title: textViewColor(_screenTitle, Colors.white),
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

//  getDropDown() {
//    return Center(
//      child: DropdownButton(
//        items: _priorityList
//            .map((value) => DropdownMenuItem<String>(
//                  child: Text(value),
//                  value: value,
//                ))
//            .toList(),
//        onChanged: (String dropDown) {
//          setState(() {});
//        },
//      ),
//    );
//  }

  getFields() {
    var _formKey = GlobalKey<FormState>();
    return Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(left: _padding_10, right: _padding_10),
          child: ListView(
            children: <Widget>[
              Center(
                child: DropdownButton(
                  items: _priorityList
                      .map((value) => DropdownMenuItem<String>(
                            child: Text(value),
                            value: value,
                          ))
                      .toList(),
                  value: getPriorityString(_noteBean.priority),
                  onChanged: (String dropDown) {
                    setState(() {
                      _prioritySelected = dropDown;
                      getUpdatedPriority(dropDown);
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
                      return isEmpty(value, "title can not be blank");
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
                      return isEmpty(value, "description can not be blank");
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
//                              debugPrint(_displayResult);
                              _noteBean.title = titleController.text;
                              _noteBean.description = descripController.text;
                              _save(context);
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
//                              debugPrint(_displayResult);
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
                    child: textViewBlackColor(_prioritySelected),
                  ))
            ],
          ),
        ));
  }

  getUpdatedPriority(String priority) {
    switch (priority) {
      case "High":
        _noteBean.priority = 0;
        break;
      case "Normal":
        _noteBean.priority = 1;
        break;
      case "Low":
        _noteBean.priority = 2;
        break;
    }
  }

  String getPriorityString(int intPriority) {
    return _priorityList[intPriority];
  }

  void _save(BuildContext context) async {
    if (_noteBean.id != null) {
      // update case
      await dbHelper.updateNote(_noteBean);
      alertMessageDialog(
          context, "congratulation", 'note successfully updated !!!');
    } else {
      // insert case
      await dbHelper.insertNote(_noteBean);
      alertMessageDialog(
          context, "congratulation", 'note added successfully !!!');
    }
//    navigationPop(context, NoteLists());
  }
}
