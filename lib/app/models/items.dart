class Item {
  final String imgPath;
  final int price;
  final String name;
  const Item({
    required this.imgPath,
    required this.price,
    required this.name,
  });
}

const items = <Item>[
  Item(name: "Product 1", imgPath: "assets/img/1.jpg", price: 12),
  Item(name: "Product 2", imgPath: "assets/img/3.jpg", price: 11),
  Item(name: "Product 3", imgPath: "assets/img/5.jpg", price: 17),
  Item(name: "Product 4", imgPath: "assets/img/7.jpg", price: 12),
  Item(name: "Product 5", imgPath: "assets/img/8.jpg", price: 10),
  Item(name: "Product 6", imgPath: "assets/img/9.jpg", price: 18),
  Item(name: "Product 7", imgPath: "assets/img/10.jpg", price: 14),
  Item(name: "Product 8", imgPath: "assets/img/12.jpg", price: 12),
];
