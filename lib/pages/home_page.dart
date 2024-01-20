import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'event_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          SvgPicture.asset(
            "assets/images/ayaya.svg",
          ),
          const Text("Bienvenue chez moi ^^",
            style: TextStyle(
                fontSize: 40,
                fontFamily: 'Roboto'
            ),
          ),
          const Text("Yoyoyoyoyoyo",
            style: TextStyle(
                fontSize: 20
            ),
            textAlign: TextAlign.center,
          ),
          const Padding(padding: EdgeInsets.only(top:60)),
          ElevatedButton.icon(
            style: const ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.all(30)),
                backgroundColor: MaterialStatePropertyAll(Colors.green)
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const EventPage()
                  )
              );
            },
            label: const Text("Page suivante",
              style: TextStyle(
                  fontSize: 20
              ),
            ),
            icon: const Icon(Icons.arrow_forward_outlined),
          ),
        ],
      ),
    );
  }
}