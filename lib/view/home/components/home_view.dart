import 'package:flutter/material.dart';
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
            Row(
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
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.04),
                            child: Text(
                              featured[index],
                              style: TextStyle(
                                fontSize:
                                    selectedIndexOfFeatured == index ? 21 : 18,
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
                Container(
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
                                  left: 3,
                                  child: Row(
                                    children: [
                                      Text(
                                        model.name,
                                        style: AppTheme.homeProductName,
                                      ),
                                      SizedBox(
                                        width: size.width * 0.3,
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.favorite_border,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            )
          ],
        ),
      ),
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
