import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePageWrapper extends StatefulWidget {
  const HomePageWrapper({super.key, required this.child});

  final StatefulNavigationShell child;

  @override
  State<HomePageWrapper> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageWrapper> {
  // bool bannerShowed = false;

  @override
  Widget build(BuildContext context) {
    // if (!bannerShowed) {
    //   ScaffoldMessenger.of(context).showMaterialBanner(
    //     MaterialBanner(content: const Text('asd'), actions: []),
    //   );
    //   bannerShowed = true;
    // }

    return Scaffold(
      // AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.red,
      //   toolbarHeight: 40,
      //   title: const Text(
      //     'Complete your others verification to start your adventure.',
      //     style: TextStyle(color: Colors.white, fontSize: 13),
      //   ),
      // ),

      body: widget.child,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(height: 0),
          BottomNavigationBar(
            elevation: 0,
            // showUnselectedLabels: false,
            selectedFontSize: 9.5,
            unselectedFontSize: 9.5,
            iconSize: 19,
            selectedItemColor: Colors.teal,
            type: BottomNavigationBarType.fixed,
            currentIndex: widget.child.currentIndex,
            onTap: (index) {
              widget.child.goBranch(
                index,
                initialLocation: index == widget.child.currentIndex,
              );
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.quiz_outlined),
                activeIcon: Icon(Icons.quiz),
                label: 'Quests',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.summarize_outlined),
                activeIcon: Icon(Icons.summarize),
                label: 'Activities',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.forum_outlined),
                activeIcon: Icon(Icons.forum),
                label: 'Community',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_outlined),
                activeIcon: Icon(Icons.chat),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz),
                label: 'More',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
