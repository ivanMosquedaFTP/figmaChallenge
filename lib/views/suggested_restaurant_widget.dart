import 'package:flutter/material.dart';
import 'package:food_delivery/database/figma_database.dart';
import 'package:food_delivery/models/restaurant_dao.dart'; // Adjust

class SuggestedRestaurantWidget extends StatefulWidget {
  const SuggestedRestaurantWidget({super.key});

  @override
  State<SuggestedRestaurantWidget> createState() =>
      _SuggestedRestaurantWidgetState();
}

class _SuggestedRestaurantWidgetState extends State<SuggestedRestaurantWidget> {
  late Future<List<RestaurantDao>> _restaurantsFuture;
  final db = FigmaDatabase();

  @override
  void initState() {
    super.initState();
    _restaurantsFuture = db.selectRestaurant();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RestaurantDao>>(
      future: _restaurantsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        final restaurants = snapshot.data ?? [];
        if (restaurants.isEmpty) {
          return Text('No restaurants found');
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: restaurants
              .map(
                (rest) => ListTile(
                  leading: Image.asset('assets/smImagePlaceholder.png'),
                  title: Text(rest.name!),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/star.png', height: 16),
                      Text(rest.rating!),
                      SizedBox(width: 10),
                      IconButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, "/restaurantView"),
                        icon: Icon(Icons.chevron_right_sharp),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
