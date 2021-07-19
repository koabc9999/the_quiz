import 'package:flutter/material.dart';


class PostScreen extends StatefulWidget {
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  Widget build(BuildContext build) {
    Size screenSize = MediaQuery.of(context).size;
    double height = screenSize.height;
    double width = screenSize.width;
    
    return SafeArea(
      child: Scaffold(

      ),
    );
  }
}