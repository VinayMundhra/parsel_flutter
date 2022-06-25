import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/colors.dart';
import 'package:intl/intl.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';


class InwardScreen extends StatefulWidget {
  const InwardScreen({Key? key}) : super(key: key);

  @override
  State<InwardScreen> createState() => _InwardScreenState();
}

class _InwardScreenState extends State<InwardScreen> {
  String? scanResult;
  var cDate = "";
  List<String> items1 = ['Pallet A', 'Pallet B', 'Pallet C'];
  String? selectedValue1;
  String dropdownValue = 'Pallet A';

  List<String> inwardList = [
    'Sales Order :',
    'Barcode ID :',
    'SKU Name :',
    'Quantity :',
    'Batch :',
    'Aging :',
    'Location :',
  ];
  @override
  void initState() {
    super.initState();
    scanBarcode;
    DateTime dateToday = DateTime.now();
    cDate = DateFormat('dd-MM-yyyy').format(dateToday);
  }

  Future scanBarcode() async {
    String scanResult;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(scanResult);
    } on PlatformException {
      scanResult = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      // this.scanResult = scanResult;
    });
  }

  saleBarcodeTextfield() {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(left: 10, top: 10, bottom: 5),
      height: 200,
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 3,
            offset: Offset(0, 2),
            spreadRadius: 1)
      ]),
      child: Text('ggg'),
    );
  }

  quantityBatchTextField(index) {
    return Container(
      padding: EdgeInsets.only(top: 10, right: 10),
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(left: 10, top: 10, bottom: 5),
      height: 200,
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 3,
            offset: Offset(0, 2),
            spreadRadius: 1)
      ]),
      child: TextField(
        textAlign: TextAlign.end,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: inwardList[index] == 'Batch :' ? 'Enter Batch' : '00'),
      ),
    );
  }

  agingTextField() {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(top: 10, right: 10),
        alignment: Alignment.centerRight,
        margin: EdgeInsets.only(left: 10, top: 10, bottom: 5),
        height: 200,
        width: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 3,
              offset: Offset(0, 2),
              spreadRadius: 1)
        ]),
        child: Text(cDate),
      ),
    );
  }

  datePicker() {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        // //minTime: DateTime(2018, 3, 5),
        maxTime: DateTime.now(),
        onChanged: (date) {}, onConfirm: (date) {
      cDate = DateFormat('dd-MM-yyyy').format(date);
      print(DateFormat('dd-MM-yyyy').format(date));
    }, currentTime: DateTime.now());
  }

  // dropDownMenu() {
  //   DropdownButtonHideUnderline(
  //     child: DropdownButton2(
  //       isExpanded: true,
  //       hint: Row(
  //         children: [
  //           Expanded(
  //             child: Text(
  //               items1[0],
  //               style: TextStyle(
  //                 fontSize: 12,
  //                 fontWeight: FontWeight.bold,
  //                 color: Colors.black,
  //               ),
  //               overflow: TextOverflow.ellipsis,
  //             ),
  //           ),
  //         ],
  //       ),
  //       items: items1
  //           .map((item) => DropdownMenuItem<String>(
  //               value: item,
  //               child: Text(item,
  //                   overflow: TextOverflow.ellipsis,
  //                   maxLines: 2,
  //                   style: const TextStyle(
  //                     fontWeight: FontWeight.bold,
  //                     color: Colors.black,
  //                   ))))
  //           .toList(),
  //       value: selectedValue1,
  //       onChanged: (value) {
  //         setState(() {
  //           selectedValue1 = value as String; // onSelect
  //         });
  //       },
  //       icon: const Icon(Icons.keyboard_arrow_down),
  //       iconSize: 25,
  //       iconEnabledColor: Colors.black,
  //       // iconDisabledColor: Colors.grey,
  //       buttonHeight: 50,
  //       buttonWidth: MediaQuery.of(context).size.width * 0.6,
  //       buttonPadding: const EdgeInsets.only(left: 14, right: 14),
  //       buttonDecoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(14),
  //         border: Border.all(
  //           color: Colors.black26,
  //         ),
  //         color: Colors.white,
  //       ),
  //       buttonElevation: 2,
  //       itemHeight: 30,
  //       itemPadding: const EdgeInsets.only(left: 14, right: 14),
  //       dropdownMaxHeight: MediaQuery.of(context).size.height * 0.4,
  //       dropdownWidth: MediaQuery.of(context).size.width * 0.6,
  //       dropdownPadding: null,
  //       dropdownDecoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(14),
  //         color: Colors.white,
  //       ),
  //       dropdownElevation: 8,
  //       scrollbarRadius: const Radius.circular(40),
  //       scrollbarThickness: 6,
  //       scrollbarAlwaysShow: true,
  //       offset: const Offset(0, 0),
  //     ),
  //   );
  // }

  dropDownMenu() {
    return Container(
      height: 40,
      child: DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(
            Icons.arrow_drop_down,
            size: 30,
          ),
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>['Pallet A', 'Pallet B', 'Pallet C']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList()),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inward'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                (Expanded(
                  flex: 4,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.09,
                    padding: EdgeInsets.only(top: 10, left: 10, right: 5),
                    // margin: EdgeInsets.symmetric(horizontal: 5),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            // borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2),
                          ),
                          filled: true,
                          hintText: 'Sku Name',
                          hintStyle: TextStyle(color: Colors.black),
                          fillColor: Colors.white,
                          focusColor: Colors.white),
                    ),
                  ),
                )),
                Expanded(
                  flex: 3,
                  child: InkWell(
                    onTap: () {
                      print('Scan____');
                      scanBarcode;
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      margin: EdgeInsets.only(top: 5, left: 5, right: 10),
                      color: blueColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Scan',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.qr_code_scanner,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 400,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: inwardList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        leading: Text(
                          inwardList[index],
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        trailing: inwardList[index] == 'Quantity :' ||
                                inwardList[index] == 'Batch :'
                            ? quantityBatchTextField(index)
                            : inwardList[index] == 'Aging :'
                                ? agingTextField()
                                : inwardList[index] == 'Location :'
                                    ? dropDownMenu()
                                    : saleBarcodeTextfield());
                  }),
            ),
          ],
        ),
      )),
    );
  }
}
