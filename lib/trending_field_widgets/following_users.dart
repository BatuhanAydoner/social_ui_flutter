import 'package:flutter/material.dart';
import 'package:social_ui_flutter/data/data.dart';
import 'package:social_ui_flutter/models/user.dart';

class FollowingUsers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: users.length,
          itemBuilder: (context, index) {
            User user = users[index];
            return Container(
                margin: EdgeInsets.all(10.0),
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue, width: 2.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6.0)
                    ]),
                child: CircleAvatar(
                  backgroundImage: AssetImage(user.profileImageUrl),
                ));
          }),
    );
  }
}
