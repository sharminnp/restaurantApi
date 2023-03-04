import 'package:flutter/material.dart';
import 'package:restuarant/controler/network_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NetworkHelper.fetchRestaurantDetails();
    return Scaffold();
  }
}
