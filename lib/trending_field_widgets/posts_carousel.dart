import 'package:flutter/material.dart';
import 'package:social_ui_flutter/data/data.dart';
import 'package:social_ui_flutter/models/post.dart';

class PostsCarousel extends StatelessWidget {
  final PageController pageController;
  final String title;
  final List<Post> posts;

  PostsCarousel({this.pageController, this.title, this.posts});

  Widget _buildPost(BuildContext context, int index) {
    Post post = posts[index];
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, widget) {
        double value = 1.0;
        if (pageController.position.haveDimensions) {
          value = pageController.page - index;
          value = (1 - value.abs() * 0.60).clamp(0.0, 1.0);
        }

        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 800.0,
            child: widget,
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0)
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image(
                width: 300.0,
                height: 400.0,
                image: AssetImage(post.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 10.0,
            right: 10.0,
            child: Container(
              height: 100.0,
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    post.title,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                  ),
                  Text(
                    post.location,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 17.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          Text(post.likes.toString())
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.comment,
                            color: Colors.blueAccent,
                          ),
                          Text(post.comments.toString())
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                letterSpacing: 2.0),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          height: 400.0,
          child: PageView.builder(
            controller: pageController,
            pageSnapping: true,
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return _buildPost(context, index);
            },
          ),
        )
      ],
    );
  }
}
