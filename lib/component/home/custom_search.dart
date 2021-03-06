import 'package:bloc_demo/resource/app_color.dart';
import 'package:bloc_demo/resource/app_resource.dart';
import 'package:bloc_demo/resource/app_strings.dart';
import 'package:bloc_demo/resource/constants.dart';
import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 60.0,
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(
            Constants.size20,
          ),
          hintText: AppStrings.searchInput,
          border: outlineInputBorder(),
          focusedBorder: outlineInputBorder(),
          fillColor: AppColor.hFFFFFF,
          filled: true,
          suffixIcon: Container(
            padding: EdgeInsets.all(Constants.size10),
            child: GestureDetector(
              onTap: () {},
              child: Image.asset(
                AppResource.search,
                width: 10,
              ),
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder({Color? color}) {
    return OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(20.0),
    );
  }
}
