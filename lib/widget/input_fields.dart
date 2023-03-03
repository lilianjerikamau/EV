// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class InputField extends StatelessWidget {
//   const InputField({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return    Container(
//       padding: const EdgeInsets.all(10),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Text(
//                 "Country of registration ",
//                 overflow: TextOverflow.ellipsis,
//                 style: Theme.of(context)
//                     .textTheme
//                     .subtitle2!
//                     .copyWith(color: Color(0xFF75A843)),
//               ),
//               Text(
//                 "*",
//                 style: Theme.of(context)
//                     .textTheme
//                     .subtitle2!
//                     .copyWith(color: Colors.red),
//               )
//             ],
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           TextField(
//             // controller: nameController,
//             decoration: const InputDecoration(
//               // hintText: 'User Name',
//                 border: OutlineInputBorder(),
//                 floatingLabelBehavior: FloatingLabelBehavior.never),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
