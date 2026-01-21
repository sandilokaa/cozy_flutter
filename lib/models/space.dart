class Space {
  final int id;
  final String name;
  final String imageUrl;
  final int price;
  final String city;
  final String country;
  final int rating;

  const Space({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.city,
    required this.country,
    required this.rating,
  });
}

final spaceLists = [
  Space(
    id: 1,
    name: 'Kretakeso Hott',
    imageUrl: 'assets/space_one.png',
    price: 250,
    city: 'Jakarta',
    country: 'Indonesia',
    rating: 4,
  ),
  Space(
    id: 2,
    name: 'Urban Space Hub',
    imageUrl: 'assets/space_two.png',
    price: 180,
    city: 'Bandung',
    country: 'Indonesia',
    rating: 4,
  ),
  Space(
    id: 3,
    name: 'Ocean View',
    imageUrl: 'assets/space_three.png',
    price: 320,
    city: 'Denpasar',
    country: 'Indonesia',
    rating: 4,
  ),
];
