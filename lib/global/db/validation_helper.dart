import 'package:flutter/material.dart';

String mobileValidate(String mobileNo) {
  String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = new RegExp(patttern);
  if (mobileNo.length == 0) {
    return 'Please enter mobile number';
  } else if (!regExp.hasMatch(mobileNo)) {
    return 'Please enter valid mobile number';
  }
  return null;
}

String fullNameValidate(String fullName) {
  String patttern = r'^[a-z A-Z,.\-]+$';
  RegExp regExp = new RegExp(patttern);
  if (fullName.length == 0) {
    return 'Please enter full name';
  } else if (!regExp.hasMatch(fullName)) {
    return 'Please enter valid full name';
  }
  return null;
}

String validateEmail(String value) {
  if (value.isEmpty) {
    // The form is empty
    return "Enter email address";
  }
  // This is just a regular expression for email addresses
  String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
      "\\@" +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
      "(" +
      "\\." +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
      ")+";
  RegExp regExp = new RegExp(p);

  if (regExp.hasMatch(value)) {
    // So, the email is valid
    return null;
  }

  // The pattern of the email didn't match the regex above.
  return 'enter valid emailid';
}
