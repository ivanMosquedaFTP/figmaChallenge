import 'package:flutter/material.dart';
import 'package:food_delivery/screens/itemDetails_screen.dart';
import 'package:food_delivery/screens/login_screen.dart';
import 'package:food_delivery/screens/restaurantView_screen.dart';
import 'package:food_delivery/screens/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food delivery',
      initialRoute: '/login',
      routes: {
        "/login": (context) => LoginScreen(),
        "/itemDetails": (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>?;
          final itemId =
              args?['itemId'] as int? ?? 1; // fallback to 1 if no arg
          return ItemDetailsScreen(itemId: itemId);
        },
        "/restaurantView": (context) => RestaurantViewScreen(),
        "/search": (context) => SearchScreen(),
      },
      // home: LoginScreen(),
    );
  }
}
