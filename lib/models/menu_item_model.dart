import 'package:equatable/equatable.dart';

class MenuItemModel extends Equatable {
  final int id;
  final int restaurantId;
  final String name;
  final String description;
  final double price;
  // final String imageUrl;
  const MenuItemModel({
    required this.id,
    required this.restaurantId,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  List<Object?> get props => [
        id,
        restaurantId,
        name,
        description,
        price,
      ];

  static List<MenuItemModel> menuItems = const [
    MenuItemModel(
      id: 1,
      restaurantId: 2,
      name: 'Pizza Fried Chicken',
      description: 'Pizza with fried chicken',
      price: 10,
    ),
    MenuItemModel(
      id: 2,
      restaurantId: 3,
      name: 'Burger Pork',
      description: 'Pork burger with cheese',
      price: 20,
    ),
    MenuItemModel(
      id: 3,
      restaurantId: 2,
      name: 'Salad Chicken',
      description: 'Chicken salad',
      price: 5,
    ),
    MenuItemModel(
      id: 4,
      restaurantId: 4,
      name: 'Rice Chicken',
      description: 'Chicken rice with salad',
      price: 10,
    ),
    MenuItemModel(
      id: 5,
      restaurantId: 5,
      name: 'Ice Cream Vanilla',
      description: 'Vanilla ice cream with chocolate',
      price: 10,
    ),
  ];
}
