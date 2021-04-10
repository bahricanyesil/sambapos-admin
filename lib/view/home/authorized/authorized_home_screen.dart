import 'package:flutter/material.dart';

import './components/number_pad.dart';
import './components/pin_item.dart';
// ignore: directives_ordering
import '../../../core/init/helper/get_text.dart';
import '../../../core/init/screen/screen_config.dart';
import '../../../core/widgets/app_bar.dart';
import 'functions/confirm_pin.dart';
import 'functions/delete_pin.dart';
import 'functions/set_pin.dart';

class AuthorizedHomeScreen extends StatefulWidget {
  @override
  _AuthorizedHomeScreenState createState() => _AuthorizedHomeScreenState();
}

class _AuthorizedHomeScreenState extends State<AuthorizedHomeScreen> {
  List<String> currentPins = List.generate(4, (index) => '');
  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());
  List<TextEditingController> controllers =
      List.generate(4, (index) => TextEditingController());

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          getAppBar(context: context, title: getText(context, 'home_screen')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            pinText(),
            SizedBox(height: Sc.height! * 4),
            pinRow(),
            SizedBox(height: Sc.height! * 4),
            Container(
                height: Sc.height! * 60,
                width: Sc.width! * 35,
                child: NumberPad(
                  setPin: setPinSetState,
                  deletePin: deletePinSetState,
                  confirmPin: confirmPinSetState,
                ))
          ],
        ),
      ),
    );
  }

  Widget pinText() {
    return Text(getText(context, 'enter_pin'),
        style: Theme.of(context).textTheme.headline1);
  }

  Widget pinRow() {
    var index = -1;
    return SizedBox(
      width: Sc.width! * 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...controllers.map((controller) {
            index++;
            return PinItem(
                controller: controller,
                changeIndex: changeIndex,
                index: index,
                focusNode: focusNodes[index],
                setPin: setPinSetState);
          })
        ],
      ),
    );
  }

  void setPinSetState(String text, [int? index]) {
    setState(() {
      currentIndex = setPin(
          text, index, currentIndex, currentPins, controllers, focusNodes);
    });
  }

  void deletePinSetState() {
    setState(() {
      currentIndex =
          deletePin(currentIndex, currentPins, controllers, focusNodes);
    });
  }

  void confirmPinSetState() {
    setState(() {
      confirmPin(currentPins, context);
    });
  }

  void changeIndex(int index) {
    currentIndex = index;
    controllers[currentIndex].selection =
        TextSelection.fromPosition(TextPosition(offset: 0));
  }
}
