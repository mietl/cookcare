import 'package:flutter/material.dart';

import 'index_items.dart';

class IndexScreen extends StatefulWidget {
  static const String routeName = '/';

  const IndexScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _IndexScreenState();
  }
}

class _IndexScreenState extends State {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        items: items,
        onTap: (i) {
          setState(() {
            _index = i;
          });
        },
      ),
    );
  }
}
