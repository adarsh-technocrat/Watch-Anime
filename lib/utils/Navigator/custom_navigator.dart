import 'package:flutter/material.dart';
import 'package:watch_anime/presentation/layout/routing_page_layout.dart';

class CustomNavigator {
  void customNavigator(BuildContext context, Widget screen) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => RoutingPageLayout(child: screen)));
  }
}
