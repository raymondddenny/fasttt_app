import 'package:fasttt/screens/basket/basket_screen.dart';
import 'package:fasttt/screens/checkout/checkout_screen.dart';
import 'package:fasttt/screens/delivery_time/delivery_time_screen.dart';
import 'package:fasttt/screens/filter/filter_screen.dart';
import 'package:fasttt/screens/home/homescreen.dart';
import 'package:fasttt/screens/location/location_screen.dart';
import 'package:fasttt/screens/restaurant_details/restaurant_detail_screen.dart';
import 'package:fasttt/screens/restaurant_listing/restaurant_listing_screen.dart';
import 'package:fasttt/screens/voucher/voucher_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case LocationScreen.routeName:
        return LocationScreen.route();
      case BasketScreen.routeName:
        return BasketScreen.route();
      case CheckOutScreen.routeName:
        return CheckOutScreen.route();
      case DeliveryTimeScreen.routeName:
        return DeliveryTimeScreen.route();
      case FilterScreen.routeName:
        return FilterScreen.route();
      case RestaurantDetailScreen.routeName:
        return RestaurantDetailScreen.route();
      case RestaurantListingScreen.routeName:
        return RestaurantListingScreen.route();
      case VoucherScreen.routeName:
        return VoucherScreen.route();
      default:
        _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
          appBar: AppBar(
        title: const Text('Error'),
      )),
      settings: const RouteSettings(name: '/error'),
    );
  }
}
