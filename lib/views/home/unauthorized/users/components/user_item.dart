import 'package:flutter/material.dart';

import '../../../../../core/constants/navigation.dart';
import '../../../../../core/decoration/container.dart';
import '../../../../../core/dummy/dummy_user_data.dart';
import '../../../../../core/init/helper/edit_user_args.dart';
import '../../../../../core/init/screen/screen_config.dart';
import '../functions/get_authority.dart';

class UserItem extends StatelessWidget {
  final int userIndex;
  const UserItem({required this.userIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: Sc.height! * 2),
        height: Sc.height! * 12,
        decoration: ContainerDeco().infoItem(context),
        child: Row(
          children: [
            userPhoto(),
            middleColumn(context),
            Spacer(),
            roleInfo(context),
            editButton(context, userIndex),
            SizedBox(width: Sc.width! * 1.6)
          ],
        ));
  }

  Widget userPhoto() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: Sc.height!, horizontal: Sc.width! * 1.5),
      child: Image(image: AssetImage('assets/images/no_user.png')),
    );
  }

  Widget middleColumn(context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sc.width!),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          emailWidget(context),
          SizedBox(height: Sc.height!),
          authorityWidget(context),
        ],
      ),
    );
  }

  Widget emailWidget(context) {
    return Text(users[userIndex].email,
        style: Theme.of(context)
            .textTheme
            .headline4!
            .copyWith(fontSize: Sc.width! * 1.1 + Sc.height! * .5));
  }

  Widget authorityWidget(context) {
    return Text(getAuthority(context, userIndex),
        style: Theme.of(context)
            .textTheme
            .headline5!
            .copyWith(fontSize: Sc.width! + Sc.height! * .4));
  }

  Widget roleInfo(context) {
    return Padding(
      padding: EdgeInsets.only(right: Sc.width! * 2),
      child: Row(
        children: [
          Icon(users[userIndex].role.icon,
              color: Theme.of(context).primaryColor, size: Sc.image! * 3.3),
          SizedBox(
            width: Sc.width! * .8,
          ),
          roleName(context)
        ],
      ),
    );
  }

  Widget roleName(context) {
    return Text(users[userIndex].role.name,
        style: Theme.of(context).textTheme.headline4!.copyWith(
            color: Theme.of(context).primaryColor,
            fontSize: Sc.width! * 1.1 + Sc.height! * .5));
  }

  Widget editButton(context, index) {
    return IconButton(
        icon: Icon(Icons.edit_outlined,
            color: Theme.of(context).primaryColor, size: Sc.image! * 3.1),
        onPressed: () => Navigator.of(context)
            .pushNamed(editUserRoute, arguments: EditUserArguments(index)));
  }
}
