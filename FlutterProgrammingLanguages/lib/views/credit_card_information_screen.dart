// import 'package:delivery_app/controllers/credit_card_controller.dart';
// import 'package:delivery_app/widgets/main_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_credit_card/flutter_credit_card.dart';

// class CreditCardInformationScreen extends StatelessWidget {
//   const CreditCardInformationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final CreditCardController controller = Get.put(CreditCardController());

//     return Scaffold(
//       backgroundColor: const Color(0xffffffff),
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Get.back();
//           },
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Color(0xffCECECE),
//             size: 30,
//           ),
//         ),
//         backgroundColor: const Color(0xffffffff),
//         centerTitle: true,
//         title: Text(
//           'Card Information',
//           style: GoogleFonts.poppins(
//             color: const Color(0xff323232),
//             fontWeight: FontWeight.bold,
//             fontSize: 22,
//           ),
//         ),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Obx(() {
//               return CreditCardWidget(
//                 cardType: CardType.mastercard,
//                 cardNumber: controller.cardNumber.value,
//                 expiryDate: controller.expiryDate.value,
//                 cardHolderName: controller.cardHolderName.value,
//                 cvvCode: controller.cvvCode.value,
//                 showBackView: controller.isCvvFocused.value,
//                 obscureCardNumber: true,
//                 obscureCardCvv: true,
//                 isHolderNameVisible: true,
//                 cardBgColor: const Color(0xff164267),
//                 onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
//               );
//             }),
//             const SizedBox(height: 30),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 26),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Card Number',
//                             style: GoogleFonts.poppins(
//                               color: const Color(0xffB2B2B2),
//                               fontSize: 16,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                           TextFormField(
//                             style: GoogleFonts.poppins(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w500,
//                               color: const Color(0xff323232),
//                             ),
//                             decoration: InputDecoration(
//                               counterText: '',
//                               hintText: 'XXXX XXXX XXXX XXXX',
//                               border: const UnderlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Color(0xffECECEC),
//                                   width: 1,
//                                 ),
//                               ),
//                               focusedBorder: const UnderlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Color(0xffFF8D4D),
//                                   width: 1.5,
//                                 ),
//                               ),
//                             ),
//                             cursorColor: const Color(0xffFF8D4D),
//                             keyboardType: TextInputType.number,
//                             maxLength: 16,
//                             inputFormatters: [
//                               FilteringTextInputFormatter.digitsOnly
//                             ],
//                             onChanged: (value) {
//                               controller.updateCardNumber(value);
//                             },
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 30),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Expiration Date',
//                                   style: GoogleFonts.poppins(
//                                     color: const Color(0xffB2B2B2),
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 TextFormField(
//                                   style: GoogleFonts.poppins(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w500,
//                                     color: const Color(0xff323232),
//                                   ),
//                                   decoration: const InputDecoration(
//                                     hintText: 'MM/YY',
//                                     border: UnderlineInputBorder(
//                                       borderSide: BorderSide(
//                                         color: Color(0xffECECEC),
//                                         width: 1,
//                                       ),
//                                     ),
//                                     focusedBorder: UnderlineInputBorder(
//                                       borderSide: BorderSide(
//                                         color: Color(0xffFF8D4D),
//                                         width: 1.5,
//                                       ),
//                                     ),
//                                   ),
//                                   cursorColor: const Color(0xffFF8D4D),
//                                   onChanged: (value) {
//                                     controller.updateExpiryDate(value);
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(width: 24),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'CVV',
//                                   style: GoogleFonts.poppins(
//                                     color: const Color(0xffB2B2B2),
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 TextFormField(
//                                   style: GoogleFonts.poppins(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w500,
//                                     color: const Color(0xff323232),
//                                   ),
//                                   decoration: const InputDecoration(
//                                     counterText: '',
//                                     hintText: 'XXX',
//                                     border: UnderlineInputBorder(
//                                       borderSide: BorderSide(
//                                         color: Color(0xffECECEC),
//                                         width: 1,
//                                       ),
//                                     ),
//                                     focusedBorder: UnderlineInputBorder(
//                                       borderSide: BorderSide(
//                                         color: Color(0xffFF8D4D),
//                                         width: 1.5,
//                                       ),
//                                     ),
//                                   ),
//                                   cursorColor: const Color(0xffFF8D4D),
//                                   keyboardType: TextInputType.number,
//                                   maxLength: 3,
//                                   inputFormatters: [
//                                     FilteringTextInputFormatter.digitsOnly
//                                   ],
//                                   onChanged: (value) {
//                                     controller.updateCvvCode(value);
//                                   },
//                                   onEditingComplete: () {
//                                     controller.toggleCvvFocus(true);
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 30),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Card Holder',
//                             style: GoogleFonts.poppins(
//                               color: const Color(0xffB2B2B2),
//                               fontSize: 16,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                           TextFormField(
//                             style: GoogleFonts.poppins(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w500,
//                               color: const Color(0xff323232),
//                             ),
//                             decoration: const InputDecoration(
//                               hintText: 'Full Name',
//                               border: UnderlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Color(0xffECECEC),
//                                   width: 1,
//                                 ),
//                               ),
//                               focusedBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Color(0xffFF8D4D),
//                                   width: 1.5,
//                                 ),
//                               ),
//                             ),
//                             cursorColor: const Color(0xffFF8D4D),
//                             onChanged: (value) {
//                               controller.updateCardHolderName(value);
//                             },
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 50),
//                       MainButton(
//                         onPressed: () {},
//                         buttonText: 'Validate',
//                         buttonSize: const Size(340, 60),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
