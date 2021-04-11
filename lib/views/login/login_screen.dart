import 'package:flutter/material.dart';

import '../../core/init/helper/get_text.dart';
import '../../core/init/screen/screen_config.dart';
import '../../core/widgets/divider.dart';
import '../../core/widgets/rounded_button.dart';
import '../../core/widgets/rounded_text_form.dart';
import 'functions/login.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: Sc.height! * 65,
          width: Sc.width! * 65,
          child: bodyCard(),
        ),
      ),
    );
  }

  Widget bodyCard() {
    return Card(
      color: Theme.of(context).canvasColor,
      shadowColor: Theme.of(context).primaryColor,
      elevation: Sc.image! * 3,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sc.image! * 4)),
      child: Row(
        children: [leftSide(), rightSide()],
      ),
    );
  }

  Widget rightSide() {
    return Expanded(
      flex: 3,
      child: Container(
        margin: EdgeInsets.only(bottom: Sc.height! * 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [upperPart(), form(), loginButton()],
        ),
      ),
    );
  }

  Widget leftSide() {
    return Expanded(
        flex: 2,
        child: Padding(
          padding: EdgeInsets.only(left: Sc.width! * 2),
          child: Image(image: AssetImage('assets/logo/logo.png')),
        ));
  }

  Widget form() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          formField('email'),
          formField('password'),
        ],
      ),
    );
  }

  Widget formField(String type) {
    var isEmail = type == 'email';
    return Container(
        margin: EdgeInsets.only(top: Sc.height! * (isEmail ? 6 : 3)),
        width: Sc.width! * 30,
        height: Sc.height! * 6,
        child: RoundedTextForm(
            type: isEmail ? 'email' : 'password',
            hintText: getText(context, isEmail ? 'email' : 'password'),
            icon: isEmail ? Icons.email : Icons.lock_outline,
            save: save));
  }

  Widget loginButton() {
    return Container(
        margin: EdgeInsets.only(top: Sc.height! * 3),
        height: Sc.height! * 6.7,
        width: Sc.width! * 30,
        child: RoundedButton(
          onPressed: () => login(email, password, context, formKey),
          text: getText(context, 'login'),
        ));
  }

  Widget upperPart() {
    return Column(
      children: [
        Text(getText(context, 'welcome'),
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(fontSize: Sc.text! * 4)),
        Container(
          constraints: BoxConstraints(maxWidth: Sc.width! * 25),
          padding: EdgeInsets.only(top: Sc.height! * 2.6),
          child: DividerWidget(color: Colors.black54),
        )
      ],
    );
  }

  void save(String text, isPassword) {
    if (isPassword) {
      password = text;
    } else {
      email = text;
    }
  }
}
