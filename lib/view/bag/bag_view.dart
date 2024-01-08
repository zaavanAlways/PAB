import 'package:flutter/material.dart';
import 'package:nakama_shoes/data/dummy_data.dart';
import 'package:nakama_shoes/models/models.dart';
import 'package:nakama_shoes/theme/custom_app_theme.dart';
import 'package:nakama_shoes/utils/app_methods.dart';
import 'package:nakama_shoes/utils/constants.dart';
import 'package:nakama_shoes/view/bag/components/empty_state.dart';

class BagView extends StatefulWidget {
  const BagView({super.key});

  @override
  State<BagView> createState() => _BagViewState();
}

class _BagViewState extends State<BagView> {
  int lengthsOfItemsOnBag = itemOnBag.length;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            width: width,
            height: height,
            child: Column(
              children: [
                _bagAppBar(width, height),
                itemOnBag.isEmpty
                    ? const EmptyState()
                    : Column(
                        children: [
                          _mainProductList(width, height),
                          _bottomInfos(width, height),
                        ],
                      )
              ],
            )),
      ),
    );
  }

  Widget _bottomInfos(double width, double height) {
    return SizedBox(
      width: width,
      height: height * 0.13,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Total", style: AppTheme.bagTotalPrice),
              Text("\$${AppMethod.allTheItemsOnBag()}",
                  style: AppTheme.bagSumOfItemOnBag),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          materialButton(width, height)
        ],
      ),
    );
  }

  materialButton(width, height) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      minWidth: width / 1.2,
      height: height / 15,
      color: AppConstantsColor.materialButtonColor,
      onPressed: () {},
      child: const Text(
        "Next",
        style: TextStyle(color: AppConstantsColor.lightTextColor),
      ),
    );
  }

  Widget _mainProductList(double width, double height) {
    return SizedBox(
      width: width,
      height: height * 0.69,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: itemOnBag.length,
        itemBuilder: (context, index) {
          ShoeModel currentBagItem = itemOnBag[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            width: width,
            height: height * 0.2,
            child: Row(
              children: [
                SizedBox(
                  width: width * 0.4,
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(20),
                        width: width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: currentBagItem.modelColor.withOpacity(0.9),
                        ),
                      ),
                      Positioned(
                        right: 2,
                        bottom: 15,
                        child: RotationTransition(
                          turns: const AlwaysStoppedAnimation(-40 / 360),
                          child: SizedBox(
                            width: 150,
                            height: 150,
                            child: Image(
                              image: AssetImage(
                                currentBagItem.imgAddress,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 14,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(currentBagItem.name, style: AppTheme.bagProductModel),
                    const SizedBox(
                      height: 4,
                    ),
                    Text("\$${currentBagItem.price}",
                        style: AppTheme.bagProductPrice),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              itemOnBag.remove(currentBagItem);
                              lengthsOfItemsOnBag = itemOnBag.length;
                            });
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[300],
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.remove,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text("1", style: AppTheme.bagProductNumOfShoe),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[300],
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                size: 15,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  SizedBox _bagAppBar(double width, double height) {
    return SizedBox(
      width: width,
      height: height / 14,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Keranjang", style: AppTheme.bagTitle),
          Text(
            "Total $lengthsOfItemsOnBag Items",
            style: AppTheme.bagTotalPrice,
          )
        ],
      ),
    );
  }
}
