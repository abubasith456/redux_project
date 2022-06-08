import "package:flutter/material.dart";
import '../navidation_drawer.dart';

class AboutUs extends StatelessWidget {
  static const String routeName = '/contactPage';

  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("About us"),
        ),
        drawer: NavigationDrawer(),
        body: const Center(child: Text("This is contacts page")));
  }
}
