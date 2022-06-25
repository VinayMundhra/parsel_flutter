import 'package:flutter/material.dart';
import 'package:parsel_flutter/screens/InventoryMenu/InventoryDashboard.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

String? index;
bool isSelected = false;

List<String> dashBoardMenu = [
  'PENDING',
  'IN PROCESS',
  'DELIVERED',
  'ATTEMPTED',
  'RETURNED',
];
List<String> dashBoardtext = [
  '1',
  '5',
  '23',
  '7',
  '9',
];

dashBoard(index) {
  return InkWell(
    onTap: () {},
    child: Card(
        color: isSelected == true ? Colors.blue : Colors.grey.shade200,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        elevation: 5,
        child: ListTile(
            leading: Icon(Icons.icecream),
            title: Text(dashBoardMenu[index]),
            trailing: Text(
              dashBoardtext[index],
              style: TextStyle(
                  fontSize: 15,
                  color: isSelected ? Colors.yellow : Colors.black87),
            ))),
  );
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(backgroundColor: Colors.blue),
      appBar: AppBar(
        title: Text('DashBoard'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        isSelected = false;
                      });
                    },
                    child: !isSelected
                        ? Card(
                            color: Colors.blue,
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            elevation: 5,
                            child: ListTile(
                                leading: Icon(Icons.icecream),
                                title: Text(dashBoardMenu[0]),
                                trailing: Text(
                                  dashBoardtext[0],
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.yellow),
                                )))
                        : Card(
                            color: Colors.grey.shade200,
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            elevation: 5,
                            child: ListTile(
                                leading: Icon(Icons.icecream),
                                title: Text(dashBoardMenu[0]),
                                trailing: Text(
                                  dashBoardtext[0],
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black87),
                                )))),
                InkWell(
                    onTap: () {
                      setState(() {
                        isSelected = true;
                      });
                    },
                    child: isSelected
                        ? Card(
                            color: Colors.blue,
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            elevation: 5,
                            child: ListTile(
                                leading: Icon(Icons.icecream),
                                title: Text(dashBoardMenu[1]),
                                trailing: Text(
                                  dashBoardtext[1],
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.yellow),
                                )))
                        : Card(
                            color: Colors.grey.shade200,
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            elevation: 5,
                            child: ListTile(
                                leading: Icon(Icons.icecream),
                                title: Text(dashBoardMenu[1]),
                                trailing: Text(
                                  dashBoardtext[1],
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black87),
                                )))),
                InkWell(
                    onTap: () {
                      setState(() {
                        isSelected = true;
                      });
                    },
                    child: isSelected
                        ? Card(
                            color: Colors.blue,
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            elevation: 5,
                            child: ListTile(
                                leading: Icon(Icons.icecream),
                                title: Text(dashBoardMenu[1]),
                                trailing: Text(
                                  dashBoardtext[1],
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.yellow),
                                )))
                        : Card(
                            color: Colors.grey.shade200,
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            elevation: 5,
                            child: ListTile(
                                leading: Icon(Icons.icecream),
                                title: Text(dashBoardMenu[1]),
                                trailing: Text(
                                  dashBoardtext[1],
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black87),
                                )))),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10),
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => InventoryDashboardScreen()));
          },
          label: const Text('INVENTORY'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
