import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';

class ResturantFood extends StatefulWidget {
  const ResturantFood({ Key? key }) : super(key: key);

  @override
  _ResturantFoodState createState() => _ResturantFoodState();
}

class _ResturantFoodState extends State<ResturantFood> with SingleTickerProviderStateMixin {
  

  @override
  Widget build(BuildContext context) {

    final List<Tab> tabs = <Tab>[
      new Tab(text: "پر طرفدارترین"),
      new Tab(text: "برگرها"),
      new Tab(text: "پیتزا"),
      new Tab(text: "سبزیجات"),
      new Tab(text: "نوشیدنی سرد")
    ];

    TabController? _tabController;

    @override
    void initState() {
      super.initState();
      _tabController = new TabController(vsync: this, length: tabs.length);
    }

    @override
    void dispose() {
      _tabController!.dispose();
      super.dispose();
    }


    
    return DefaultTabController(
      length: 5,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: TabBar(
            isScrollable: true,
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: new BubbleTabIndicator(
              indicatorHeight: 40.0,
              indicatorColor: Colors.blueAccent,
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
              // Other flags
              // indicatorRadius: 1,
              insets: EdgeInsets.all(1),
              padding: EdgeInsets.all(10),
            ),
            tabs: tabs,
            controller: _tabController,
        ),
          ),
      Container(
        height: MediaQuery.of(context).size.height / 1.5,
        child: TabBarView(
          controller: _tabController,
          children: tabs.map((Tab tab) {
            return new Center(
                child: new Text(
              tab.text!,
              style: new TextStyle(fontSize: 20.0),
            ));
          }).toList(),
        
    ),
      ),
        ],
      ),
    );

  }
}