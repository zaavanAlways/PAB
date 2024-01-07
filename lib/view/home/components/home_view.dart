import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nakama_shoes/data/dummy_data.dart';
import 'package:nakama_shoes/models/shoe_models.dart';
import 'package:nakama_shoes/theme/custom_app_theme.dart';

import 'package:nakama_shoes/utils/constants.dart';
import 'package:nakama_shoes/view/home/components/home_appBar.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndexOfCategory = 0;
  int selectedIndexOfFeatured = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: const HomeAppBar(),
        body: Column(
          children: [
            _categoryView(size),
            SizedBox(
              height: size.height * 0.01,
            ),
            _mainShoesListView(size),
            _moreTextAndIcon(),
            Container(
              width: size.width,
              height: size.height * 0.28,
              color: Colors.blue,
              child: ListView.builder(
                itemCount: availableShoes.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  ShoeModel model = availableShoes[index];
                  return Container(
                    margin: const EdgeInsets.all(10),
                    width: size.width * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 4,
                          child: Container(
                            width: size.width / 13,
                            height: size.height / 10,
                            color: Colors.cyan,
                            child: const RotatedBox(
                              quarterTurns: -1,
                              child: Center(
                                child: Text(
                                  "New",
                                  style: AppTheme.homeGridNewText,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 5,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_border,
                              color: AppConstantsColor.darkTextColor,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 25,
                          left: 5,
                          child: RotationTransition(
                            turns: AlwaysStoppedAnimation(-15 / 360),
                            child: Hero(
                              tag: model.model,
                              child: Image(
                                image: AssetImage(model.imgAddress),
                                width: size.width * 0.45,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding _moreTextAndIcon() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("More", style: AppTheme.homeMoreText),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.arrow_right,
              size: 27,
            ),
          )
        ],
      ),
    );
  }

  Row _mainShoesListView(Size size) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          width: size.width / 16,
          height: size.height / 2.4,
          child: RotatedBox(
            quarterTurns: -1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: featured.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndexOfFeatured = index;
                    });
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.04),
                    child: Text(
                      featured[index],
                      style: TextStyle(
                        fontSize: selectedIndexOfFeatured == index ? 21 : 18,
                        color: selectedIndexOfFeatured == index
                            ? AppConstantsColor.darkTextColor
                            : AppConstantsColor.unSelectedTextColor,
                        fontWeight: selectedIndexOfFeatured == index
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(
          width: size.width * 0.89,
          height: size.height * 0.4,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: availableShoes.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                ShoeModel model = availableShoes[index];
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: size.width * 0.005,
                        vertical: size.height * 0.01),
                    width: size.width / 1.5,
                    child: Stack(
                      children: [
                        Container(
                          width: size.width / 1.81,
                          decoration: BoxDecoration(
                            color: model.modelColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        Positioned(
                          left: 20,
                          child: Row(
                            children: [
                              Text(
                                model.name,
                                style: AppTheme.homeProductName,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 40,
                          left: 5,
                          child: Row(
                            children: [
                              Text(
                                model.model,
                                style: AppTheme.homeProductName,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 70,
                          left: 10,
                          child: Row(
                            children: [
                              Text(
                                "\$${model.price.toStringAsFixed(2)}",
                                style: AppTheme.homeProductName,
                              ),
                            ],
                          ),
                        ),
                        RotationTransition(
                          turns: const AlwaysStoppedAnimation(-30 / 360),
                          child: SizedBox(
                            width: 220,
                            height: 1000,
                            child: Image(
                              image: AssetImage(model.imgAddress),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 170,
                          child: IconButton(
                            onPressed: () {},
                            icon: const FaIcon(
                              FontAwesomeIcons.arrowAltCircleRight,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }

  Widget _categoryView(Size size) {
    return Row(
      children: [
        SizedBox(
          width: size.width,
          height: size.height * 0.04,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndexOfCategory = index;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      fontSize: selectedIndexOfCategory == index ? 21 : 18,
                      color: selectedIndexOfCategory == index
                          ? AppConstantsColor.darkTextColor
                          : AppConstantsColor.lightTextColor,
                      fontWeight: selectedIndexOfCategory == index
                          ? FontWeight.w600
                          : FontWeight.w400,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
