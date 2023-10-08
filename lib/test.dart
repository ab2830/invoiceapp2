// import 'package:firestore/product.dart';
// import 'package:flutter/material.dart';
//
// import 'AA.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Chip Input',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ChipInputScreen(),
//     );
//   }
// }
//
// class ChipInputScreen extends StatefulWidget {
//   @override
//   _ChipInputScreenState createState() => _ChipInputScreenState();
// }
//
// class _ChipInputScreenState extends State<ChipInputScreen> {
//   List<String> _selectedChips = [];
//   List<String> _dropdownOptions = [
//     'Option 1',
//     'Option 2',
//     'Option 3',
//     'Option 4'
//   ];
//
//   String a = "item2";
//   List<Product> data = [
//     // Add more data...
//   ];
//   String? _selectedCountryCode;
//   List<String> _countryCodes = ['+91', '+23'];
//
//   TextEditingController _textEditingController = TextEditingController();
//   int qty = 0;
//
//   String dropdownValue = 'Option 1';
//   final GlobalKey _dropdownButtonKey = GlobalKey();
//
//   final List<BillingItem> billingItems = [];
//
//   double calculateTotal() {
//     return billingItems.fold(
//         0, (total, item) => total + (item.quantity * item.price));
//   }
//
//   void _showDropdownMenu() {
//     final RenderBox dropDownButton =
//     _dropdownButtonKey.currentContext!.findRenderObject() as RenderBox;
//     final Offset position = dropDownButton.localToGlobal(Offset.zero);
//
//     final RelativeRect positionRect = RelativeRect.fromRect(
//       Rect.fromPoints(
//           position, position.translate(0.0, dropDownButton.size.height)),
//       Offset.zero & MediaQuery.of(context).size,
//     );
//
//     final List<PopupMenuEntry<String>> items = <PopupMenuEntry<String>>[
//       PopupMenuItem<String>(value: 'Option 1', child: Text('Option 1')),
//       PopupMenuItem<String>(value: 'Option 2', child: Text('Option 2')),
//       PopupMenuItem<String>(value: 'Option 3', child: Text('Option 3')),
//       PopupMenuItem<String>(value: 'Option 4', child: Text('Option 4')),
//     ];
//
//     showMenu<String>(
//       context: context,
//       position: positionRect,
//       items: items,
//     ).then<void>((String? newValue) {
//       if (newValue != null) {
//         setState(() {
//           dropdownValue = newValue;
//         });
//       }
//     });
//   }
//
//   void _addChip(
//       String chipValue,
//       ) {
//     print("adddddd chippp");
//
//     print("item namne---$chipValue");
//     final newItem = BillingItem(
//         id: billingItems.length + 1,
//         itemName: chipValue,
//         quantity: 1,
//         price: 100);
//
//     bool foundMatchingItem = false;
//
//     for (var item in billingItems) {
//       if (item.itemName == chipValue) {
//         setState(() {
//           item.quantity = item.quantity + 1;
//           foundMatchingItem = true;
//         });
//         break; // Exit the loop since the item was found and updated
//       }
//     }
//
//     if (!foundMatchingItem) {
//       setState(() {
//         billingItems.add(newItem);
//       });
//     }
//     //
//     setState(() {
//       //
//
//       _selectedChips.add(chipValue);
//       _textEditingController.clear();
//     });
//   }
//
//   void removeChip(String chipValue) {
//     setState(() {
//
//
//       for (var item in billingItems) {
//         if (item.itemName == chipValue) {
//           setState(() {
//
//             if(item.quantity !=1){
//               item.quantity = item.quantity - 1;
//             }
//             else{
//               setState(() {
//                 billingItems.removeWhere((item) => item.itemName == chipValue);
//
//               });
//
//             }
//
//
//           });
//           break; // Exit the loop since the item was found and updated
//         }
//       }
//
//       _selectedChips.remove(chipValue);
//
//
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Chip Input'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextField(
//                 controller: _textEditingController,
//                 decoration: const InputDecoration(
//                   labelText: 'Enter text',
//                   border: OutlineInputBorder(),
//                 ),
//                 onSubmitted: (value) {
//                   if (value.isNotEmpty) {
//                     _addChip(
//                       _textEditingController.text,
//                     );
//                   }
//                 },
//               ),
//               SizedBox(height: 16.0),
//               if (_selectedChips.length != 0)
//                 Container(
//                   width: double.infinity,
//                   padding: EdgeInsets.symmetric(horizontal: 16),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(16)),
//                       border: Border.all(color: Colors.black)),
//                   child: Wrap(
//                     spacing: 8.0,
//                     children: _selectedChips.map((chipValue) {
//                       return Chip(
//                         label: Text(chipValue),
//                         onDeleted: () {
//                           _removeChip(chipValue);
//                         },
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               SizedBox(height: 16.0),
//               DropdownButtonFormField(
//                 borderRadius: BorderRadius.circular(20.0),
//                 isDense: true,
//                 enableFeedback: true,
//                 isExpanded: true,
//
//
//
//                 items: _dropdownOptions.map((String option) {
//                   return DropdownMenuItem(
//                     value: option,
//
//                     child: Text(option),
//                   );
//                 }).toList(),
//                 onChanged: (selectedValue) {
//                   // if (selectedValue != null && !_selectedChips.contains(selectedValue)) {
//                   _addChip(
//                     selectedValue!.toString(),
//                   );
//                   // }
//                 },
//                 decoration: const InputDecoration(
//                   labelText: 'Select an option',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(
//                 height: 16,
//               ),
//               Container(
//                 decoration:  const BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(14))
//                   // border: Border(
//                   //   right: BorderSide(width: 0.5, color: Colors.grey),
//                   // ),
//                 ),
//                 height: 45.0,
//                 margin: const EdgeInsets.all(3.0), //width: 300.0,
//                 child:
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         decoration: const BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(10),
//                               bottomLeft: Radius.circular(10)),
//                         ),
//                         child: TextFormField(
//                           keyboardType: TextInputType.number,
//                           decoration: const InputDecoration(
//                             contentPadding: EdgeInsets.all(12.0),
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     color: Color(0xFFE0E0E0), width: 0.1)),
//                             fillColor: Colors.white,
//                             hintText: 'Phone Number',
//                           ),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       width: 80,
//                       decoration: const BoxDecoration(
//                           color: Colors.amber,
//                           borderRadius: BorderRadius.only(
//                             topRight: Radius.circular(10),
//                             bottomRight: Radius.circular(10),
//                           )),
//                       child: DropdownButtonHideUnderline(
//                         child: ButtonTheme(
//                           alignedDropdown: true,
//                           child: DropdownButton(
//                             value: _selectedCountryCode,
//                             items: _countryCodes.map((String value) {
//                               return  DropdownMenuItem<String>(
//                                   value: value,
//                                   child: Text(
//                                     value,
//                                     style: const TextStyle(fontSize: 12.0),
//                                   ));
//                             }).toList(),
//                             onChanged: (value) {
//                               setState(() {
//                                 _selectedCountryCode = value;
//                               });
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 16,
//               ),
//               billingItems.length != 0
//                   ? FittedBox(
//                 fit: BoxFit.fitWidth,
//                 child: DataTable(
//
//                   columns: const <DataColumn>[
//                     DataColumn(label: Text('No.',textAlign: TextAlign.center)),
//                     DataColumn(label: Text('Item',textAlign: TextAlign.center)),
//                     DataColumn(label: Text('Quantity',textAlign: TextAlign.center)),
//                     DataColumn(label: Text('Price',textAlign: TextAlign.center)),
//                     DataColumn(label: Text('Total',textAlign: TextAlign.center)),
//                   ],
//                   rows: billingItems.map((billingItem) {
//                     final total =
//                         billingItem.quantity * billingItem.price;
//                     return DataRow(cells: [
//                       DataCell(Text(billingItem.id.toString(), textAlign: TextAlign.center),),
//                       DataCell(Text(billingItem.itemName,textAlign: TextAlign.center)),
//                       DataCell(Text(billingItem.quantity.toString(),textAlign: TextAlign.center)),
//                       DataCell(Text(billingItem.price.toString(),textAlign: TextAlign.center)),
//                       DataCell(Text(total.toString(),textAlign: TextAlign.center)),
//                     ]);
//                   }).toList(),
//                 ),
//               )
//                   : SizedBox()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Responsive Billing DataTable Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyBillingPage(),
//     );
//   }
// }
//
// class BillingItem {
//   final int id;
//   final String itemName;
//   final int quantity;
//   final double price;
//
//   BillingItem({required this.id, required this.itemName, required this.quantity, required this.price});
// }
//
// class MyBillingPage extends StatefulWidget {
//   @override
//   _MyBillingPageState createState() => _MyBillingPageState();
// }
//
// class _MyBillingPageState extends State<MyBillingPage> {
//   final List<BillingItem> billingItems = [
//     BillingItem(id: 1, itemName: 'Item An.mn.mn.mn;.mmljnlmnl;mnbkhnkhoi;hiohhh m56+610+2'
//         '2df6', quantity: 10, price: 100),
//     BillingItem(id: 2, itemName: 'Item B', quantity: 5, price: 50),
//     BillingItem(id: 3, itemName: 'Item C', quantity: 2, price: 20),
//     // Add more billing items...
//   ];
//
//   double calculateTotal() {
//     return billingItems.fold(0, (total, item) => total + (item.quantity * item.price));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Responsive Billing DataTable Example'),
//       ),
//       body: SingleChildScrollView(
//         child: FittedBox(
//           fit: BoxFit.fitWidth,
//           child: DataTable(
//             columns: <DataColumn>[
//               DataColumn(label: Text('No.')),
//               DataColumn(label: Text('Item')),
//               DataColumn(label: Text('Quantity')),
//               DataColumn(label: Text('Price')),
//               DataColumn(label: Text('Total')),
//             ],
//             rows: billingItems.map((billingItem) {
//               final total = billingItem.quantity * billingItem.price;
//               return DataRow(cells: [
//                 DataCell(Text(billingItem.id.toString())),
//                 DataCell(Text(billingItem.itemName)),
//                 DataCell(Text(billingItem.quantity.toString())),
//                 DataCell(Text(billingItem.price.toString())),
//                 DataCell(Text(total.toString())),
//               ]);
//             }).toList(),
//           ),
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Text(
//           'Total: \$${calculateTotal().toStringAsFixed(2)}',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }
