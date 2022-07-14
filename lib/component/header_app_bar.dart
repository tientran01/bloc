import 'package:badges/badges.dart';
import 'package:bloc_demo/resource/app_color.dart';
import 'package:bloc_demo/resource/app_resource.dart';
import 'package:bloc_demo/resource/app_style.dart';
import 'package:bloc_demo/resource/constants.dart';
import 'package:flutter/material.dart';

class HeaderAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? displayName;
  final String? email;
  final VoidCallback? onTap;
  final int? notificationCount;
  const HeaderAppBar({
    Key? key,
    this.displayName,
    this.email,
    this.onTap,
    this.notificationCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            displayName ?? "Hello",
            style: AppStyle.title,
          ),
          Text(
            email ?? "",
            style: AppStyle.lightTitle.copyWith(
              fontSize: 14,
            ),
          ),
        ],
      ),
      actions: [
        InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(Constants.size15),
            child: Badge(
              position: BadgePosition.topEnd(),
              badgeContent: notificationCount == null
                  ? const Text(
                      "0",
                      style: TextStyle(
                        color: AppColor.hFFFFFF,
                      ),
                    )
                  : Text(
                      "$notificationCount",
                      style: const TextStyle(
                        color: AppColor.hFFFFFF,
                      ),
                    ),
              animationType: BadgeAnimationType.fade,
              badgeColor: AppColor.h413F42,
              child: Image.asset(
                AppResource.notification,
                width: Constants.size30,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Constants.heightAppBar);
}
