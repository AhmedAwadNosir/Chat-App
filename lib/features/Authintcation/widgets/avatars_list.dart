import 'package:chat_app/features/Authintcation/models/user_model.dart';
import 'package:flutter/material.dart';
import 'custom_avatar.dart';

class AvatarListWidget extends StatefulWidget {
  final List<String> avatarImages = const [
    'assets/images/avatar_1.png',
    'assets/images/avatar_2.png',
    'assets/images/avatar_3.png',
    "assets/images/avatar_4.png"
  ];

  final List<Color> avatarColors = const [
    Color(0xffE8DA5A),
    Color(0xff009BE4),
    Color(0xff00DDC5),
    Color(0xffEE3A3D),
  ];

  const AvatarListWidget({Key? key, required this.userModel}) : super(key: key);
  final UserModel userModel;
  @override
  State createState() => _AvatarListWidgetState();
}

class _AvatarListWidgetState extends State<AvatarListWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.avatarColors
            .asMap()
            .entries
            .map(
              (entry) => GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = entry.key;
                  });
                  widget.userModel.avatar = widget.avatarImages[_selectedIndex];
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: CustomAvatar(
                    image: widget.avatarImages[entry.key],
                    backgroundColor: entry.value,
                    isSelected: _selectedIndex == entry.key,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
