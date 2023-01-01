import 'package:flutter/material.dart';

import '../../domain/person.dart';

class FavoritePeople extends StatefulWidget {
  const FavoritePeople({super.key});

  @override
  State<FavoritePeople> createState() => _FavoritePeopleState();
}

List<Person> favoritePeople = [];

class _FavoritePeopleState extends State<FavoritePeople> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favoritePeople.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
              backgroundImage: NetworkImage(favoritePeople[index].avatar)),
          title: Text(favoritePeople[index].name),
          subtitle: Text("Middle range: ${favoritePeople[index].rating}"),
        );
      },
    );
  }
}
