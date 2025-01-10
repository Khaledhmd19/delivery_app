// import 'package:delivery_app/widgets/main_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_credit_card/flutter_credit_card.dart';

// class CreditCardInformationScreen extends StatefulWidget {
//   const CreditCardInformationScreen({super.key});

//   @override
//   State<CreditCardInformationScreen> createState() =>
//       _CreditCardInformationScreenState();
// }

// class _CreditCardInformationScreenState
//     extends State<CreditCardInformationScreen> {
//   String cardNumber = '';
//   String expiryDate = '';
//   String cardHolderName = '';
//   String cvvCode = '';
//   bool isCvvFocused = false;
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xffffffff),
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Get.back();
//           },
//           icon: Icon(
//             Icons.arrow_back,
//             color: Color(0xffCECECE),
//             size: 30,
//           ),
//         ),
//         backgroundColor: Color(0xffffffff),
//         centerTitle: true,
//         title: Text(
//           'Card Information',
//           style: GoogleFonts.poppins(
//             color: Color(0xff323232),
//             fontWeight: FontWeight.bold,
//             fontSize: 22,
//           ),
//         ),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             CreditCardWidget(
//               cardType: CardType.mastercard,
//               cardNumber: cardNumber,
//               expiryDate: expiryDate,
//               cardHolderName: cardHolderName,
//               cvvCode: cvvCode,
//               showBackView: isCvvFocused,
//               obscureCardNumber: true,
//               obscureCardCvv: true,
//               isHolderNameVisible: true,
//               cardBgColor: Color(0xff164267),
//               onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
//             ),
//             const SizedBox(height: 30),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 26),
//                 child: Column(
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Card Number',
//                           style: GoogleFonts.poppins(
//                             color: Color(0xffB2B2B2),
//                             fontSize: 16,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                         TextFormField(
//                           style: GoogleFonts.poppins(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w500,
//                             color: Color(0xff323232),
//                           ),
//                           decoration: InputDecoration(
//                             counterText: '',
//                             hintText: 'XXXX XXXX XXXX XXXX',
//                             border: UnderlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Color(0xffECECEC),
//                                 width: 1,
//                               ),
//                             ),
//                             focusedBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Color(0xffFF8D4D),
//                                 width: 1.5,
//                               ),
//                             ),
//                           ),
//                           cursorColor: Color(0xffFF8D4D),
//                           keyboardType: TextInputType.number,
//                           maxLength: 12,
//                           inputFormatters: [
//                             FilteringTextInputFormatter.digitsOnly
//                           ],
//                           onChanged: (value) {
//                             setState(() {
//                               cardNumber = value;
//                             });
//                           },
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 30),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Expiration Date',
//                                 style: GoogleFonts.poppins(
//                                   color: Color(0xffB2B2B2),
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                               TextFormField(
//                                 style: GoogleFonts.poppins(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w500,
//                                   color: Color(0xff323232),
//                                 ),
//                                 decoration: InputDecoration(
//                                   hintText: 'MM/YY',
//                                   border: UnderlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: Color(0xffECECEC),
//                                       width: 1,
//                                     ),
//                                   ),
//                                   focusedBorder: UnderlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: Color(0xffFF8D4D),
//                                       width: 1.5,
//                                     ),
//                                   ),
//                                 ),
//                                 cursorColor: Color(0xffFF8D4D),
//                                 onChanged: (value) {
//                                   setState(() {
//                                     expiryDate = value;
//                                   });
//                                 },
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(width: 24),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'CVV',
//                                 style: GoogleFonts.poppins(
//                                   color: Color(0xffB2B2B2),
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                               TextFormField(
//                                 style: GoogleFonts.poppins(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w500,
//                                   color: Color(0xff323232),
//                                 ),
//                                 decoration: InputDecoration(
//                                   counterText: '',
//                                   hintText: 'XXX',
//                                   border: UnderlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: Color(0xffECECEC),
//                                       width: 1,
//                                     ),
//                                   ),
//                                   focusedBorder: UnderlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: Color(0xffFF8D4D),
//                                       width: 1.5,
//                                     ),
//                                   ),
//                                 ),
//                                 cursorColor: Color(0xffFF8D4D),
//                                 keyboardType: TextInputType.number,
//                                 maxLength: 3,
//                                 inputFormatters: [
//                                   FilteringTextInputFormatter.digitsOnly
//                                 ],
//                                 onChanged: (value) {
//                                   setState(() {
//                                     cvvCode = value;
//                                   });
//                                 },
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 30),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Card Holder',
//                           style: GoogleFonts.poppins(
//                             color: Color(0xffB2B2B2),
//                             fontSize: 16,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                         TextFormField(
//                           style: GoogleFonts.poppins(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w500,
//                             color: Color(0xff323232),
//                           ),
//                           decoration: InputDecoration(
//                             hintText: 'Full Name',
//                             border: UnderlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Color(0xffECECEC),
//                                 width: 1,
//                               ),
//                             ),
//                             focusedBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Color(0xffFF8D4D),
//                                 width: 1.5,
//                               ),
//                             ),
//                           ),
//                           cursorColor: Color(0xffFF8D4D),
//                           onChanged: (value) {
//                             setState(() {
//                               cardHolderName = value;
//                             });
//                           },
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 50),
//                     SizedBox(
//                       child: MainButton(
//                         onPressed: () {},
//                         buttonText: 'Validate',
//                         buttonSize: Size(340, 60),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
