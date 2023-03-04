import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:restuarant/model/restaurant_model.dart';

class NetworkHelper {
  static Future<Restaurant> fetchRestaurantDetails() async {
    const String url = "https://kezel.co/api/getAllDigitalMenu.php";

    Map<String, dynamic> data = {};
    final uri = Uri.parse(url);
    final _body = {"restaurant": "LeisureInnVKL"};
    final response = await http.post(uri, body: _body);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      data["response"] = json["response"];
      // log(data.toString());
      data["website"] = json["website"];
      // log(data.toString());
      data["menu_items"] = json["menu_items"];
      // log(data.toString());
      data["page_title"] = json["page_title"];
      log(data.toString());
      final restaurant = Restaurant.fromJson(json);

      return restaurant;
    } else {
      log("Error");
      return Future.error("Something went wrong");
    }
  }
}
