import 'package:chat_app/features/chat/wedgits/user_custom_avatar.dart';
import 'package:flutter/material.dart';

class UserInformatinContainer extends StatelessWidget {
  const UserInformatinContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.13,
      decoration: const BoxDecoration(
          color: Color(0xff1F1F1F),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: Row(
          children: [
            Row(
              children: [
                const UserCustomAvatar(
                  avatar: 'assets/images/avatar_3.png',
                  hieght: 75,
                  width: 75,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Harper",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "Active",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.green,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.call,
              size: 40,
              color: Color(0xff4D4D4F),
            ),
            const SizedBox(width: 20),
            const Icon(
              Icons.photo_camera,
              size: 40,
              color: Color(0xff4D4D4F),
            )
          ],
        ),
      ),
    );
  }
}
