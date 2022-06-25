import 'package:flutter/material.dart';

class PackingListScreen extends StatefulWidget {
  const PackingListScreen({ Key? key }) : super(key: key);

  @override
  State<PackingListScreen> createState() => _PackingListScreenState();
}

class _PackingListScreenState extends State<PackingListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Packing List'),
      ),
    );
  }
}