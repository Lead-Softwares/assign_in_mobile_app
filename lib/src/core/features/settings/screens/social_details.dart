// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/components/general_container.dart';
import 'package:assign_in/src/core/components/text_feild_with_title.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class SocialDetails extends StatefulWidget {
  const SocialDetails({super.key});
  static const routeName = '/social-details';

  @override
  State<SocialDetails> createState() => _SocialDetailsState();
}

class _SocialDetailsState extends State<SocialDetails> {
  final TextEditingController _githubController = TextEditingController();
  final TextEditingController _instaController = TextEditingController();
  final TextEditingController _utubeController = TextEditingController();
  final TextEditingController _linkediNController = TextEditingController();
  final TextEditingController _fbController = TextEditingController();
  final TextEditingController _twitterController = TextEditingController();
  late final List<SocialDetailModel> items = [
    SocialDetailModel(
      label: 'Leadsoftwares8789',
      title: 'Github',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMzEkaAN0BJ2o3ri2IsQRKXVk6ejQQqz0GUg&s',
      controller: _githubController,
      color: Colors.blue,
    ),
    SocialDetailModel(
      label: 'Leadsoftwares8789',
      title: 'Instagram',
      image:
          'https://cdn.pixabay.com/photo/2021/06/15/12/14/instagram-6338393_1280.png',
      controller: _instaController,
      color: Colors.green,
    ),
    SocialDetailModel(
      label: 'lLeadsoftwares8789',
      title: 'FaceBook',
      image:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ee/Logo_de_Facebook.png/1028px-Logo_de_Facebook.png',
      controller: _fbController,
      color: Colors.pink,
    ),
    SocialDetailModel(
      label: 'lLeadsoftwares8789',
      title: 'Youtube',
      image:
          'https://www.agendamedia.co.uk/wp-content/uploads/2019/02/youtube-icon.png',
      controller: _utubeController,
      color: Colors.blue,
    ),
    SocialDetailModel(
      label: 'lLeadsoftwares8789',
      title: 'Linked In',
      image: 'https://cdn-icons-png.flaticon.com/512/2496/2496097.png',
      controller: _linkediNController,
      color: Colors.red,
    ),
    SocialDetailModel(
      label: 'lLeadsoftwares8789',
      title: 'Twitter',
      image: 'https://cdn-icons-png.flaticon.com/256/2496/2496110.png',
      controller: _twitterController,
      color: Colors.green,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Social Media Links',
            style: context.textTheme.bodyLarge?.copyWith(fontSize: 14),
          ),
          const SizedBox(height: myPadding / 4),
          Text(
            'Connect your business with social media platforms',
            style: context.textTheme.bodyMedium?.copyWith(
              color: MyColors.textColor,
              fontSize: 11,
              fontWeight: FontWeight.w100,
            ),
          ),
          const SizedBox(height: myPadding / 2),

          ...List.generate(6, (index) => SocialTileCard(model: items[index])),
          const SizedBox(height: myPadding * 2),
        ],
      ),
    );
  }
}

class SocialTileCard extends StatelessWidget {
  const SocialTileCard({super.key, required this.model});
  final SocialDetailModel model;

  @override
  Widget build(BuildContext context) {
    return GeneralContainer(
      padding: const EdgeInsetsGeometry.all(myPadding / 1.3),
      border: Border.all(color: Colors.grey.shade200),

      color: model.color.withValues(alpha: 0.08),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              clipBehavior: Clip.hardEdge,
              margin: const EdgeInsetsGeometry.symmetric(
                vertical: myPadding / 2.5,
              ),
              padding: const EdgeInsetsGeometry.all(0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(myPadding / 2),
              ),
              child: Image.network(model.image, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: myPadding / 2),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.title, style: context.textTheme.bodyMedium),
                const SizedBox(height: myPadding / 2),
                TextFeildWithTitle(
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w100,
                    fontSize: 12,
                  ),
                  fillColor: Colors.white,

                  label: model.label,
                  controller: model.controller,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SocialDetailModel {
  final String title;
  final String image;
  final String label;

  final TextEditingController controller;
  final Color color;
  SocialDetailModel({
    required this.label,
    required this.title,
    required this.image,
    required this.controller,
    required this.color,
  });
}
