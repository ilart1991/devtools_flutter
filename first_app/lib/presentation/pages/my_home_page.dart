import 'package:first_app/presentation/widgets/favorite_people.dart';
import 'package:first_app/presentation/widgets/people.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List<BottomNavigationBarItem> barItems = [
  const BottomNavigationBarItem(icon: Icon(Icons.people), label: "All"),
  const BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites")
];

bool isNetwork = false;

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.abc))],
        title: Text(widget.title),
      ),
      body: currentIndex == 0 ? const People() : const FavoritePeople(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          items: barItems,
          onTap: (value) => setState(() {
                currentIndex = value;
              })),
    );
  }
}
