import 'dart:ui'; // 블러 처리용

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController controller = PageController(viewportFraction: 0.7);
  int currentPage = 0;

  final List<Map<String, String>> eventList = [
    {
      'title': '국힙원탑과 함께',
      'date': '4월 19일 (토) 오후 18:00',
      'image': 'assets/images/event1.png',
    },
    {
      'title': '댄스파티 나잇',
      'date': '5월 1일 (수) 오후 19:30',
      'image': 'assets/images/event2.png',
    },
    {
      'title': '재즈와 와인',
      'date': '5월 7일 (화) 오후 20:00',
      'image': 'assets/images/event3.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final backgroundImage = eventList[currentPage]['image']!;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Image.asset(
              backgroundImage,
              key: ValueKey(backgroundImage), // 꼭 필요!
              fit: BoxFit.cover,
            ),
          ),
          // ✅ 배경 이미지
          Image.asset(
            backgroundImage,
            fit: BoxFit.cover,
          ),
          // ✅ 블러 처리
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          // ✅ UI 오버레이
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 50),
                SvgPicture.asset('assets/images/logo.svg',
                    width: 88, height: 28),
                const SizedBox(height: 30),
                SizedBox(
                  height: 380,
                  child: PageView.builder(
                    controller: controller,
                    itemCount: eventList.length,
                    onPageChanged: (index) {
                      setState(() => currentPage = index);
                    },
                    itemBuilder: (context, index) {
                      final event = eventList[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: EventCard(
                          title: event['title']!,
                          date: event['date']!,
                          imagePath: event['image']!,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 36),
                Text(
                  '특별한 순간,\n단 하나뿐인 초대장',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 36),
                SizedBox(
                  width: 140,
                  height: 45,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/event'); // ✅ 여기가 핵심
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.white, width: 1.5),
                      shape: StadiumBorder(),
                      padding: EdgeInsets.zero,
                      foregroundColor: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/logo_icon.svg',
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "시작하기",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ✅ 수정된 EventCard - Stateless로 변경 + 정상 렌더링
class EventCard extends StatelessWidget {
  final String title;
  final String date;
  final String imagePath;

  const EventCard({
    Key? key,
    required this.title,
    required this.date,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 256,
      height: 380,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              imagePath,
              width: 256,
              height: 380,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 15,
              left: 12,
              child: Container(
                width: 46,
                height: 24,
                alignment: Alignment.center, // ✅ 이 줄 추가
                decoration: BoxDecoration(
                  color: const Color.fromARGB(95, 0, 0, 0),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  'D-17',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            // 오른쪽 상단 hosting_icon.svg 아이콘
            Positioned(
              top: 12,
              right: 12,
              child: SvgPicture.asset(
                'assets/icons/hosting_icon.svg',
                width: 30,
                height: 30,
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    height: 75,
                    color: Colors.black.withOpacity(0.2), // 약간 어둡게
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    date,
                    style: TextStyle(color: Colors.white70, fontSize: 11),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
