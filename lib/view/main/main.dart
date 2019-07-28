import 'package:flutter/material.dart';
import 'package:flutter_app/view/widget/widget_screen.dart';

void main() {
  runApp(MaterialApp(
    title: "SI Form",
    home: SIForm(),
  ));
}

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SICalculator();
  }
}

class _SICalculator extends State<StatefulWidget> {
  var _country = [
    "india",
    "pakistan",
    "japan",
    "united states",
    "dubai",
    "kuwait",
    "london",
    "bangkok"
  ];

  String countrySelected = "india";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MaterialWidget().getAppBar("SI Calculator", Colors.amberAccent),
      body: Container(
        child: Column(
          children: <Widget>[
            getImageView(),
            Padding(
              padding: EdgeInsets.only(top: 30, left: 10, right: 10),
              child: TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(
                    fontFamily: "GreatVibes",
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
                decoration: InputDecoration(
                    labelText: "principal",
                    hintText: "enter principal e.g. 1200",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.3))),
              ),
            ),
            Padding(
                padding:
                    EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                child: TextField(
                  keyboardType: TextInputType.number,
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
//              children: <Widget>[
//                TextField(
//                  keyboardType: TextInputType.number,
//                  style: TextStyle(
//                      height: 0.5,
//                      fontFamily: "GreatVibes",
//                      fontSize: 20,
//                      fontWeight: FontWeight.w300),
//                  decoration: InputDecoration(
//                      labelText: "rate of interest",
//                      hintText: "enter rate of interest",
//                      border: OutlineInputBorder(
//                          borderRadius: BorderRadius.circular(3.3))),
//                ),
//                DropdownButton<String>(
//                  items: _country.map((String countryName) {
//                    return DropdownMenuItem<String>(
//                      value: countryName,
//                      child: Text(countryName),
//                    );
//                  }).toList(),
//                  onChanged: (String countryName) {
//                    setState(() {
//                      countrySelected = countryName;
//                    });
//                  },
//                  value: countrySelected,
//                ),
//              ],
            )
          ],
        ),
      ),
    );
  }
}

getImageView() {
  AssetImage assetImage = AssetImage("images/logo.png");
  Image imageLogo = Image(
    image: assetImage,
    width: 100,
    height: 100,
  );
  return Container(
    alignment: Alignment.topCenter,
    margin: EdgeInsets.only(top: 80),
    child: imageLogo,
  );
}

//
//class StateFullTestWidget extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    return FavouriteCity();
//  }
//}
//
//class FavouriteCity extends State<StateFullTestWidget> {
//  String nameUser = "";
//  var _country = [
//    "india",
//    "pakistan",
//    "japan",
//    "united states",
//    "dubai",
//    "kuwait",
//    "london",
//    "bangkok"
//  ];
//
//  String countrySelected = "india";
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: MaterialWidget().getAppBar("statefull widget", Colors.deepOrange),
//      body: Container(
//        child: Column(
//          children: <Widget>[
//            getTextField(),
//            getDropDown(),
//            MaterialWidget().textViewColor(
//                "enter name is - ${nameUser + " " + countrySelected}",
//                Colors.black),
//          ],
//        ),
//      ),
//    );
//  }
//
//  TextField getTextField() {
//    return TextField(
//      onSubmitted: (String userInput) {
//        setState(() {
//          nameUser = userInput;
//        });
//      },
//      style: TextStyle(
//          fontFamily: "GreatVibes", fontSize: 30, fontWeight: FontWeight.w400),
//    );
//  }
//
//  DropdownButton getDropDown() {
//    DropdownButton<String>(
//      items: _country.map((String countryName) {
//        return DropdownMenuItem<String>(
//          value: countryName,
//          child: Text(countryName),
//        );
//      }).toList(),
//      onChanged: (String countryName) {
//        setState(() {
//          countrySelected = countryName;
//        });
//      },
//      value: countrySelected,
//    );
//  }
//}
