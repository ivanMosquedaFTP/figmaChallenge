class ItemDao {
  int? idItem, idRestaurant, cost, deliveryFee;
  String? name, rating, deliveryTime, description;
  List<String> availableSizes, ingredients;
  ItemDao({
    this.idItem,
    this.idRestaurant,
    this.name,
    this.cost,
    this.deliveryFee,
    this.rating,
    this.deliveryTime,
    this.description,
    required this.availableSizes,
    required this.ingredients,
  });
  factory ItemDao.fromMap(Map<String, dynamic> map) {
    var avail = map['availableSizes'];
    var ing = map['ingredients'];
    return ItemDao(
      idItem: map['idItem'],
      idRestaurant: map['idRestaurant'],
      cost: map['cost'],
      deliveryFee: map['deliveryFee'],
      name: map['name'],
      rating: map['rating'],
      deliveryTime: map['deliveryTime'],
      description: map['description'],
      availableSizes: (avail is String)
          ? (avail.isEmpty ? [] : avail.split(','))
          : List<String>.from(avail ?? []),
      ingredients: (ing is String)
          ? (ing.isEmpty ? [] : ing.split(','))
          : List<String>.from(ing ?? []),
    );
  }
}
