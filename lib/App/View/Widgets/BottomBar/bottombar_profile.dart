import 'package:flutter/material.dart';

import '../../../util/Route/go.dart';
import '../buttons.dart';

Card buttonbarProfile(context, {required post}) {
  return Card(
    child: SizedBox(
      width: double.infinity,
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
            child: Row(children: [
          IconButton(
            onPressed: () {},
            icon: Column(
              children: [
                Image.asset(
                  "assets/images/seller.png",
                  fit: BoxFit.cover,
                  height: 25,
                ),
                const Text('the seller',
                    style: TextStyle(color: Colors.grey, fontSize: 8)),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Column(
              children: [
                Image.asset(
                  "assets/images/messenger.png",
                  fit: BoxFit.cover,
                  height: 25,
                ),
                const Text('Message',
                    style: TextStyle(color: Colors.grey, fontSize: 8)),
              ],
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
              child: SizedBox(
            width: double.infinity,
            child: Buttons.buttonAll(context,
                title: "Add to card", color: Colors.brown, functinn: () {}),
          ))
        ])),
      ),
    ),
  );
}
