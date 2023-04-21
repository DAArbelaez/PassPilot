import 'package:flutter/material.dart';
import 'package:passpilot/constants/ui_constants.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  AppBar appBar = UIConstants.appBar();
  int _page = 0;

  void onPageChange(int index) {
    setState(() {
      _page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: IndexedStack(
            index: _page,
            children: UIConstants.bottomTabBarPages,
          ),
        ),
      ),
      bottomNavigationBar: UIConstants.bottomBar(onPageChange, _page),
    );
  }
}
