import 'package:flutter/material.dart';

import '../../domain/person.dart';
import 'favorite_people.dart';

class People extends StatefulWidget {
  const People({super.key});

  @override
  State<People> createState() => _PeopleState();
}

List<Person> people = [
  Person("Artem ", "http://unspecific.ru/flutter/images/10_0.jpg", 0, false),
  Person("Marina", "http://unspecific.ru/flutter/images/11_0.jpg", 0.1, false),
  Person("Sasha ", "http://unspecific.ru/flutter/images/12_0.jpg", 0.2, false),
  Person("Pasha ", "http://unspecific.ru/flutter/images/13_0.jpg", 0.3, false),
  Person("Tanya ", "http://unspecific.ru/flutter/images/14_0.jpg", 0.4, false),
  Person("Grisha ", "http://unspecific.ru/flutter/images/15_0.jpg", 0.5, false),
  Person("Sveta ", "http://unspecific.ru/flutter/images/16_0.jpg", 0.6, false),
  Person("Misha ", "http://unspecific.ru/flutter/images/17_0.jpg", 0.7, false),
  Person("Nestor ", "http://unspecific.ru/flutter/images/18_0.jpg", 0.8, false)
];

class _PeopleState extends State<People> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: people.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading:
              CircleAvatar(backgroundImage: NetworkImage(people[index].avatar)),
          title: Text(people[index].name),
          subtitle: Text("Middle range: ${people[index].rating}"),
          trailing: MaterialButton(
              onPressed: () {
                showBottomSheet(
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("Are you sure?"),
                          Row(children: [
                            MaterialButton(
                              onPressed: () {
                                if (people[index].favorite == false) {
                                  people[index].favorite = true;
                                  favoritePeople.add(people[index]);
                                } else {
                                  for (int i = 0;
                                      i < favoritePeople.length;
                                      i++) {
                                    if (people[index] == favoritePeople[i]) {
                                      favoritePeople.removeAt(i);
                                      people[index].favorite = false;
                                    }
                                  }

                                  // for simulate memory leack
                                  // for (int i = 0; i < 30000; i++) {
                                  //   print(i);
                                  // }
                                }
                                setState(() {});
                                Navigator.pop(context);
                              },
                              child: const Text("YEAH"),
                            ),
                            const Spacer(),
                            MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("NO"),
                            )
                          ]),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Text(
                  !people[index].favorite ? "Add to Fav" : "Remove from fav")),
        );
      },
    );
  }
}
