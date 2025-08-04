import 'package:flutter/material.dart';
import 'package:movies_app/features/home/views/search_view.dart';
import 'package:movies_app/features/home/views/watch_list_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Widget> _views = [const SearchView(), const WatchListView()];

  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex == 1
          ? AppBar(
              title: Text(
                'Watch List',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              elevation: 0,
              backgroundColor: Colors.white,
            )
          : null,
      body: _views[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        selectedItemColor: Color(0xffFF8C00),
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        selectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Watch list',
          ),
        ],
      ),
    );
  }
}
