import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {

  final events = [
    {
      "characters": "Dio",
      "comment": "Le méchant pas cool",
      "avatar": "jojo1",
    },
    {
      "characters": "Caesar",
      "comment": "Le jojobro",
      "avatar": "jojo2",
    },
    {
      "characters": "Joseph",
      "comment": "Le Jojo",
      "avatar": "jojo3",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List"),
      ),
      body: Center(
          child: ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index){
              final event = events[index];
              final avatar = event['avatar'];
              final characters = event['characters'];
              final comment = event['comment'];

              return Card(
                child: ListTile(
                  leading: Image.asset("assets/images/$avatar.jpg"),
                  title: Text('$characters'),
                  subtitle: Text('$comment'),
                  trailing: const Icon(Icons.more_vert),
                ),
              );
            }
          )
      ),
    );
  }
}
