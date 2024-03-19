// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';

// // ignore: must_be_immutable
// class ChooseCity extends StatefulWidget {
//   String? dropdownValue;
//   ChooseCity({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<ChooseCity> createState() => _ChooseCityState();
// }

// class _ChooseCityState extends State<ChooseCity> {
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       hint: const Text('Choose Country'),
//       value: widget.dropdownValue,
//       icon: const Icon(Icons.arrow_drop_down_rounded),
//       elevation: 16,
//       alignment: Alignment.center,
//       isExpanded: true,
//       style: const TextStyle(color: Colors.deepPurple),
//       underline: Container(
//         height: 5,
//         color: Colors.deepPurpleAccent,
//       ),
//       onChanged: (String? value) {
//         // This is called when the user selects an item.
//         setState(() {
//           widget.dropdownValue = value;
//         });
//       },
//       items: widget.country.map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           alignment: Alignment.center,
//           value: value,
//           child: Text(
//             value,
//             style: const TextStyle(
//               color: Colors.red,
//               fontSize: 20,
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }
