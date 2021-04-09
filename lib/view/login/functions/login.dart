import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/dummy/dummy_user_data.dart';
import '../../../core/init/helper/get_text.dart';
import '../../../core/model/user_model.dart';
import '../../../core/widgets/error/custom_dialog.dart';

Future<int> login(String email, String password, BuildContext context) async {
  // ignore: omit_local_variable_types
  List<User> dummyUsers = getDummyUsers();
  var userIndex = dummyUsers.indexWhere((element) => element.email == email);
  if (userIndex == -1) {
    await CustomDialog(
      content: getText(context, 'user_not_found'),
      rightButtonText: getText(context, 'ok'),
    ).show(context);
    return -1;
  } else if (dummyUsers[userIndex].password != password) {
    await CustomDialog(
      content: getText(context, 'wrong_password'),
      rightButtonText: getText(context, 'ok'),
    ).show(context);
    return -1;
  } else {
    return dummyUsers[userIndex].authorityLevel;
  }
}
