import 'package:flutter/material.dart';

import '../models/models.dart';

final List<ShoeModel> availableShoes = [
  ShoeModel(
    name: "Adidas",
    model: "Fashion",
    price: 110.00,
    imgAddress: "assets/images/Adidas.png",
    modelColor: const Color(0xffDE0106),
  ),
  ShoeModel(
    name: "Airjordan",
    model: "Fashion",
    price: 120.00,
    imgAddress: "assets/images/airJordan.png",
    modelColor: const Color(0xff3F7943),
  ),
  ShoeModel(
    name: "Asics",
    model: "Fashion",
    price: 130.00,
    imgAddress: "assets/images/asics.png",
    modelColor: const Color(0xffE66863),
  ),
  ShoeModel(
    name: "Converse",
    model: "Fashion",
    price: 140.00,
    imgAddress: "assets/images/converse.png",
    modelColor: const Color(0xffDE0106),
  ),
  ShoeModel(
    name: "DC_Shoes",
    model: "Fashion",
    price: 150.00,
    imgAddress: "assets/images/DC_shoes.png",
    modelColor: const Color(0xff3F7943),
  ),
  ShoeModel(
    name: "Fila",
    model: "Fashion",
    price: 160.00,
    imgAddress: "assets/images/fila.png",
    modelColor: const Color(0xffE66863),
  ),
  ShoeModel(
    name: "Macbeth",
    model: "Fashion",
    price: 170.00,
    imgAddress: "assets/images/macbeth.png",
    modelColor: const Color(0xffDE0106),
  ),
  ShoeModel(
    name: "Newbalance",
    model: "Fashion",
    price: 180.00,
    imgAddress: "assets/images/newBalance.png",
    modelColor: const Color(0xff3F7943),
  ),
  ShoeModel(
    name: "Nike",
    model: "Fashion",
    price: 190.00,
    imgAddress: "assets/images/Nike.png",
    modelColor: const Color(0xffE66863),
  ),
  ShoeModel(
    name: "Puma",
    model: "Fashion",
    price: 200.00,
    imgAddress: "assets/images/puma.png",
    modelColor: const Color(0xffDE0106),
  ),
  ShoeModel(
    name: "Reebok",
    model: "Fashion",
    price: 210.00,
    imgAddress: "assets/images/reebok.png",
    modelColor: const Color(0xff3F7943),
  ),
  ShoeModel(
    name: "Saucony",
    model: "Fashion",
    price: 220.00,
    imgAddress: "assets/images/saucony.png",
    modelColor: const Color(0xffE66863),
  ),
  ShoeModel(
    name: "Skechers",
    model: "Fashion",
    price: 230.00,
    imgAddress: "assets/images/skechers.png",
    modelColor: const Color(0xffDE0106),
  ),
  ShoeModel(
    name: "Vans",
    model: "Fashion",
    price: 240.00,
    imgAddress: "assets/images/vans.png",
    modelColor: const Color(0xff3F7943),
  ),
  ShoeModel(
    name: "Yeezy",
    model: "Fashion",
    price: 250.00,
    imgAddress: "assets/images/yeezy.png",
    modelColor: const Color(0xffE66863),
  ),
];

List<ShoeModel> itemOnBag = [];

final List<UserStatus> userStatus = [
  UserStatus(
    emoji: '😴',
    txt: "away",
    selectColor: const Color(0xff121212),
    unSelectColor: const Color(0xffbfbfbf),
  ),
  UserStatus(
    emoji: '🖥️',
    txt: "At Work",
    selectColor: const Color(0xff05a35c),
    unSelectColor: const Color(0xffCEEBD9),
  ),
  UserStatus(
    emoji: '🎮',
    txt: "Gaming",
    selectColor: const Color(0xffFFD237),
    unSelectColor: const Color(0xffFDDF88),
  ),
  UserStatus(
    emoji: '🤫',
    txt: "Busy",
    selectColor: const Color(0xffba3a3a),
    unSelectColor: const Color(0xffdb9797),
  ),
];

final List categories = [
  'Adidas',
  'Jordan',
  'Asics',
  'Converse',
  'DC_Shoes',
  'Fila',
  'Macbeth',
  'NewBalance',
  'Nike',
  'Puma',
  'Reebok',
  'Saucony',
  'Skechers',
  'Vans',
  'Yeezy',
];
final List featured = [
  'New',
  'Featured',
  'Upcoming',
];
final List<double> sizes = [6, 7.5, 8, 9.5];
