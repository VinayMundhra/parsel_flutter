import 'package:flutter/material.dart';

class SortingScreen extends StatefulWidget {
  const SortingScreen({ Key? key }) : super(key: key);

  @override
  State<SortingScreen> createState() => _SortingScreenState();
}

class _SortingScreenState extends State<SortingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sorting'),
      ),
    );
  }
}