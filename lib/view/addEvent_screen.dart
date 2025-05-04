import 'dart:ui';

import 'package:flutter/material.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  int selectedHeading = 2;

  double getTitleFontSize() {
    switch (selectedHeading) {
      case 1:
        return 40;
      case 2:
        return 36;
      case 3:
        return 32;
      case 4:
        return 28;
      case 5:
        return 24;
      default:
        return 36;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔹 블러 배경 이미지
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
              child: Image.asset(
                'assets/images/event1.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 🔹 콘텐츠
          Positioned.fill(
            child: SafeArea(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🔹 커스텀 AppBar
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios,
                              color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const Text(
                          "이벤트 생성",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // 🔤 이벤트 타이틀
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white30),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black.withOpacity(0.4),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "이벤트 타이틀",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: getTitleFontSize(),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: List.generate(5, (index) {
                              int heading = index + 1;
                              bool isSelected = selectedHeading == heading;

                              return Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedHeading = heading;
                                    });
                                  },
                                  child: isSelected
                                      ? Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 6),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.white, width: 2),
                                          ),
                                          child: Text(
                                            "H$heading",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      : Text(
                                          "H$heading",
                                          style: const TextStyle(
                                            color: Colors.white54,
                                            fontSize: 16,
                                          ),
                                        ),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // 🖼️ 대표 이미지
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset("assets/images/event1.png"),
                        ),
                        Positioned(
                          bottom: 12,
                          right: 12,
                          child: CircleAvatar(
                            backgroundColor: Colors.black.withOpacity(0.5),
                            child: const Icon(Icons.edit, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // 📝 소개글
                    TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "이벤트 소개를 작성해주세요.",
                        hintStyle: const TextStyle(color: Colors.white38),
                        filled: true,
                        fillColor: Colors.black.withOpacity(0.4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 24),

                    // 📋 이벤트 정보
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "이벤트 정보",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.playlist_add,
                              color: Colors.white),
                          label: const Text(
                            "목록추가",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white24),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black.withOpacity(0.4),
                      ),
                      child: Column(
                        children: [
                          _infoRow(Icons.add, "호스트"),
                          _infoRow(Icons.calendar_today, "날짜"),
                          _infoRow(Icons.location_on, "위치"),
                          _infoRow(Icons.people, "최대인원"),
                        ],
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
  }

  Widget _infoRow(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.white70),
          const SizedBox(width: 16),
          Text(label, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}
