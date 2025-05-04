import 'dart:ui'; // 블러 처리용

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  String selectedCategory = '다가오는 이벤트';

  final List<String> categories = [
    '다가오는 이벤트',
    '호스팅',
    '참가',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SvgPicture.asset('assets/images/logo.svg', width: 80),
            const Spacer(),
            const Icon(Icons.add_box_outlined, color: Colors.white),
            const SizedBox(width: 16),
            const Icon(Icons.notifications_none, color: Colors.white),
            const SizedBox(width: 16),
            const CircleAvatar(
              radius: 12,
              backgroundColor: Colors.transparent,
              child: Icon(Icons.person, color: Colors.white),
            ),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double leftOffset = (screenWidth - 339) / 2;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                // ✅ 드롭다운 버튼 위치 조정
                Padding(
                  padding: EdgeInsets.only(left: leftOffset),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      dropdownStyleData: DropdownStyleData(
                        width: 157,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFF1A1A1A),
                        ),
                        offset: const Offset(0, 5),
                      ),
                      buttonStyleData: ButtonStyleData(
                        height: 40,
                        width: 157,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFF1A1A1A),
                        ),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(Icons.expand_more),
                        iconSize: 20,
                        iconEnabledColor: Colors.white,
                      ),
                      items: categories.map((item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }).toList(),
                      value: selectedCategory,
                      onChanged: (value) {
                        setState(() {
                          selectedCategory = value!;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // ✅ 카드 중앙 정렬
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/add_event');
                    },
                    child: Container(
                      width: 339,
                      height: 503,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1A1A),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Stack(
                        children: [
                          // 좌측 상단 뱃지
                          Positioned(
                            top: 15,
                            left: 12,
                            child: Container(
                              width: 56,
                              height: 32,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(95, 0, 0, 0),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Text(
                                'D-0',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),

                          // 우측 상단 아이콘
                          Positioned(
                            top: 12,
                            right: 12,
                            child: SvgPicture.asset(
                              'assets/icons/hosting_icon.svg',
                              width: 40,
                              height: 40,
                            ),
                          ),

                          // 중앙 + 버튼
                          const Center(
                            child: Icon(Icons.add,
                                size: 48, color: Colors.white54),
                          ),

                          // 카드 하단 블러
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                bottom: Radius.circular(30),
                              ),
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                                child: Container(
                                  height: 100,
                                  color: Colors.black.withOpacity(0.3),
                                ),
                              ),
                            ),
                          ),

                          // 카드 하단 텍스트
                          const Positioned(
                            bottom: 50,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Text(
                                "새로운 이벤트 생성",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
