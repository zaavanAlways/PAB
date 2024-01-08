import 'package:flutter/material.dart';
import 'package:nakama_shoes/theme/custom_app_theme.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final Width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: Width,
      height: height * 0.6,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("No Shoes Added !", style: AppTheme.bagEmptyListTitle),
          Text(
            "Once You Have Added, Come Back :)",
            style: AppTheme.bagEmptyListSubTitle,
          )
        ],
      ),
    );
  }
}
