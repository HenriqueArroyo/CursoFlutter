class City {
  final String cityName;
  bool favoritesCities;

  City({required this.cityName, required this.favoritesCities});

  Map<String, dynamic> toMap() {
    return {
      'cityname': cityName,
      'favoritescities': favoritesCities,
    };
  }

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      cityName: map['cityname'],
      favoritesCities: map['favoritescities'],
    );
  }

  void toggleFavorite() {
    favoritesCities = !favoritesCities;
  }
}
