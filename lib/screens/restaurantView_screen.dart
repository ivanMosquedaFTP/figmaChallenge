import 'package:flutter/material.dart';

class RestaurantViewScreen extends StatefulWidget {
  const RestaurantViewScreen({super.key});

  @override
  State<RestaurantViewScreen> createState() => _RestaurantViewScreenState();
}

class _RestaurantViewScreenState extends State<RestaurantViewScreen> {
  String selectedProduct = "burger";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  icon: Icon(Icons.more_horiz_sharp),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.white),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Container(
            height: 300,
            color: Colors.grey,
            child: Image.asset(
              'assets/itemDetailImagePlaceholder.png',
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
                      'Spicy restaurant',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 10),
                    ChoiceChip(
                      showCheckmark: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      label: Text(
                        'Burger',
                        style: TextStyle(
                          color: selectedProduct == "burger"
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      selected: selectedProduct == "burger",
                      onSelected: (val) =>
                          setState(() => selectedProduct = "burger"),
                      selectedColor: Colors.orange,
                      backgroundColor: Colors.grey[200],
                    ),
                    SizedBox(width: 5),
                    ChoiceChip(
                      showCheckmark: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      label: Text(
                        'Sandwich',
                        style: TextStyle(
                          color: selectedProduct == "sandwich"
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      selected: selectedProduct == "sandwich",
                      onSelected: (val) =>
                          setState(() => selectedProduct = "sandwich"),
                      selectedColor: Colors.orange,
                      backgroundColor: Colors.grey[200],
                    ),
                    SizedBox(width: 5),
                    ChoiceChip(
                      showCheckmark: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      label: Text(
                        'Pizza',
                        style: TextStyle(
                          color: selectedProduct == "pizza"
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      selected: selectedProduct == "pizza",
                      onSelected: (val) =>
                          setState(() => selectedProduct = "pizza"),
                      selectedColor: Colors.orange,
                      backgroundColor: Colors.grey[200],
                    ),
                    SizedBox(width: 5),
                    ChoiceChip(
                      showCheckmark: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      label: Text(
                        'Sanwi',
                        style: TextStyle(
                          color: selectedProduct == "sanwi"
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      selected: selectedProduct == "sanwi",
                      onSelected: (val) =>
                          setState(() => selectedProduct = "sanwi"),
                      selectedColor: Colors.orange,
                      backgroundColor: Colors.grey[200],
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
