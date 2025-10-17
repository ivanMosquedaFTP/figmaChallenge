import 'package:flutter/material.dart';
import 'package:food_delivery/views/suggested_restaurant_widget.dart';
import 'package:food_delivery/views/popular_fast_food_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<String> recentKeywords = ['Burger', 'Sandwich', 'Pizza', 'Sanwi'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Theme.of(context).appBarTheme.backgroundColor,
            child: SafeArea(
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Color.fromRGBO(236, 240, 244, 100),
                      ),
                    ),
                  ),
                  Text("Search"),
                  Expanded(child: SizedBox.shrink()),
                  Stack(
                    children: [
                      IconButton(
                        icon: Image.asset('assets/shoppingCart.png'),
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            Color.fromRGBO(15, 15, 35, 100),
                          ),
                        ),
                        onPressed: () {},
                      ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '2',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                filled: true,
                fillColor: Color.fromRGBO(236, 240, 244, 100),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recent Keywords',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Wrap(
                    spacing: 8.0,
                    children: recentKeywords
                        .map(
                          (keyword) => ActionChip(
                            label: Text(keyword),
                            onPressed: () =>
                                Navigator.pushNamed(context, "/itemDetails"),
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Suggested Restaurants',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SuggestedRestaurantWidget(),
                  SizedBox(height: 50),
                  Text(
                    'Popular Fast Food',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  PopularFastFoodWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
