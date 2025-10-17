class RestaurantDao {
  int? idRestaurant, deliveryFee;
  String? name, description, rating, deliveryTime;

  RestaurantDao({this.idRestaurant, this.name, this.description, this.rating, this.deliveryTime, this.deliveryFee});

  factory RestaurantDao.fromMap(Map<String, dynamic> map) {
    return RestaurantDao(
      idRestaurant: map['idRestaurant'],
      deliveryFee: map['deliveryFee'],
      name: map['name'],
      description: map['description'],
      rating: map['rating'],
      deliveryTime: map['deliveryTime'],
    );
  }
}
