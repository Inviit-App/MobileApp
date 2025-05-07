import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:invit_app/widget/bottom_navigation.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  int selectedHeading = 2;
  int selectedBottomIndex = 0;
  final TextEditingController titleController = TextEditingController();

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
  void initState() {
    super.initState();
    titleController.addListener(() {
      setState(() {}); // 상태 변경 시 build 다시 호출
    });
  }

  bool get isButtonEnabled => titleController.text.trim().isNotEmpty;

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
              child: Image.asset(
                'assets/images/event1.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0x66FFFFFF)),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black.withOpacity(0.4),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: titleController,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: getTitleFontSize(),
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: const InputDecoration(
                              hintText: "이벤트 타이틀",
                              hintStyle: TextStyle(color: Colors.white38),
                              border: InputBorder.none,
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
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0x66FFFFFF)),
                      ),
                      child: Stack(
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
                              child:
                                  const Icon(Icons.edit, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    ConstrainedBox(
                      constraints:
                          const BoxConstraints(minHeight: 61, maxHeight: 300),
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "이벤트 소개를 작성해주세요.",
                          hintStyle: const TextStyle(color: Colors.white38),
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.4),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                const BorderSide(color: Color(0x66FFFFFF)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                const BorderSide(color: Color(0x66FFFFFF)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                const BorderSide(color: Color(0x66FFFFFF)),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                        ),
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                    // const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "이벤트 정보",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            // 목록추가 동작
                          },
                          style: TextButton.styleFrom(
                            backgroundColor:
                                const Color(0x0AFFFFFF), // #FFFFFF0A
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 0),
                          ),
                          label: const Text(
                            "목록추가",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          icon: const Icon(Icons.playlist_add,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _infoBox([
                      _infoRow(Icons.add, "호스트"),
                      _infoRow(Icons.calendar_today, "날짜"),
                      _infoRow(Icons.location_on, "위치"),
                      _infoRow(Icons.people, "최대인원"),
                    ]),
                    const SizedBox(height: 20),
                    _sectionTitle("RSVP 옵션", actionText: "수정하기"),
                    _infoBox([
                      _rsvpOption("Meeting", "6,000원", Icons.favorite),
                      const SizedBox(height: 10),
                      _rsvpOption("Normal", "5,000원", Icons.favorite_border),
                    ]),
                    const SizedBox(height: 20),
                    _sectionTitle("게스트 정보"),
                    _infoBox([
                      _guestInputRow(Icons.person, "이름 / 학교"),
                      _guestInputRow(Icons.calendar_today, "생년월일"),
                      _guestInputRow(Icons.phone, "연락처 (대표자)"),
                      _genderRow(),
                    ]),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 64,
                      child: ElevatedButton(
                          onPressed: isButtonEnabled ? () {} : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(
                              isButtonEnabled
                                  ? 0x23FFFFFF
                                  : 0x1AFFFFFF, // #FFFFFF14 / #FFFFFF0A
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            "이벤트 생성하기",
                            style: TextStyle(
                              color: Color(
                                isButtonEnabled
                                    ? 0xF5FFFFFF
                                    : 0x4DFFFFFF, // #FFFFFFF5 / #FFFFFF4D
                              ),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BottomNavigationBarFixed(selectedIndex: 0),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title, {String? actionText}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(color: Colors.white, fontSize: 18)),
        if (actionText != null)
          TextButton(
            onPressed: () {},
            child:
                Text(actionText, style: const TextStyle(color: Colors.white)),
          ),
      ],
    );
  }

  Widget _infoBox(List<Widget> children) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0x66FFFFFF)),
        borderRadius: BorderRadius.circular(12),
        color: Colors.black.withOpacity(0.4),
      ),
      child: Column(children: children),
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

  Widget _rsvpOption(String title, String price, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0x66FFFFFF)),
        borderRadius: BorderRadius.circular(10),
        color: Colors.black.withOpacity(0.3),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white70),
          const SizedBox(width: 16),
          Expanded(
            child: Text(title, style: const TextStyle(color: Colors.white)),
          ),
          Text(price, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }

  Widget _guestInputRow(IconData icon, String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.white54),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white38),
          filled: true,
          fillColor: Colors.black.withOpacity(0.3),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0x66FFFFFF)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0x66FFFFFF)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0x66FFFFFF)),
          ),
        ),
      ),
    );
  }

  Widget _genderRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          const Text("성별", style: TextStyle(color: Colors.white)),
          const SizedBox(width: 20),
          Expanded(
            child: Row(
              children: [
                _genderOption("남성"),
                const SizedBox(width: 10),
                _genderOption("여성"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _genderOption(String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0x66FFFFFF)),
          borderRadius: BorderRadius.circular(10),
          color: Colors.black.withOpacity(0.3),
        ),
        child: Center(
          child: Text(label, style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
