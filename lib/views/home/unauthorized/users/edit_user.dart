import 'package:flutter/material.dart';

import '../../../../core/constants/navigation.dart';
import '../../../../core/dummy/dummy_roles.dart';
import '../../../../core/dummy/dummy_user_data.dart';
import '../../../../core/init/helper/edit_user_args.dart';
import '../../../../core/init/helper/get_text.dart';
import '../../../../core/init/screen/screen_config.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/choose_dialog/show_choose_dialog.dart';
import '../../../../core/widgets/default_button_row.dart';
import '../../../../core/widgets/form_component.dart';
import 'functions/get_authority.dart';

class EditUser extends StatefulWidget {
  @override
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  int userIndex = 0;
  String email = 'default';
  String roleName = 'default';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as EditUserArguments;
    userIndex = args.userIndex;
    return Scaffold(
      appBar: getAppBar(context: context, title: getText(context, 'edit_user')),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Sc.width! * 5, vertical: Sc.height! * 5),
        child: mainColumn(context),
      ),
    );
  }

  Widget mainColumn(context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Row(
            children: [
              userPhoto(context),
              Expanded(flex: 2, child: infoColumn(context))
            ],
          ),
        ),
        Expanded(flex: 1, child: Container())
      ],
    );
  }

  Widget userPhoto(context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.all(Sc.image! * 3),
        child: Image(
          image: AssetImage('assets/images/no_user.png'),
        ),
      ),
    );
  }

  Widget infoColumn(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: Sc.height! * 3),
        emailInfo(context),
        SizedBox(height: Sc.height! * 1.2),
        FormComponent(
            formKey: emailFormKey,
            initialText: users[userIndex].email,
            editText: editEmail),
        SizedBox(height: Sc.height! * 3),
        roleColumn(context),
        SizedBox(height: Sc.height! * 5),
        authorityColumn(context),
        Spacer(),
        DefaultButtonRow(
            routeName: unauthorizedHomeRoute,
            spaceConst: 5,
            onPressed: saveInfo,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start)
      ],
    );
  }

  Widget authorityColumn(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textPart(context, 'authority'),
        SizedBox(height: Sc.height! * 1.8),
        Text(getAuthority(context, userIndex),
            style: Theme.of(context).textTheme.headline4)
      ],
    );
  }

  Widget roleColumn(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textPart(context, 'role'),
        SizedBox(height: Sc.height! * 1.8),
        roleInfoRow(context)
      ],
    );
  }

  Widget roleInfoRow(context) {
    var role = users[userIndex].role;
    if (roleName != 'default') {
      role = roles[roles.indexWhere((element) => element.name == roleName)];
    }
    return Row(
      children: [
        Icon(role.icon, size: Sc.image! * 2.6),
        SizedBox(width: Sc.width! * .6),
        Text(role.name, style: Theme.of(context).textTheme.headline4),
        SizedBox(width: Sc.width! * 1.6),
        changeRoleButton(context, role.name)
      ],
    );
  }

  Widget changeRoleButton(context, name) {
    return TextButton(
      onPressed: () => showChooseDialog(
          context, getText(context, 'choose_role'), name, setRole),
      child: Text(getText(context, 'change'),
          style: TextStyle(color: Theme.of(context).primaryColor)),
    );
  }

  Widget textPart(context, text) {
    return Text(getText(context, text),
        style: Theme.of(context).textTheme.headline3!.copyWith(
            color: Theme.of(context).primaryColor,
            decoration: TextDecoration.underline));
  }

  Widget emailInfo(context) {
    return Text(getText(context, 'email'),
        style: Theme.of(context).textTheme.headline3!.copyWith(
            color: Theme.of(context).primaryColor,
            decoration: TextDecoration.underline));
  }

  void saveInfo() {
    if (email != 'default') {
      users[userIndex].email = email;
    }
    if (roleName != 'default') {
      users[userIndex].role =
          roles[roles.indexWhere((element) => element.name == roleName)];
    }
  }

  void setRole(index) {
    setState(() {
      roleName = roles[index].name;
    });
  }

  void editEmail(val) {
    setState(() {
      email = val;
    });
  }
}
