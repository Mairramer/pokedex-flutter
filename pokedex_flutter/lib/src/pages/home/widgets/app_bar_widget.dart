import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18, right: 5),
                  child: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Pokedex",
                  style: TextStyle(
                      fontFamily: 'Google',
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
