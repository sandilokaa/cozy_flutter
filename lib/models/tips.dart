class Tips {
  final int id;
  final String name;
  final String imageUrl;
  final String updatedAT;

  const Tips({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.updatedAT,
  });
}

final tipsLists = [
  Tips(
    id: 1,
    name: 'City Guidlines',
    imageUrl: 'assets/cg_icon.png',
    updatedAT: '20 Apr',
  ),
  Tips(
    id: 2,
    name: 'Jakarta Fairship',
    imageUrl: 'assets/jf_icon.png',
    updatedAT: '11 Dec',
  ),
];
