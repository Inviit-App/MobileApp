import 'package:flutter/material.dart';
import 'package:invit_app/view/list_screen.dart';

class BottomNavigationBarFixed extends StatelessWidget {
  final int selectedIndex;
  final void Function(int index)? onTap;

  const BottomNavigationBarFixed({
    super.key,
    this.selectedIndex = 0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final labels = ["편집", "리스트", "미리보기", "꾸미기", "초대하기"];
    final icons = [
      Icons.edit,
      Icons.person_outline,
      Icons.visibility_outlined,
      Icons.palette_outlined,
      Icons.mail_outline
    ];

    void handleNavigation(int index) {
      if (index == selectedIndex) return;

      Widget? target;
      switch (index) {
        case 1:
          target = const ListScreen();
          break;
        case 2:
          // target = const PreviewScreen();
          break;
        case 3:
          // target = const CustomizeScreen();
          break;
        case 4:
          // target = const InviteScreen();
          break;
      }

      if (target != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => target!),
        );
      }
    }

    return Container(
      color: const Color(0xFF1A1A1A),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(labels.length, (i) {
          final isActive = i == selectedIndex;

          return GestureDetector(
            onTap: () => handleNavigation(i),
            child: Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                color: isActive
                    ? const Color.fromARGB(127, 80, 80, 80)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icons[i],
                    color: isActive ? Colors.white : Colors.white54,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    labels[i],
                    style: TextStyle(
                      color: isActive ? Colors.white : Colors.white54,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
