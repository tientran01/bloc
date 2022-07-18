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
            "Hello $displayName",
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
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(Constants.size10),
                child: Image.asset(
                  AppResource.notification,
                  width: Constants.size30,
                ),
              ),
              Positioned(
                top: 0,
                right: 1,
                child: Container(
                  padding: EdgeInsets.all(Constants.size10),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.h413F42,
                  ),
                  child: Text(
                    notificationCount.toString(),
                    style: const TextStyle(
                      color: AppColor.hFFFFFF,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Constants.heightAppBar);
}
