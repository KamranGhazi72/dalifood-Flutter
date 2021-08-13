// import 'package:dali_food/controllers/product_controller.dart';
// import 'package:dali_food/models/product.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:scroll_to_index/scroll_to_index.dart';
// import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
// import 'package:visibility_detector/visibility_detector.dart';

// class UberEatsLikeScrollingTabsEffect extends StatefulWidget {
//   @override
//   _UberEatsLikeScrollingTabsEffectState createState() =>
//       _UberEatsLikeScrollingTabsEffectState();
// }

// class _UberEatsLikeScrollingTabsEffectState
//     extends State<UberEatsLikeScrollingTabsEffect>
//     with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {

//   bool _loading = true;
//   /// Controller to scroll or jump to a particular item.
//   final ItemScrollController itemScrollController = ItemScrollController();

//   /// Listener that reports the position of items when the list is scrolled.
//   final ItemPositionsListener itemPositionsListener =
//       ItemPositionsListener.create();

//   late AutoScrollController _autoScrollController;
//   final scrollDirection = Axis.vertical;

//   bool isExpanded = true;

//   late TabController _tabController;

//   List<Product> foodItems = [];
//   final productsController = Get.put(ProductsController());
  
//   final Map<int, bool> _visibleItems = {0: true};

//   bool _isAppBarExpanded(BuildContext context) {
//     if (!_autoScrollController.hasClients) return false;
//     print(
//         "The offset scrolled now is ${_autoScrollController.offset} and the height is now ${(MediaQuery.of(context).size.height / 1.6 - kToolbarHeight)}");

//     return _autoScrollController.offset >
//         (MediaQuery.of(context).size.height / 1.6 - kToolbarHeight);
//   }

//   @override
//   void initState() {
//     _fetchProducts();

//     _tabController = TabController(
//       length: foodItems.length,
//       vsync: this,
//     );
//     _autoScrollController = AutoScrollController(
//       viewportBoundaryGetter: () =>
//           Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
//       axis: scrollDirection,
//     )..addListener(() {
//         if (_isAppBarExpanded(context)) {
//           if (isExpanded) {
//             setState(
//               () {
//                 isExpanded = false;
//                 print('setState is called');
//               },
//             );
//           }
//         } else if (!isExpanded) {
//           setState(() {
//             print('setState is called');
//             isExpanded = true;
//           });
//         }
//       });

//     super.initState();
//   }

//   _fetchProducts() async {
//     var response = await productsController.fetchProducts();
//     print(response['productsItem']);

//     setState(() {
//       foodItems.addAll(response['productsItem']);
//       _loading = false;
//     });
//   }

//   Future _scrollToIndex(int index) async {
//     print(
//         "The offset scrolled now is before updating ${_autoScrollController.offset} and the height is now ${(MediaQuery.of(context).size.height / 1.6 - kToolbarHeight)}");

//     print("The index to scroll to item is this $index");
//     await _autoScrollController.scrollToIndex(index,
//         preferPosition: AutoScrollPosition.begin);
//     await _autoScrollController.highlight(index,
//         animated: true, highlightDuration: Duration(seconds: 2));
//     // itemScrollController.jumpTo(index: index, alignment: 1.00);
//   }

//   Widget _wrapScrollTag({required int index, required Widget child}) {
//     return AutoScrollTag(
//       key: ValueKey(index),
//       controller: _autoScrollController,
//       index: index,
//       child: child,
//       highlightColor: Colors.black.withOpacity(0.1),
//     );
//   }

//   Widget _buildSliverAppbarBackground(BuildContext context) {
//     var imageList = "assets/images/ic_pasta.png";
//     return Column(
//       children: [
//         Stack(
//           children: [
//             Image.network(
//               imageList.isEmpty
//                   ? "assets/images/ic_pizza.png"
//                   : getImageUrlFromApi(imageList),
//               fit: BoxFit.cover,
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height / 4,
//             ),
//             Positioned(
//               child: IconButton(
//                 icon: Icon(
//                   Icons.favorite_border,
//                   color: Colors.white,
//                   size: 32,
//                 ),
//                 onPressed: () {},
//               ),
//               right: 16,
//               top: 32,
//             ),
//             Positioned(
//               child: Container(
//                 decoration:
//                     BoxDecoration(color: Colors.white, shape: BoxShape.circle),
//                 child: IconButton(
//                   icon: Icon(Icons.arrow_back),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ),
//               left: 16,
//               top: 32,
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 16,
//         ),
//         Container(
//             alignment: Alignment.centerLeft,
//             padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//             child: Text(
//               "علی بابا",
//               textAlign: TextAlign.start,
//               style: TextStyle(fontSize: 17)
//             )),
//         Container(
//             alignment: Alignment.centerLeft,
//             padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//             child: Text(
//               "spaciality",
//               textAlign: TextAlign.start,
//             )),
//         Container(
//             padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 _getApproximateTime(),
//                 SizedBox(width: 4),
//                 // Text("4.5"),
//                 // SizedBox(width: 4),
//                 Icon(Icons.star_border, color: Colors.amber, size: 16),
//                 SizedBox(width: 4),
//                 Text("4.5"),
//                 SizedBox(width: 4),
//                 Text("(126) "),
//                 SizedBox(width: 4),
//                 _getApproximateDeliveryFee(),
//               ],
//             )),
//         Container(
//           decoration: BoxDecoration(
//               border: Border.all(width: 1),
//               borderRadius: BorderRadius.all(Radius.circular(8))),
//           margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//           child: ListTile(
//             leading: Icon(
//               Icons.fire_extinguisher,
//               color: Colors.purple,
//             ),
//             title: Text("5 orders earn \$12 reward"),
//             subtitle: Text("\$15 minimum"),
//             trailing: IconButton(
//                 icon: Icon(
//                   Icons.arrow_forward_ios,
//                 ),
//                 onPressed: () {}),
//           ),
//         ),
//         Divider(thickness: 2),
//         ListTile(
//           title: Text(
//             "Store Info",
//           ),
//           trailing: InkWell(
//             child: Text(
//               "More Info",
//               style: TextStyle(color: Colors.green),
//             ),
//           ),
//           subtitle: Padding(
//             padding: const EdgeInsets.only(top: 4),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 Icon(Icons.location_on, size: 16),
//                 Expanded(
//                     child: Text(
//                   "address",
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 )),
//               ],
//             ),
//           ),
//         ),
//         Divider(thickness: 2),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("Menu"),
//               IconButton(
//                 icon: Icon(Icons.search_sharp),
//                 onPressed: () {},
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }

//   Widget _buildSliverAppbar(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return SliverAppBar(
//       brightness: Brightness.light,
//       backgroundColor: Colors.white,
//       pinned: true,
//       snap: false,
//       expandedHeight: size.height / 1.33,
//       leading: !isExpanded
//           ? IconButton(
//               icon: Icon(
//                 Icons.arrow_back,
//                 color: Colors.black,
//               ),
//               onPressed: () => Navigator.of(context).pop(),
//             )
//           : Container(),
//       actions: [
//         !isExpanded
//             ? IconButton(
//                 icon: Icon(
//                   Icons.search,
//                   size: 32,
//                   color: Colors.black,
//                 ),
//                 onPressed: () {
//                   _showSearchSection(context);
//                 },
//               )
//             : Container(),
//       ],
//       title: !isExpanded
//           ? Text(
//               "علی بابا",
//               style: TextStyle(color: Colors.black),
//             )
//           : Container(),
//       flexibleSpace: FlexibleSpaceBar(
//         collapseMode: CollapseMode.parallax,
//         // title: !isExpanded ? Text("Detail View",style: TextStyle(color: blackColor),) : Container(),
//         background: _buildSliverAppbarBackground(context),
//       ),
//       bottom: PreferredSize(
//         preferredSize: Size.fromHeight(40),
//         child: AnimatedOpacity(
//           duration: Duration(milliseconds: 500),
//           opacity: isExpanded ? 0.0 : 1,
//           child: TabBar(
//             controller: _tabController,
//             labelStyle:
//                 TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//             labelColor: Colors.black,
//             indicatorColor: Colors.black,
//             indicatorWeight: 2.5,
//             isScrollable: true,
//             indicatorPadding: EdgeInsets.symmetric(horizontal: 4),
//             onTap: (index) async {
//               _scrollToIndex(index);
//             },
//             tabs: foodItems.map((e) {
//               return Tab(
//                 child: Text("${e.productType}"),

//                 // text: 'Detail Business',
//                 // icon: Icon(Icons.three_k,color: whiteColor,),
//               );
//             }).toList(),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return Scaffold(
//       body: CustomScrollView(
//         controller: _autoScrollController,
//         // shrinkWrap: true,
//         slivers: <Widget>[
//           _buildSliverAppbar(context),
//           SliverList(
//               delegate: SliverChildListDelegate(
//             [
//               _loading?
//                 Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : _buildFoodCategoryBody(),
//             ],
//           )),
//         ],
//       ),
//     );
//   }

//   ListView _buildFoodCategoryBody() {
//     return ListView.builder(
//       // itemScrollController: itemScrollController,
//       // itemPositionsListener: itemPositionsListener,
//       shrinkWrap: true,
//       addAutomaticKeepAlives: true,
//       physics: NeverScrollableScrollPhysics(),
//       itemCount: foodItems.length,
//       itemBuilder: (context, index) => VisibilityDetector(
//         key: Key(foodItems[index].id.toString()),
//         onVisibilityChanged: (info) {
//           // if (!_autoScrollController.isAutoScrolling) return;
//           var visiblePercentage = info.visibleFraction * 100;
//           if (visiblePercentage > 90) {
//             _visibleItems.putIfAbsent(index, () => true);
//           } else {
//             _visibleItems.remove(index);
//           }

//           _calculateIndexAndJumpToTab(_visibleItems);
//         },
//         child: _wrapScrollTag(
//           index: index,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               buildFoodItemCategoryTitle(context, foodItems[index].productName),
//               SizedBox(
//                 height: 16,
//               ),
//               ..._buildCategoryItems(context, index),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   List<Widget> _buildCategoryItems(BuildContext context, int index) {
//     if (foodItems.isEmpty) return [Container()];
//     List<Widget> _list = [];
//     for (int i = 0; i < foodItems.length; i++) {
//       _list.add(_buildSingleFoodItemByCategory(
//           context, foodItems[i]));
//     }
//     return _list;
//   }

//   InkWell _buildSingleFoodItemByCategory(BuildContext context, Product food) {
//     return InkWell(
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                     flex: 3,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Container(
//                           child: Text(
//                             food.productName,
//                             style: Theme.of(context).textTheme.subtitle2,
//                             textAlign: TextAlign.start,
//                           ),
//                           alignment: Alignment.centerLeft,
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Container(
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                             food.productType,
//                             textAlign: TextAlign.start,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Container(
//                           child: Text(
//                             "\$${food.price}",
//                             style: Theme.of(context).textTheme.subtitle2,
//                             textAlign: TextAlign.start,
//                           ),
//                           alignment: Alignment.centerLeft,
//                         ),
//                       ],
//                     )),
//                 SizedBox(
//                   width: 8,
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: FadeInImage.assetNetwork(
//                     placeholder: "assets/images/pizza_image.jpg",
//                     image: food.imageAddress == null || food.imageAddress.isEmpty
//                         ? "assets/images/pizza_image.jpg"
//                         : getImageUrlFromApi(food.imageAddress),
//                     width: MediaQuery.of(context).size.width,
//                     fit: BoxFit.fitHeight,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Divider(
//             thickness: 2,
//             color: Colors.green,
//           )
//         ],
//       ),
//       onTap: () {
//         // todo do something
//       },
//     );
//   }

//   Container buildFoodItemCategoryTitle(BuildContext context, String name) {
//     return Container(
//       alignment: Alignment.centerLeft,
//       padding: EdgeInsets.all(8),
//       child: Text(name),
//     );
//   }

//   Color _getRandomColor(int index) {
//     return [
//       Colors.yellow,
//       Colors.red,
//       Colors.green,
//       Colors.purple,
//       Colors.black,
//       Colors.deepOrange,
//       Colors.grey,
//       Colors.amber,
//       Colors.greenAccent,
//       Colors.pink,
//       Colors.blueGrey,
//       Colors.redAccent
//     ][index];
//   }

//   void _calculateIndexAndJumpToTab(Map<int, bool> visibleItems) async {
//     List<int> indexes = List.from(_visibleItems.keys.toList());
//     indexes.sort();
//     int topMostVisibleItem = indexes.first;
//     _tabController.animateTo(topMostVisibleItem);
//   }

//   @override
//   bool get wantKeepAlive => true;

//   void _showSearchSection(BuildContext context) async {
//     // var result = await showSearch(
//     //     context: context,
//     //     delegate: AppBarSearchWidget(
//     //         ["Pizza", "Coke", "Pumpkin", "Carrot", "Mango"]));
//     // print("The searched result is now this $result");
//   }

//   // String _getFoodSpeciality() {
//   //   List<String> result = [];
//   //   for (var a in foodItems) {
//   //     for (var b in a) {
//   //       for (var c in b.foodSpeciality) {
//   //         if (c.name != null && c.name.isNotEmpty && !result.contains(c.name)) {
//   //           result.add(c.name);
//   //         }
//   //       }
//   //     }
//   //   }
//   //   result.insert(0, "\$");
//   //   return result.join("•");
//   // }

//   Text _getApproximateTime() {
//     return Text("3 mins");
//   }

//   Text _getApproximateDeliveryFee() {
//     return Text("\$14.33");
//   }

//   String getImageUrlFromApi(String rawUrl) {
//     return "https://pbs.twimg.com/media/D1NnSsjXcAAh5bP.jpg";
//   }
// }