import 'package:flutter/material.dart';

import '../../theme/custom_app_theme.dart';
import '../../utils/constants.dart';

class UserViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UserViewAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: const Padding(
        padding: EdgeInsets.only(
          top: 8.0,
        ),
        child: Text(
          "Profile",
          style: AppTheme.profileAppBarTitle,
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(top: 8.0, right: 5),
          child: Icon(
            Icons.more_vert,
            color: AppConstantsColor.darkTextColor,
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
