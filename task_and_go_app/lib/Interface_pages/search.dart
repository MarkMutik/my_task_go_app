import 'home_interface.dart';
import 'profile.dart';
import 'constraints.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _currentPage = 1;
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  void _startSearch() {
    setState(() {
      _isSearching = true;
    });
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
        _searchController.clear();
      }
    });
  }
//
  void _stopSearch() {
    setState(() {
      _isSearching = false;
      _searchController.clear();
    });
  }

  Widget buildBottomNavigatorBar() {
    return BottomNavigationBar(
      currentIndex: _currentPage,
      onTap: (page) {
        setState(() {
          _currentPage = page;
        });

        if (page == 0) {
          _currentPage = 0;
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const StartScreen()));
        }
        if (page == 2) {
          _currentPage = 2;
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ProfilePage()));
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(LineIcons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(LineIcons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(LineIcons.user),
          label: 'Profile',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight:70,
            actions: [
              // displaying the search feature with card background
              Card(
                color: Colors.white10,
                elevation: 4,
                child: IconButton(
                  onPressed: _startSearch,
                  icon: const Icon(LineIcons.search,
                  color: Colors.cyanAccent),
                ),
              ),
              if (_isSearching)// If user wants to search is true
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: TextField(
                      controller: _searchController,
                      style: const TextStyle(
                        color:Colors.cyanAccent,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff535353)),
                        ),
                        suffixIcon: _isSearching ? Card(
                          color: Colors.white12,
                          child: IconButton(
                            onPressed:_stopSearch,
                            icon: const Icon(LineIcons.times,
                            color:Colors.cyanAccent),
                          ),
                        ) : null, // Add a comma here
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyanAccent),
                        ),
                      ),
                    ),

                  ),
                ),
            ],
          ),
          // Add additional slivers as needed
        ],
      ),
      bottomNavigationBar: buildBottomNavigatorBar(),
    );
  }
}


