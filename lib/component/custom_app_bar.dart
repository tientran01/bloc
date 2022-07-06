import 'package:bloc_demo/resource/app_style.dart';
import 'package:bloc_demo/resource/constants.dart';
import 'package:bloc_demo/router/navigation_service.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? leadingIconPath;
  final Function? onPressed;
  final String? title;
  const CustomAppBar({
    Key? key,
    this.leadingIconPath,
    this.onPressed,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      title: Text(
        title ?? "",
        style: AppStyle.title,
      ),
      leading: IconButton(
        onPressed: () => NavigationService.navigatorKey.currentState?.pop(),
        icon: Image.asset(leadingIconPath ?? ""),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Constants.heightAppBar);
}
