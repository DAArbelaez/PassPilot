import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passpilot/constants/text_constants.dart';
import 'package:passpilot/features/check/view/entry_view.dart';
import 'package:passpilot/features/check/view/exit_view.dart';
import 'package:passpilot/features/check/view/logs_list_view.dart';
import 'package:passpilot/theme/pallette.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      title: const Text(
        'PassPilot',
        style: TextConstants.kTitleStyleText,
      ),
      centerTitle: true,
    );
  }

  static CupertinoTabBar bottomBar(
    Function(int) onPageChange,
    int currentIndex,
  ) {
    return CupertinoTabBar(
      currentIndex: currentIndex,
      onTap: onPageChange,
      backgroundColor: Pallete.backgroundColor,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.login),
        ),
        BottomNavigationBarItem(

          icon: Icon(Icons.checklist_outlined),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.logout),
        ),
      ],
    );
  }

  static const List<Widget> bottomTabBarPages = [
    EntryView(),
    LogsList(),
    ExitView(),
  ];
}
