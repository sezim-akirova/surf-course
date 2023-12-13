import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_visiting_card/constants/my_fonts.dart';
import 'package:my_visiting_card/constants/my_icons.dart';
import 'package:my_visiting_card/constants/my_images.dart';
import 'package:my_visiting_card/texts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyBusinessCard(),
      debugShowCheckedModeBanner: false, //убираю красную ленту debug
    );
  }
}

class MyBusinessCard extends StatelessWidget {
  const MyBusinessCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('business card'),
        backgroundColor: Colors.brown[800],
      ),
      backgroundColor: Colors.orange[100],
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black, // Цвет рамки
                      width: 4.0, // Ширина рамки
                    ),
                    borderRadius:
                        BorderRadius.circular(15), // Радиус скругления углов
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        15), // Скругление углов изображения
                    child: Image.asset(
                      MyImages.photo,
                      width: 220,
                      height: 280,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  MyTexts.name,
                  style: TextStyle(
                    fontFamily: MyFonts.fonts3,
                    fontSize: 24,
                    fontWeight: FontWeight.bold, //жирный шрифт
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  MyTexts.role,
                  style: TextStyle(
                    fontFamily: MyFonts.fonts2,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 1),
                const Text(
                  '_______________',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 1),
                const SectionWidget(
                    iconPath: MyIcons.avatar, title: MyTexts.aboutMe),
                const SectionWidget(
                    iconPath: MyIcons.hobby, title: MyTexts.hobby),
                const SectionWidget(
                    iconPath: MyIcons.work, title: MyTexts.work),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(MyIcons.phone, height: 18, width: 18),
                    const SizedBox(width: 10),
                    const Text(
                      MyTexts.number,
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(width: 16),
                    SvgPicture.asset(MyIcons.map, height: 18, width: 18),
                    const SizedBox(width: 8),
                    const Text(
                      MyTexts.place,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: -35,
            left: -20,
            child: Image.asset(MyImages.tropic1, height: 150, width: 150),
          ),
          Positioned(
            top: -30,
            right: -20,
            child: Image.asset(MyImages.tropic2, height: 150, width: 150),
          ),
          Positioned(
            bottom: -60,
            left: -40,
            child: Image.asset(MyImages.tropic3, height: 150, width: 150),
          ),
          Positioned(
            bottom: -30,
            right: -20,
            child: Image.asset(MyImages.tropic4, height: 150, width: 150),
          ),
        ],
      ),
    );
  }
}

class SectionWidget extends StatelessWidget {
  final String iconPath;
  final String title;
  final String content;

  const SectionWidget(
      {super.key,
      required this.iconPath,
      required this.title,
      this.content = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                iconPath,
                height: 20,
                width: 20,
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (content.isNotEmpty)
            Text(
              content,
              style: const TextStyle(fontSize: 16),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
        ],
      ),
    );
  }
}
