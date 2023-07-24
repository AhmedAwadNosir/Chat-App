 import 'package:flutter/material.dart';

class CreateMessageContainer extends StatelessWidget {
  const CreateMessageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: MediaQuery.of(context).size.height * 0.13,
      color: const Color(0xff1F1F1F),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.attach_file,
                size: 35,
                color: Color(0xff5B0DA9),
              ),
            ),
            Container(
              width: 250,
              decoration: BoxDecoration(
                color: const Color(0xff252525),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Tape your message",
                    hintStyle: const TextStyle(
                      color: Color(0xff444444),
                    ),
                    enabledBorder: border(
                      color: const Color(0xff252525),
                    ),
                    focusedBorder: border(color: const Color(0xff5B0DA9))),
                onSubmitted: (value) async {
                },
              ),
            ),
            Transform.rotate(
              angle: -45 / 70, // Rotate the icon by 45 degrees
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.send,
                  size: 40,
                  color: Color(0xff5B0DA9),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

OutlineInputBorder border({required Color color}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: color,
    ),
  );
}
