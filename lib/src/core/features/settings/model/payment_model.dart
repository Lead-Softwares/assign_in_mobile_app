import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:flutter/material.dart';

class PaymentModel {
  final String title;
  final String description;
  final String? image;
  final bool isConnected;
  final Color? imagebgColor;
  final Color bgColor;
  PaymentModel({
    required this.title,
    required this.description,
    this.image,
    this.imagebgColor,
    required this.bgColor,
    required this.isConnected,
  });
  static List<PaymentModel> paymentData = [
    PaymentModel(
      title: 'Stripe',
      description: 'Accept online payments worldwide',
      image: 'assets/images/stripe.png',
      isConnected: true,
      bgColor: MyColors.mainCOlor.withValues(alpha: 0.1),
      imagebgColor: MyColors.mainCOlor,
    ),
    PaymentModel(
      title: 'Paypal',
      description: 'Global payment platform',
      image: 'assets/images/paypal.png',
      isConnected: false,
      bgColor: Colors.blue.withValues(alpha: 0.1),

      imagebgColor: MyColors.mainCOlor,
    ),
    PaymentModel(
      title: 'Square',
      description: 'Global payment platform',
      isConnected: false,
      bgColor: Colors.green.withValues(alpha: 0.1),

      imagebgColor: Colors.black,
    ),
  ];
}
