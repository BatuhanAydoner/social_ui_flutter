import 'package:flutter/material.dart';
import 'package:social_ui_flutter/widgets/trending_field.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "SOCIALLY",
          style: TextStyle(
              color: Theme.of(context).primaryColor, letterSpacing: 10.0),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        leading: IconButton(
            icon: Icon(
              Icons.menu,
            ),
            onPressed: () {}),
        bottom: TabBar(
          tabs: [
            Tab(
              child: Text(
                "Trending",
              ),
            ),
            Tab(
              child: Text(
                "Latest",
              ),
            ),
          ],
          indicatorWeight: 3.0,
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelStyle: TextStyle(fontSize: 18.0),
          isScrollable: false,
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        children: [
          TrendingField(),
          Text("data"),
        ],
        controller: _tabController,
      ),
    );
  }
}
