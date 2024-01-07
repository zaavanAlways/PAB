import 'package:flutter/material.dart';

import '../models/models.dart';

final List<ShoeModel> availableShoes = [
  ShoeModel(
    name: "Adidas",
    model: "Air-Max",
    price: 130.00,
    imgAddress: "assets/images/Adidas.jpg",
    modelColor: const Color(0xffDE0106),
  ),
  ShoeModel(
    name: "Nike",
    model: "Air-Jordan",
    price: 190.00,
    imgAddress: "assets/images/airJordan.jpg",
    modelColor: const Color(0xff3F7943),
  ),
  ShoeModel(
    name: "Asics",
    model: "Nike-Asics",
    price: 160.00,
    imgAddress: "assets/images/asics.jpg",
    modelColor: const Color(0xffE66863),
  ),
  ShoeModel(
    name: "Converse",
    model: "Nika",
    price: 150.00,
    imgAddress: "assets/images/converse.jpg",
    modelColor: const Color(0xffE2E3E5),
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
  'Nike',
  'Adidas',
  'Jordan',
  'Puma',
  'Gucci',
  'Tom Ford',
  'Koio',
];
final List featured = [
  'New',
  'Featured',
  'Upcoming',
];
final List<double> sizes = [6, 7.5, 8, 9.5];
