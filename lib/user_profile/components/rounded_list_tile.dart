import 'package:flutter/material.dart';
import 'package:nakama_shoes/theme/custom_app_theme.dart';
import 'package:nakama_shoes/utils/constants.dart';

class RoundedListTile extends StatelessWidget {
  const RoundedListTile(
      {Key? key,
      this.leadingBackColor,
      required this.icon,
      required this.tittle,
      required this.trailing})
      : super(key: key);

  final Color? leadingBackColor;
  final IconData icon;
  final String tittle;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: SizedBox(
          width: double.infinity,
          height: 70,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: leadingBackColor,
              radius: 25,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  icon,
                  color: AppConstantsColor.lightTextColor,
                ),
              ),
            ),
            title: Text(tittle, style: AppTheme.profileRepeatedListTileTitle),
            trailing: trailing,
          ),
        ),
      ),
    );
  }
}
