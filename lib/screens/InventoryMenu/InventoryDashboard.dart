import 'package:flutter/material.dart';
import 'package:parsel_flutter/screens/InventoryMenu/Inward.dart';
import 'package:parsel_flutter/screens/InventoryMenu/PackingList.dart';
import 'package:parsel_flutter/screens/InventoryMenu/Sorting.dart';
import 'package:parsel_flutter/screens/InventoryMenu/Storage.dart';
import 'package:parsel_flutter/utils/colors.dart';

class InventoryDashboardScreen extends StatelessWidget {
  InventoryDashboardScreen({Key? key}) : super(key: key);
  List<String> listTitle = [
    'Inward',
    'Sorting',
    'Packing List',
    'Storage',
  ];

  List<Image> imageList = [
    Image.asset('assets/parsellogo.png'),
    Image.asset('assets/parsellogo.png'),
    Image.asset('assets/parsellogo.png'),
    Image.asset('assets/parsellogo.png')
  ];

  inwardNavigation(context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => InwardScreen()));
  }

  sortingNavigation(context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => SortingScreen()));
  }

  packingListnavigation(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => PackingListScreen()));
  }

  storageNavigation(context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => StorageScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: blueColor,
          title: Text('Inventory Menu'),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(10),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 7,
              ),
              itemBuilder: (context, indx) {
                return InkWell(
                  onTap: () {
                    listTitle[indx] == 'Inward'
                        ? inwardNavigation(context)
                        : listTitle[indx] == 'Sorting'
                            ? sortingNavigation(context)
                            : listTitle[indx] == 'Packing List'
                                ? packingListnavigation(context)
                                : storageNavigation(context);
                  },
                  child: Card(
                    shadowColor: Colors.black,
                    elevation: 5,
                    margin: EdgeInsets.all(4.0),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 12.0, top: 6.0, bottom: 2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: 20,
                              width: 20,
                              child: Image.asset('assets/parsellogo.png')),
                          Text(
                            listTitle[indx],
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }
}
