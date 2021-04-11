import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/navigation.dart';
import '../../../core/dummy/dummy_user_data.dart';
import '../../../core/init/helper/get_text.dart';
import '../../../core/model/user_model.dart';
import '../../../core/widgets/default_popup_text.dart';
import '../../../core/widgets/error/custom_dialog.dart';

void login(String email, String password, BuildContext context,
    GlobalKey<FormState> formKey) {
  if (formKey.currentState != null) {
    if (!formKey.currentState!.validate()) return;
  }
  // ignore: omit_local_variable_types
  List<User> dummyUsers = users;
  var userIndex = dummyUsers.indexWhere((element) => element.email == email);
  if (userIndex == -1) {
    CustomDialog(
      content: DefaultPopupText(text: getText(context, 'user_not_found')),
      rightButtonText: getText(context, 'ok'),
    ).show(context);
  } else if (dummyUsers[userIndex].password != password) {
    CustomDialog(
      content: DefaultPopupText(text: getText(context, 'wrong_password')),
      rightButtonText: getText(context, 'ok'),
    ).show(context);
  } else if (dummyUsers[userIndex].authorityLevel == 2) {
    Navigator.of(context).pushNamed(authorizedHomeRoute);
  } else if (dummyUsers[userIndex].authorityLevel == 1) {
    Navigator.of(context).pushNamed(unauthorizedHomeRoute);
  }
}
