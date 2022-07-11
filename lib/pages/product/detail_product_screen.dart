import 'package:bloc_demo/component/custom_app_bar.dart';
import 'package:bloc_demo/resource/app_strings.dart';
import 'package:flutter/material.dart';

class DetailProductScreen extends StatelessWidget {
  const DetailProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.detailProduct,
      ),
      body: Container(),
    );
  }
}
