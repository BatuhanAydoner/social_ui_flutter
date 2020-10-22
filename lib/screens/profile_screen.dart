import 'package:flutter/material.dart';
import 'package:social_ui_flutter/data/data.dart';
import 'package:social_ui_flutter/models/user.dart';
import 'package:social_ui_flutter/trending_field_widgets/posts_carousel.dart';
import 'package:social_ui_flutter/widgets/profile_clipper.dart';

import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  final User user;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  ProfileScreen({this.user});

  PageController _pageController = PageController(viewportFraction: 0.7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    width: double.infinity,
                    height: 200.0,
                    image: AssetImage(user.backgroundImageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    top: MediaQuery.of(context).viewPadding.top,
                    child: IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Colors.blue,
                          size: 30.0,
                        ),
                        onPressed: () {
                          _scaffoldKey.currentState.openDrawer();
                        })),
                Positioned(
                  bottom: 0.0,
                  child: Container(
                    child: CircleAvatar(
                      radius: 40.0,
                      backgroundImage: AssetImage(user.profileImageUrl),
                    ),
                  ),
                )
              ],
            ),
            Text(user.name),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("Following"),
                    Text("${user.following}")
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("Followers"),
                    Text("${user.followers}")
                  ],
                ),
              ],
            ),
            PostsCarousel(
              pageController: _pageController,
              title: "Posts",
              posts: user.posts,
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(currentUser.backgroundImageUrl),
                      fit: BoxFit.cover)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 2.0, color: Colors.blue)),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(currentUser.profileImageUrl),
                      radius: 60.0,
                    ),
                  ),
                  Text(
                    currentUser.name,
                    style: TextStyle(fontSize: 24.0, color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.dashboard),
                    title: Text("Home"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.chat),
                    title: Text("Chat"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.map),
                    title: Text("Map"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text("Account"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen(
                                    user: currentUser,
                                  )));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Settings"),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.directions_run),
              title: Text("Logout"),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
