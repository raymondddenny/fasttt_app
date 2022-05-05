import 'package:equatable/equatable.dart';

import 'menu_item_model.dart';

class RestaurantModel extends Equatable {
  final int id;
  final String imageUrl;
  final String name;
  final List<String> tags;
  final List<MenuItemModel> menuItems;
  final int deliveryTime;
  final double deliveryFee;
  final double distance;
  const RestaurantModel({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.tags,
    required this.menuItems,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.distance,
  });
  @override
  List<Object?> get props => [
        id,
        imageUrl,
        name,
        tags,
        menuItems,
        deliveryTime,
        deliveryFee,
        distance,
      ];

  static List<RestaurantModel> restaurants = [
    RestaurantModel(
      id: 1,
      imageUrl:
          'https://images.unsplash.com/photo-1514933651103-005eec06c04b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
      name: 'Pizza Hut',
      menuItems: MenuItemModel.menuItems.where((menu) => menu.restaurantId == 1).toList(),
      tags: ['Pizza', 'Burger', 'Drink'],
      deliveryTime: 30,
      deliveryFee: 5,
      distance: 1.5,
    ),
    RestaurantModel(
      id: 2,
      imageUrl:
          'https://images.unsplash.com/photo-1514933651103-005eec06c04b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
      name: 'Pizza Banana',
      menuItems: MenuItemModel.menuItems.where((menu) => menu.restaurantId == 2).toList(),
      tags: ['Pizza', 'Burger', 'Drink'],
      deliveryTime: 30,
      deliveryFee: 5,
      distance: 1.5,
    ),
    RestaurantModel(
      id: 3,
      imageUrl:
          'https://images.unsplash.com/photo-1514933651103-005eec06c04b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
      name: 'Burger Do',
      menuItems: MenuItemModel.menuItems.where((menu) => menu.restaurantId == 3).toList(),
      tags: ['Pizza', 'Burger', 'Drink'],
      deliveryTime: 30,
      deliveryFee: 5,
      distance: 1.5,
    ),
    RestaurantModel(
      id: 4,
      imageUrl:
          'https://images.unsplash.com/photo-1514933651103-005eec06c04b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
      name: 'Huasan Chinese Food',
      menuItems: MenuItemModel.menuItems.where((menu) => menu.restaurantId == 4).toList(),
      tags: ['Rice', 'Pork', 'Drink'],
      deliveryTime: 30,
      deliveryFee: 5,
      distance: 1.5,
    ),
    RestaurantModel(
      id: 5,
      imageUrl:
          'https://images.unsplash.com/photo-1514933651103-005eec06c04b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
      name: 'Salad Time',
      menuItems: MenuItemModel.menuItems.where((menu) => menu.restaurantId == 5).toList(),
      tags: ['Salad', 'Fruit', 'Drink'],
      deliveryTime: 30,
      deliveryFee: 5,
      distance: 1.5,
    ),
  ];
}
