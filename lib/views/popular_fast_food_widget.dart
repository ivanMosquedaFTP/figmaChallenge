import 'package:flutter/material.dart';
import 'package:food_delivery/database/figma_database.dart';
import 'package:food_delivery/models/item_dao.dart';

class PopularFastFoodWidget extends StatefulWidget {
  const PopularFastFoodWidget({super.key});

  @override
  State<PopularFastFoodWidget> createState() => _PopularFastFoodWidgetState();
}

class _PopularFastFoodWidgetState extends State<PopularFastFoodWidget> {
  late Future<List<ItemDao>> _itemsFuture;
  final db = FigmaDatabase();

  @override
  void initState() {
    super.initState();
    _itemsFuture = db.selectItem();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ItemDao>>(
      future: _itemsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        final items = snapshot.data ?? [];
        if (items.isEmpty) {
          return Text('No items found');
        }
        return Wrap(
          spacing: 8.0,
          children: items
              .map(
                (food) => ActionChip(
                  onPressed: () => Navigator.pushNamed(
                    context,
                    "/itemDetails",
                    arguments: {'itemId': food.idItem},
                  ),
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'assets/smImagePlaceholder.png',
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 8),
                          Text(food.name!),
                        ],
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
