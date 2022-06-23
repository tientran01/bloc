import 'dart:convert';

import 'package:http/http.dart' as http;
import '../component/app_string.dart';
import '../model/datum.dart';

class RestaurantRepository  {

  @override
  Future<RestaurantModel> getRestaurantData() async {
    final response =  await http.get(Uri.parse(AppStrings.cricArticleUrl));

    if (response.statusCode == 200) {
      List<int> bytes = response.body.toString().codeUnits;
      var responseString = utf8.decode(bytes);
      return RestaurantModel.fromJson(jsonDecode(responseString));
    } else {
      print("EEEE");
      throw Exception();
    }
  }

}