import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/components/text_feild_with_title.dart';
import 'package:flutter/material.dart';


class BusinessDetails extends StatefulWidget {
  const BusinessDetails({super.key});
  static const routeName = '/social-details';

  @override
  State<BusinessDetails> createState() => _BusinessDetailsState();
}

class _BusinessDetailsState extends State<BusinessDetails> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController employesController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController contactInfoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFeildWithTitle(
          label: 'Beta Co',
          controller: nameController,
          title: 'Business Name',
        ),
        const SizedBox(height: myPadding),
        TextFeildWithTitle(
          label: 'leadsoftware@gmail.com',
          controller: emailController,
          title: 'Email',
        ),
        const SizedBox(height: myPadding),
        TextFeildWithTitle(
          label: '+8765432765',
          controller: nameController,
          title: 'Contact Info',
        ),
        const SizedBox(height: myPadding),
        TextFeildWithTitle(
          label: '2 - 10',
          controller: nameController,
          title: 'No Of Employee',
        ),
        const SizedBox(height: myPadding),
        TextFeildWithTitle(
          maxlines: 3,
          height: 120,
          label: 'Type here... ',
          controller: nameController,
          title: 'Business Address',
        ),
        const SizedBox(height: myPadding),
      ],
    );
  }
}
