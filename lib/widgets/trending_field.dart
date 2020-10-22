import 'package:flutter/material.dart';
import 'package:social_ui_flutter/data/data.dart';
import 'package:social_ui_flutter/trending_field_widgets/following_users.dart';
import 'package:social_ui_flutter/trending_field_widgets/posts_carousel.dart';

class TrendingField extends StatefulWidget {
  @override
  _TrendingFieldState createState() => _TrendingFieldState();
}

class _TrendingFieldState extends State<TrendingField>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    pageController = PageController(viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Following",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    letterSpacing: 2.0),
              ),
            ),
            FollowingUsers(),
            PostsCarousel(
              pageController: pageController,
              title: "Posts",
              posts: posts,
            ),
          ],
        ),
      ],
    );
  }
}
