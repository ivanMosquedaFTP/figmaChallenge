import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<String> recentKeywords = ['Burger', 'Sandwich', 'Pizza', 'Sanwi'];
  final List<Map<String, dynamic>> suggestedRestaurants = [
    {'name': 'Pansi Restaurant', 'rating': 4.7},
    {'name': 'American Spicy Burger Shop', 'rating': 4.3},
    {'name': 'Cafenio Coffee Club', 'rating': 4.0},
  ];
  final List<String> popularFastFood = ['European Pizza', 'Buffalo Pizza'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            suffixIcon: Stack(
              children: [
                IconButton(
                  icon: Image.asset('/assets/shoppingCart.png'),
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
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
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
                    .map((keyword) => Chip(label: Text(keyword)))
                    .toList(),
              ),
              SizedBox(height: 16),
              Text(
                'Suggested Restaurants',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ...suggestedRestaurants.map(
                (rest) => ListTile(
                  leading: Image.asset('/assets/smImagePlaceholder.png'),
                  title: Text(rest['name']),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('/assets/star.png', height: 16),
                      Text(rest['rating'].toString()),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Popular Fast Food',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Wrap(
                spacing: 8.0,
                children: popularFastFood
                    .map((food) => Chip(label: Text(food)))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
