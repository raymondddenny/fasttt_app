import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class CategoryModel extends Equatable {
  final int id;
  final String name;
  final Image image;

  const CategoryModel({required this.id, required this.name, required this.image});
  @override
  List<Object?> get props => [id, name, image];

  static List<CategoryModel> categoryMock = [
    CategoryModel(
      id: 1,
      name: 'Pizza',
      image: Image.asset('assets/pizza.png'),
    ),
    CategoryModel(
      id: 2,
      name: 'Burger',
      image: Image.asset('assets/burger.png'),
    ),
    CategoryModel(
      id: 3,
      name: 'Drink',
      image: Image.asset('assets/drink.png'),
    ),
    CategoryModel(
      id: 4,
      name: 'dessert',
      image: Image.asset('assets/dessert.png'),
    ),
    CategoryModel(
      id: 5,
      name: 'Salad',
      image: Image.asset('assets/salad.png'),
    ),
  ];
}
