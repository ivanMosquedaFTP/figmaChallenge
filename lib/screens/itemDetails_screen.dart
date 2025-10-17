import 'package:flutter/material.dart';
import 'package:food_delivery/database/figma_database.dart';
import 'package:food_delivery/models/item_dao.dart';
import 'package:food_delivery/models/restaurant_dao.dart';

class ItemDetailsScreen extends StatefulWidget {
  final int itemId;

  const ItemDetailsScreen({super.key, required this.itemId});

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  int quantity = 1; // defaulting to 1
  String selectedSize = 'M'; // defaulting to M, will use first avail if empty
  bool isFavorite = false;
  late Future<Map<String, dynamic>> _dataFuture; // item + restaurant
  final db = FigmaDatabase();

  @override
  void initState() {
    super.initState();
    _dataFuture = _loadData();
  }

  Future<Map<String, dynamic>> _loadData() async {
    final item = (await db.selectItem()).firstWhere(
      (i) => i.idItem == widget.itemId,
      orElse: () => throw Exception('Item not found'),
    );
    final restaurant = (await db.selectRestaurant()).firstWhere(
      (r) => r.idRestaurant == item.idRestaurant,
      orElse: () => throw Exception('Restaurant not found'),
    );
    if (item.availableSizes.isNotEmpty) selectedSize = item.availableSizes[0];
    quantity = 1;
    return {'item': item, 'restaurant': restaurant};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
        future: _dataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final data = snapshot.data!;
          final item = data['item'] as ItemDao;

          return Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios_sharp),
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.white),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : null,
                      ),
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.white),
                      ),
                      onPressed: () => setState(() => isFavorite = !isFavorite),
                    ),
                  ],
                ),
              ),
              Container(
                height: 300,
                color: Colors.grey,
                child: Image.asset(
                  'assets/itemDetailImagePlaceholder.png', // TODO: add image field to DB later
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          item.name ?? 'Unknown Item',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Center(
                          child: Container(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/star.png', height: 20),
                                Text(
                                  item.rating ?? 'N/A',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(width: 10),
                                Image.asset('assets/car.png', height: 20),
                                Text(
                                  '${item.deliveryFee == 0 ? 'Free' : '\$${item.deliveryFee}'}',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(width: 10),
                                Image.asset('assets/watch.png', height: 20),
                                Text(
                                  item.deliveryTime ?? 'N/A',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      item.description ?? 'No description',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text('SIZE:', style: TextStyle(fontSize: 16)),
                        SizedBox(width: 10),
                        ...item.availableSizes
                            .map(
                              (size) => Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: ChoiceChip(
                                  showCheckmark: false,
                                  shape: CircleBorder(),
                                  label: Text(
                                    size,
                                    style: TextStyle(
                                      color: selectedSize == size
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  selected: selectedSize == size,
                                  onSelected: (val) =>
                                      setState(() => selectedSize = size),
                                  selectedColor: Colors.orange,
                                  backgroundColor: Colors.grey[200],
                                ),
                              ),
                            )
                            .toList(),
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'INGREDIENTS',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: item.ingredients
                              .map(
                                (ing) => Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    child: Image.asset(
                                      'assets/ingredient${ing}.png', // assuming naming like Salt.png
                                      height: 60,
                                      errorBuilder: (_, __, ___) => Icon(
                                        Icons.fastfood,
                                      ), // Fallback if asset missing
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                    SizedBox(height: 100),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                '\$${item.cost}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(18, 18, 35, 100),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      color: Colors.white,
                                      onPressed: () => setState(
                                        () => quantity > 1 ? quantity-- : null,
                                      ),
                                    ),
                                    Text(
                                      '$quantity',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      color: Colors.white,
                                      onPressed: () =>
                                          setState(() => quantity++),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {}, // TODO: add cart logic
                            child: Text(
                              'ADD TO CART',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              minimumSize: Size(double.infinity, 50),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
