class City {
  final int id;
  final String name;
  final String imageUrl;
  final bool isPopular;

  const City({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.isPopular,
  });
}

final cityLists = [
  City(
    id: 1,
    name: 'Jakarta',
    imageUrl: 'assets/city_one.png',
    isPopular: false,
  ),
  City(
    id: 2,
    name: 'Surabaya',
    imageUrl: 'assets/city_two.png',
    isPopular: true,
  ),
  City(
    id: 3,
    name: 'Semarang',
    imageUrl: 'assets/city_three.png',
    isPopular: false,
  ),
];
