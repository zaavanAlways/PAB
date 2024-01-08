import 'package:flutter/material.dart';
import 'package:nakama_shoes/components/custom_snackbars.dart';
import 'package:nakama_shoes/data/dummy_data.dart';
import 'package:nakama_shoes/models/models.dart';

class AppMethod {
  AppMethod._();

  static void addToCart(ShoeModel data, BuildContext context) {
    bool contains = itemOnBag.contains(data);

    if (contains) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(CustomSnackBars.failedSnackBar());
    } else {
      itemOnBag.add(data);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(CustomSnackBars.successSnackBar());
    }
  }

  static double allTheItemsOnBag() {
    double sumprice = 0.0;
    for (ShoeModel item in itemOnBag) {
      sumprice = sumprice + item.price;
    }
    return sumprice;
  }
}
