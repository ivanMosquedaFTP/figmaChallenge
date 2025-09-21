import 'package:flutter/material.dart';

class ItemDetailsScreen extends StatefulWidget {
  const ItemDetailsScreen({super.key});

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  int quantity = 2;
  int selectedSize = 14;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
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
            height: 200,
            color: Colors.grey,
            child: Image.asset('assets/itemDetailImagePlaceholder.png'),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Burger Bistro',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Image.asset('assets/star.png', height: 20),
                    Text('4.7', style: TextStyle(fontSize: 16)),
                    SizedBox(width: 10),
                    Image.asset('assets/car.png', height: 20),
                    Text('Free', style: TextStyle(fontSize: 16)),
                    SizedBox(width: 10),
                    Image.asset('assets/watch.png', height: 20),
                    Text('20 min', style: TextStyle(fontSize: 16)),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text('SIZE:', style: TextStyle(fontSize: 16)),
                    SizedBox(width: 10),
                    ChoiceChip(
                      showCheckmark: false,
                      shape: CircleBorder(),
                      label: Text(
                        '10"',
                        style: TextStyle(
                          color: selectedSize == 10
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      selected: selectedSize == 10,
                      onSelected: (val) => setState(() => selectedSize = 10),
                      selectedColor: Colors.orange,
                      backgroundColor: Colors.grey[200],
                    ),
                    SizedBox(width: 5),
                    ChoiceChip(
                      showCheckmark: false,
                      shape: CircleBorder(),
                      label: Text(
                        '14"',
                        style: TextStyle(
                          color: selectedSize == 14
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      selected: selectedSize == 14,
                      onSelected: (val) => setState(() => selectedSize = 14),
                      selectedColor: Colors.orange,
                      backgroundColor: Colors.grey[200],
                    ),
                    SizedBox(width: 5),
                    ChoiceChip(
                      showCheckmark: false,
                      shape: CircleBorder(),
                      label: Text(
                        '16"',
                        style: TextStyle(
                          color: selectedSize == 16
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      selected: selectedSize == 16,
                      onSelected: (val) => setState(() => selectedSize = 16),
                      selectedColor: Colors.orange,
                      backgroundColor: Colors.grey[200],
                    ),
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
                      children: [
                        Image.asset('assets/ingredientSalt.png', height: 60),
                        Image.asset('assets/ingredientChicken.png', height: 60),
                        Image.asset('assets/ingredientOnion.png', height: 60),
                        Image.asset('assets/ingredientGarlic.png', height: 60),
                        Image.asset('assets/ingredientPepper.png', height: 60),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
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
                            '\$32',
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
                                  onPressed: () => setState(() => quantity++),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {},
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
      ),
    );
  }
}
