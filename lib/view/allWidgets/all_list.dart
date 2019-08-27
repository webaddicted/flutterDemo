import 'package:flutter/material.dart';
import 'package:flutter_app/global/utils/widget_utils.dart';
import 'package:flutter_app/view/pemission/permission_helper.dart';
import 'package:flutter_app/view/uiDesign/note_pad/notes_list.dart';
import 'package:flutter_app/view/uiDesign/si_calculator/si_simple_interest_form.dart';
import 'package:flutter_app/view/widget/widget_screen.dart';

class AllLists extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AllListState();
  }
}

class AllListState extends State<AllLists> {
  List<String> dataLists;

  @override
  Widget build(BuildContext context) {
    setData();
    return Scaffold(
      appBar: getAppBar("all test demo widget list", Colors.teal),
      body: getLists(),
    );
  }

  getLists() {
   return ListView.builder(
        itemCount: dataLists.length,
        itemBuilder: (BuildContext context, int position) {
          debugPrint('postion -> ${position}');
          return Card(
            color: Colors.white,
            elevation: 2,
            child: ListTile(
              title: textViewBlackColor(dataLists[position]),
              leading: textViewBlackColor("${position}  "),
              onTap: (){
                moveScreen(context,dataLists[position]);
              },
            ),
          );
        });
  }

  List<String> setData() {
    if (dataLists == null)
      dataLists = List<String>();
    else
      dataLists.clear();
    dataLists.add("widget");
    dataLists.add("interest calci");
    dataLists.add("notepad db");
    dataLists.add("permission helper");
    return dataLists;
  }

  void moveScreen(BuildContext context,String screenName) {
    switch(screenName){
      case "widget":
        navigationStateLessPush(context, MaterialWidget());
        break;
      case "interest calci":
        navigationPush(context, SimpleInterestFormUi());
        break;
      case "notepad db":
        navigationPush(context, NoteLists());
        break;
      case "permission helper":
        navigationPush(context, PermissionHelper());
        break;

    }

  }
}
