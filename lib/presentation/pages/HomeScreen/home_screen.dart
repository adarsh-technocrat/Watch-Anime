import 'package:flutter/material.dart';
import 'package:watch_anime/presentation/layout/layout.dart';
import 'package:watch_anime/presentation/pages/MainContentSection/main_content_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Layout(child: MainContentSection());
  }
}
