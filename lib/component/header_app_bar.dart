import 'package:bloc_demo/resource/app_style.dart';
import 'package:bloc_demo/resource/constants.dart';
import 'package:flutter/material.dart';

import '../resource/app_color.dart';

class HeaderAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? displayName;
  final String? email;
  final String? photoURL;
  final VoidCallback? onTap;
  const HeaderAppBar({
    Key? key,
    this.displayName,
    this.email,
    this.photoURL,
    this.onTap,
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
            email ?? "anhtien@gmail.com",
            style: AppStyle.lightTitle.copyWith(
              fontSize: 14,
            ),
          ),
        ],
      ),
      actions: [
        photoURL != null
            ? GestureDetector(
                onTap: onTap,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.hDDDDDD,
                  ),
                  padding: EdgeInsets.all(Constants.size10),
                  margin: EdgeInsets.only(right: Constants.size10),
                  child: Image.network(
                    "$photoURL",
                    fit: BoxFit.fitHeight,
                  ),
                ),
              )
            : GestureDetector(
                onTap: onTap,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.hDDDDDD,
                  ),
                  padding: EdgeInsets.all(Constants.size10),
                  margin: EdgeInsets.only(right: Constants.size10),
                  child: const Icon(
                    Icons.person,
                    color: AppColor.h413F42,
                  ),
                ),
              ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Constants.heightAppBar);
}
