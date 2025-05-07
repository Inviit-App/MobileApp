import 'dart:ui';

import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  String sortOption = "이름순";
  final List<String> sortOptions = ["이름순", "팀순", "참석확인순"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔹 블러 처리된 배경 이미지
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
              child: Image.asset(
                'assets/images/event1.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 🔹 실제 콘텐츠
          Positioned.fill(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🔹 AppBar 커스터마이징
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios,
                              color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const Text(
                          '리스트',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),

                  // 🔹 통계 영역
                  Center(
                    child: Wrap(
                      spacing: 40,
                      runSpacing: 8,
                      alignment: WrapAlignment.center,
                      children: const [
                        _StatItem(Icons.groups, "38명"),
                        _StatItem(Icons.person_outline, "14팀"),
                        _StatItem(Icons.favorite_border, "6팀"),
                        _StatItem(Icons.chat_bubble_outline, "8팀"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // 🔹 검색창 + 정렬
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: [
                        // 검색창
                        Expanded(
                          child: Container(
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(width: 10),
                                const Expanded(
                                  child: TextField(
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      hintText: "게스트 이름, 연락처, 번호",
                                      hintStyle:
                                          TextStyle(color: Colors.white38),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                const Icon(Icons.search, color: Colors.white54),
                                const SizedBox(width: 12),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        // 정렬 드롭다운
                        DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor: Colors.black87,
                            iconEnabledColor: Colors.white,
                            value: sortOption,
                            items: sortOptions.map((option) {
                              return DropdownMenuItem<String>(
                                value: option,
                                child: Text(option,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 16)),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                sortOption = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  // 🔹 리스트
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("00${index + 1}",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                  const SizedBox(width: 8),
                                  const Text("최지욱 (2)",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                              const SizedBox(height: 8),
                              const Row(
                                children: [
                                  Icon(Icons.phone,
                                      size: 16, color: Colors.white60),
                                  SizedBox(width: 6),
                                  Text("010-4956-4598",
                                      style: TextStyle(color: Colors.white60)),
                                ],
                              ),
                              const SizedBox(height: 6),
                              const Row(
                                children: [
                                  Icon(Icons.chat,
                                      size: 16, color: Colors.white60),
                                  SizedBox(width: 6),
                                  Text("Normal",
                                      style: TextStyle(color: Colors.white60)),
                                  Spacer(),
                                  Text("확인",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14)),
                                  SizedBox(width: 6),
                                  Icon(Icons.check,
                                      color: Colors.white, size: 16),
                                  SizedBox(width: 8),
                                  Icon(Icons.sticky_note_2_outlined,
                                      color: Colors.white30),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _StatItem(this.icon, this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white, size: 20),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
      ],
    );
  }
}
