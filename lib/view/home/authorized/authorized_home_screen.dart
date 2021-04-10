import 'package:flutter/material.dart';

import './components/number_pad.dart';
import './components/pin_item.dart';
// ignore: directives_ordering
import '../../../core/init/helper/get_text.dart';
import '../../../core/init/screen/screen_config.dart';
import '../../../core/widgets/app_bar.dart';

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
                child: NumberPad(setPin: setPin))
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
                setPin: setPin);
          })
        ],
      ),
    );
  }

  void setPin(String text, [int? index]) {
    setState(() {
      if (index != null) {
        currentIndex = index;
      }
      currentPins[currentIndex] = text;
      controllers[currentIndex].text = text;
      controllers[currentIndex].selection = TextSelection.fromPosition(
          TextPosition(offset: controllers[currentIndex].text.length));
      if (currentIndex != controllers.length - 1) {
        currentIndex = currentIndex + 1;
      }
      focusNodes[currentIndex].requestFocus();
    });
    print(currentPins);
  }

  // ignore: use_setters_to_change_properties
  void changeIndex(int index) {
    currentIndex = index;
    controllers[currentIndex].selection = TextSelection.fromPosition(
        TextPosition(offset: controllers[currentIndex].text.length));
  }
}
