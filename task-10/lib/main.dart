import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyBusinessCard(),
      debugShowCheckedModeBanner: false, //убираю красную ленту debug
    );
  }
}

class MyBusinessCard extends StatelessWidget {
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
            padding: EdgeInsets.all(16),
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
                      'assets/images/photo.jpg',
                      width: 220,
                      height: 280,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                const Text(
                  'SEZIM AKIROVA',
                  style: TextStyle(
                    fontFamily: 'assets/fonts/fonts3.ttf',
                    fontSize: 24,
                    fontWeight: FontWeight.bold, //жирный шрифт
                  ),
                ),
                SizedBox(height: 20),
                const Text(
                  'FLUTTER DEVELOPER',
                  style: TextStyle(
                    fontFamily: 'assets/fonts/fonts2',
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 1),
                const Text(
                  '_______________',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 1),
                _buildSection(
                    'assets/icons/avatar.svg', 'Student of Surf company'),
                _buildSection('assets/icons/hobby.svg',
                    'Travel, read books and take photos'),
                _buildSection(
                    'assets/icons/work.svg', 'Beginner mobile app developer'),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/phone.svg',
                        height: 18, width: 18),
                    SizedBox(width: 10),
                    const Text(
                      '+7 991-952-4471',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 16),
                    SvgPicture.asset('assets/icons/map.svg',
                        height: 18, width: 18),
                    SizedBox(width: 8),
                    const Text(
                      'Kyrgyzstan, Bishkek',
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
            child: Image.asset('assets/images/tropic1.png', //не выходят листья
                height: 150,
                width: 150),
          ),
          Positioned(
            top: -30,
            right: -20,
            child: Image.asset('assets/images/tropic2.png',
                height: 150, width: 150),
          ),
          Positioned(
            bottom: -60,
            left: -40,
            child: Image.asset('assets/images/tropic3.png',
                height: 150, width: 150),
          ),
          Positioned(
            bottom: -30,
            right: -20,
            child: Image.asset('assets/images/tropic4.png',
                height: 150, width: 150),
          ),
        ],
      ),
    );
  }
}

Widget _buildSection(String iconPath, String title, [String content = '']) {
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
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 10),
        if (content.isNotEmpty)
          Text(
            content,
            style: const TextStyle(fontSize: 16),
          ),
      ],
    ),
  );
}
