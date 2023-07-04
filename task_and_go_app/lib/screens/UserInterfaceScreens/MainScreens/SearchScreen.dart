import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const String routeName = 'search-page';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => SearchScreen(),
    );
  }
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: TextField(
          cursorColor: Colors.black,
          showCursor: true,
          autofocus: true,
          style: TextStyle(color: Colors.black),
          controller: _searchController,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _searchController.clear();
                      });
                    },
                    icon: Icon(LineIcons.timesCircle, color: Colors.black),
                  )
                : null
          ),
        ),
      ),
      body: Center(
        child: Text('Search Screen'),
      ),
    );
  }
}
