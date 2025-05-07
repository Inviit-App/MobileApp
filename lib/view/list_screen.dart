import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  String selectedSort = '이름순';
  final List<String> sortOptions = ['이름순', '최신순', '팀순'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('리스트', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 👥 통계 표시
          Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Wrap(
                spacing: 16, // 아이템 간 간격
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                  Icon(Icons.groups, color: Colors.white),
                  Text("38명",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  Icon(Icons.person_outline, color: Colors.white),
                  Text("14팀",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  Icon(Icons.favorite_border, color: Colors.white),
                  Text("6팀",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  Icon(Icons.chat_bubble_outline, color: Colors.white),
                  Text("8팀",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ],
              ),
            ),
          ),

          // 🔍 검색창 + 정렬 드롭다운
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                              hintStyle: TextStyle(color: Colors.white38),
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
                const SizedBox(width: 12),

                // 정렬 드롭다운
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black.withOpacity(0.2),
                    // border: Border.all(color: const Color(0x66FFFFFF)),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedSort,
                      dropdownColor: const Color(0xFF1A1A1A),
                      style: const TextStyle(color: Colors.white),
                      icon: const Icon(Icons.arrow_drop_down,
                          color: Colors.white),
                      items: sortOptions.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            selectedSort = value;
                          });
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 👤 리스트 영역
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
                    // border: Border.all(color: const Color(0x66FFFFFF)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 이름
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

                      // 전화번호
                      const Row(
                        children: [
                          Icon(Icons.phone, size: 16, color: Colors.white60),
                          SizedBox(width: 6),
                          Text("010-4956-4598",
                              style: TextStyle(color: Colors.white60)),
                        ],
                      ),
                      const SizedBox(height: 6),

                      // RSVP 옵션
                      const Row(
                        children: [
                          Icon(Icons.chat, size: 16, color: Colors.white60),
                          SizedBox(width: 6),
                          Text("Normal",
                              style: TextStyle(color: Colors.white60)),
                          Spacer(),
                          Text("확인",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                          SizedBox(width: 6),
                          Icon(Icons.check, color: Colors.white, size: 16),
                          SizedBox(width: 8),
                          Icon(Icons.sticky_note_2_outlined,
                              color: Colors.white30),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
