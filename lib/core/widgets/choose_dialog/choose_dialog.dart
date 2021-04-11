import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sambapos_admin/core/widgets/default_button_row.dart';

import '../../dummy/dummy_roles.dart';
import '../../init/helper/get_text.dart';
import '../../init/screen/screen_config.dart';

class InfoChooseDialog extends StatefulWidget {
  final String value;
  final String title;
  final Function setValue;

  const InfoChooseDialog(
      {required this.setValue, required this.value, required this.title});

  @override
  _InfoChooseDialogState createState() => _InfoChooseDialogState();
}

class _InfoChooseDialogState extends State<InfoChooseDialog> {
  var _radioValue;

  @override
  void initState() {
    var index = roles.indexWhere((element) => element.name == widget.value);
    if (index != -1) {
      _radioValue = index;
    }
    super.initState();
  }

  void _handleRadioValueChange(val) {
    setState(() {
      _radioValue = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: Sc.height!, right: Sc.width!, left: Sc.width!),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.headline3!.copyWith(
                color: Theme.of(context).primaryColor,
                fontSize: Sc.text! * 1.65),
          ),
          SizedBox(
            height: Sc.height! * 2,
          ),
          ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: roles.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(top: Sc.height!),
                  child: Row(
                    children: [
                      Radio(
                        activeColor: Theme.of(context).accentColor,
                        value: index,
                        groupValue: _radioValue,
                        onChanged: (val) => _handleRadioValueChange(index),
                      ),
                      GestureDetector(
                        onTap: () => _handleRadioValueChange(index),
                        child: Text(
                          roles[index].name,
                          style: TextStyle(fontSize: Sc.text! * 1.5),
                        ),
                      ),
                    ],
                  ),
                );
              }),
          SizedBox(
            height: Sc.height! * 2,
          ),
          DefaultButtonRow(
              onPressed: onPressed, mainAxisAlignment: MainAxisAlignment.end)
        ],
      ),
    );
  }

  void onPressed() {
    widget.setValue(_radioValue);
  }
}
